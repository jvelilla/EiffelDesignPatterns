note

	description:

		"Visitor"

	library: "Visitor library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class VISITOR [G]

create

	make

feature {NONE} -- Initialization

	make
			-- Initialize `actions'.
		do
			create actions.make (Initial_capacity)
			create sorter.make (Initial_capacity)
			create type_ids.make (Initial_capacity)
			create expanded_items.make
			create actions_cache2.make (initial_capacity)
			catch_all_agent := agent catch_all
		end

feature -- Visitor

	visit (an_element: G)
			-- Visit `an_element'. (Select the appropriate action
			-- depending on `an_element'.)
		require
			an_element_not_void: an_element /= Void
		local
			internal: INTERNAL
			type_id: INTEGER
			args: TUPLE [G]
			i: INTEGER
			l_actions_cache: ARRAY [PROCEDURE [TUPLE [G]]]
			l_name: STRING
		do
			args := [an_element]

			create internal
			if attached an_element as l_element  then
				create l_name.make_from_separate (l_element.generator)
				type_id := internal.dynamic_type_from_string (l_name)
			end
			l_actions_cache := actions_cache2.to_array

			if l_actions_cache.valid_index (type_id) and then l_actions_cache.item (type_id) /= Void then
				l_actions_cache.item (type_id).call (an_element)
			else
				from
					i := actions.count
				until
					i < 1 or else actions.item (i).valid_operands (an_element)
				loop
					i := i - 1
				end

				if i >= 1 and i <= actions.count then
					actions.item (i).call (an_element)
					actions_cache2.force (actions.item (i))
				else
					catch_all (an_element)
					actions_cache2.force (catch_all_agent)
				end
			end
		end

feature -- Access

	actions: DS_ARRAYED_LIST [PROCEDURE [TUPLE [G]]]
			-- Actions to be performed depending on the element

feature -- Element change

	extend (an_action: PROCEDURE [TUPLE [G]])
			-- Extend `actions' with `an_action'.
		require
			an_action_not_void: an_action /= Void
		do
			prepare_topological_sort (an_action)
			topological_sort
			fill_cache
		ensure
			has_an_action: actions.has (an_action)
		end

	append (some_actions: ARRAY [PROCEDURE [TUPLE [G]]])
			-- Append actions in `some_actions' to the end of the `actions' list.
		require
			some_actions_not_void: some_actions /= Void
--			no_void_action: not some_actions.has ([])
		local
			i: INTEGER
		do
			from i := some_actions.lower until i > some_actions.upper loop
				prepare_topological_sort (some_actions.item (i))
				i := i + 1
			end
			topological_sort
			fill_cache
		end

feature {NONE} -- Implementation (Access

	sorter: DS_HASH_TOPOLOGICAL_SORTER [PROCEDURE [TUPLE [G]]]
			-- Topological sorter;
			-- The relation used for topological sort is the conformance
			-- of the dynamic type of the agent operands

	type_ids: DS_HASH_TABLE [INTEGER, PROCEDURE [TUPLE [G]]]
			-- Hash table of type ids indexed by actions

	expanded_items: DS_LINKED_LIST [PROCEDURE [TUPLE [G]]]
			-- Actions applied to expanded types

	actions_cache2: ARRAYED_LIST [PROCEDURE [TUPLE [G]]]
			-- Cache with actions indexed by type id


feature {NONE} -- Implementation (Constants)

	Initial_capacity: INTEGER = 10
			-- Initial capacity of `actions', `sorter', and `type_ids'

feature {NONE} -- Implementation (Topological sort)

	prepare_topological_sort (an_action: PROCEDURE [TUPLE [G]])
			-- Add `an_action' to the topological `sorter'.
		require
			an_action_not_void: an_action /= Void
		local
			internal: INTERNAL
			operands: TUPLE --[G]
			type_id: INTEGER
		do
			if an_action.open_count = 1 then
					-- Add `an_action' to the `sorter'.
				sorter.force (an_action)

					-- Calculate the type id of the open operand of `an_action'.
				if attached an_action.operands as l_operands  then
					operands := l_operands

						-- Exclude the expanded items.
						-- (Because no type conforms to an expanded type,
						-- expanded items will be considered as the most
						-- specific items and inserted at the end of the
						-- topologically sorted list.)
					if operands.is_boolean_item (1)
						or else operands.is_character_item (1)
						or else operands.is_wide_character_item (1)
						or else operands.is_double_item (1)
						or else operands.is_integer_8_item (1)
						or else operands.is_integer_16_item (1)
						or else operands.is_integer_item (1)
						or else operands.is_integer_64_item (1)
						or else operands.is_pointer_item (1)
						or else operands.is_real_item (1)
					then
						expanded_items.put_last (an_action)
					elseif operands.is_reference_item (1) then
						create internal
						type_id := internal.generic_dynamic_type (operands, 1)

							-- Calculate the relations between `an_action'
							-- and the actions already in `type_ids'
							-- and add these new relations to the `sorter'.
						from type_ids.start until type_ids.after loop
							if internal.type_conforms_to (type_id, type_ids.item_for_iteration) then
								sorter.put_relation (type_ids.key_for_iteration, an_action)
							elseif internal.type_conforms_to (type_ids.item_for_iteration, type_id) then
								sorter.put_relation (an_action, type_ids.key_for_iteration)
							end
							type_ids.forth
						end

							-- Add `an_action' associated with `type_id' to `type_ids'.
						type_ids.force (type_id, an_action)
					end
				end
			else
				debug
					io.put_string ("The given action has more than one open operand.%N")
				end
			end
		end

	topological_sort
			-- Perform the topological sort.
		do
			sorter.sort
			if not sorter.has_cycle then
				if attached sorter.sorted_items as l_sorted then
					actions := l_sorted
						-- Add action applied to an expanded type if any.
					from expanded_items.start until expanded_items.after loop
						actions.force_last (expanded_items.item_for_iteration)
						expanded_items.forth
					end
				end

			else
				debug
					io.put_string ("The topological sort ended with cycles. There must be a hole in the Eiffel type system.%N")
				end
			end
		end

feature {NONE} -- Implementation (Cache)

	fill_cache
			-- Fill `actions_cache' with actions in `type_ids' indexed by type id.
		local
			lower: INTEGER
			upper: INTEGER
		do
			actions_cache2.wipe_out

			lower := actions_cache2.lower
			upper := actions_cache2.upper
			from type_ids.start until type_ids.after loop
				if type_ids.item_for_iteration < lower then
					lower := type_ids.item_for_iteration
				end
				if type_ids.item_for_iteration > upper then
					upper := type_ids.item_for_iteration
				end
				type_ids.forth
			end
--			actions_cache.conservative_resize (lower, upper)

			from type_ids.start until type_ids.after loop
				actions_cache2.put_i_th (type_ids.key_for_iteration, type_ids.item_for_iteration)
				type_ids.forth
			end
		end

	catch_all (an_element: G)
			-- Routine called when no action is found for `an_element'
		do
		end

	catch_all_agent: PROCEDURE [TUPLE [G]]
			-- Agent on `catch_all'

invariant

	actions_not_void: actions /= Void
--	no_void_action: not actions.has (Void)
	sorter_not_void: sorter /= Void
	type_ids_not_void: type_ids /= Void
--	no_void_type_id: not type_ids.has (Void)
	expanded_items_not_void: expanded_items /= Void
--	no_void_expanded_item_not_void: not expanded_items.has (Void)
	actions_cache2_not_void: actions_cache2 /= Void
	catch_all_agent_not_void: catch_all_agent /= Void

end
