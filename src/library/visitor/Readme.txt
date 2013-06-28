
Visitor Library: Implementation
-------------------------------

The final version of the Visitor Library still uses a list of possible 
actions, but it makes sure that the actions are properly sorted. As a 
consequence, the client can be sure that the selected action is the most 
appropriate one. Furthermore, the implementation uses a cache for better 
performance. When `visit' gets called, the list of actions is traversed 
linearly only if no associated action was initally found in a cache.

Actions are sorted topologically when the client inserts the actions 
into the visitor by calling `extend' (to insert just one action) or `append' 
(to insert several actions at a time). The relation used for the topological
sort is the conformance of the dynamic type of the actions’ open operands
(i.e. the dynamic type of the objects on which the agents will be applied).

The conformance tests rely on a couple of queries from class INTERNAL. 
But the system is still type-safe because these queries are only used to 
ask the conformance between two types known by the system. Therefore it is
sure that they will return a correct result.

The algorithm has two passes: first, we prepare the topological sort (in 
particular, we calculate the conformance relations between types); second, 
we perform the topological sort.

Preparation of the topological sort
-----------------------------------
First, we need to get the dynamic type of the agents’ open operands. This 
requires the introspection facilities provided by the class INTERNAL of the 
EiffelBase library. We need to proceed in two steps:

* Retrieve the operands of the agent (representing the action to be sorted) 
  by calling the query `operands'. It gives us a TUPLE [G] since the actions 
  are of type PROCEDURE [ANY, TUPLE [G]].

* Call `generic_dynamic_type', which returns the dynamic type id of the generic 
  parameter of the given object (here the agent’s operands) at the given position
  (here 1 because the action should have only one open operand).

The function `generic_dynamic_type' only works on objects of reference types. 
This is why the algorithm (in feature `prepare_topological_sort') first separates
the actions with operands of expanded types and puts them in a list (`expanded_types') 
before calling `generic_dynamic_type'. This limitation of `generic_dynamic_type'
is not a problem because no type conforms to an expanded type. Thus we can put 
them at the end of the sorted list of actions (see the implementation of 
`topological_sort') and be sure the topological sort is still valid.

The type ids are stored in a hash table (`type_ids') indexed by agents.

The next step is to calculate the relations between those types. We use 
another feature of class INTERNAL, `type_conforms_to', which tells whether
a type conforms to another type, based on their type ids. If a type A 
conforms to a type B, we put a relation (action corresponding to type B, 
action corresponding to type A) in the topological sorter, and conversely.

Topological sort
----------------
The topological sort relies on DS_HASH_TOPOLOGICAL_SORTER [G -> HASHABLE] 
of the Gobo Eiffel Data Structure Library. (I can use it because PROCEDURE 
inherits from HASHABLE.) The procedure `prepare_topological_sort' already 
took care of putting the actions to be sorted and the relations between 
those actions into the sorter. Thus, `topological_sort' simply needs to 
call sort on the sorter and attach the resulting sorted list of actions 
(`sorted_items') to the list of actions, which will be used by the feature
`visit' to determine the action applicable to a given element.

Compared to the previous iteration of the Visitor Library, `actions' is now
a DS_ARRAYED_LIST instead of a LINKED_LIST because the DS_HASH_TOPOLOGICAL_SORTER 
works on the Gobo Eiffel Kernel Library classes only (not on the EiffelBase 
classes) and its feature `sorted_items' returns a DS_ARRAYED_LIST, not a
DS_LINKED_LIST. (There is no support for topological in the EiffelBase library.) 
For consistency, I decided to use the Gobo containers in the whole class VISITOR [G]; 
for example, the hash table `type_ids' is a DS_HASH_TABLE (not a HASH_TABLE) 
and `expanded_types' is a DS_LINKED_LIST (not a LINKED_LIST).

Here is the implementation of the final version of the Visitor Library:

indexing

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

	make is
			-- Initialize `actions'.
		do
			create actions.make (Initial_capacity)
			create sorter.make (Initial_capacity)
			create type_ids.make (Initial_capacity)
			create expanded_items.make
			create actions_cache.make (1, Initial_capacity)
			catch_all_agent := agent catch_all
		end

feature -- Visitor

	visit (an_element: G) is
			-- Visit `an_element'. (Select the appropriate action
			-- depending on `an_element'.)
		require
			an_element_not_void: an_element /= Void
		local
			internal: INTERNAL
			type_id: INTEGER
			args: TUPLE [G]
			i: INTEGER 
		do
			args := [an_element]

			create internal
			type_id := internal.dynamic_type (an_element)

			if actions_cache.valid_index (type_id) and then actions_cache.item (type_id) /= Void then
				actions_cache.item (type_id).call (args)
			else
				from
					i := actions.count
				until
					i < 1 or else actions.item (i).valid_operands (args)
				loop
					i := i - 1
				end

				if i >= 1 and i <= actions.count then
					actions.item (i).call (args)
					actions_cache.force (actions.item (i), type_id)
				else
					catch_all (an_element)
					actions_cache.force (catch_all_agent, type_id)
				end
			end
		end

feature -- Access

	actions: DS_ARRAYED_LIST [PROCEDURE [ANY, TUPLE [G]]]
			-- Actions to be performed depending on the element

feature -- Element change

	extend (an_action: PROCEDURE [ANY, TUPLE [G]]) is
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

	append (some_actions: ARRAY [PROCEDURE [ANY, TUPLE [G]]]) is
			-- Append actions in `some_actions' to the end of the `actions' list.
		require
			some_actions_not_void: some_actions /= Void
			no_void_action: not some_actions.has (Void)
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

feature {NONE} -- Implementation (Access)

	sorter: DS_HASH_TOPOLOGICAL_SORTER [PROCEDURE [ANY, TUPLE [G]]]
			-- Topological sorter;
			-- The relation used for topological sort is the conformance
			-- of the dynamic type of the agent operands

	type_ids: DS_HASH_TABLE [INTEGER, PROCEDURE [ANY, TUPLE [G]]]
			-- Hash table of type ids indexed by actions

	expanded_items: DS_LINKED_LIST [PROCEDURE [ANY, TUPLE [G]]]
			-- Actions applied to expanded types

	actions_cache: ARRAY [PROCEDURE [ANY, TUPLE [G]]]
			-- Cache with actions indexed by type id

feature {NONE} -- Implementation (Constants)

	Initial_capacity: INTEGER is 10
			-- Initial capacity of `actions', `sorter', and `type_ids'

feature {NONE} -- Implementation (Topological sort)

	prepare_topological_sort (an_action: PROCEDURE [ANY, TUPLE [G]]) is
			-- Add `an_action' to the topological `sorter'.
		require
			an_action_not_void: an_action /= Void
		local
			internal: INTERNAL
			operands: TUPLE [G]
			type_id: INTEGER
		do
			if an_action.open_count = 1 then
					-- Add `an_action' to the `sorter'.
				sorter.force (an_action)

					-- Calculate the type id of the open operand of `an_action'.
				operands := an_action.operands

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
			else
				debug
					io.put_string ("The given action has more than one open operand.%N")
				end
			end
		end

	topological_sort is
			-- Perform the topological sort.
		do
			sorter.sort
			if not sorter.has_cycle then
				actions := sorter.sorted_items
					-- Add action applied to an expanded type if any.
				from expanded_items.start until expanded_items.after loop
					actions.force_last (expanded_items.item_for_iteration)
					expanded_items.forth
				end
			else
				debug
					io.put_string ("The topological sort ended with cycles. There must be a hole in the Eiffel type system.%N")
				end
			end
		end

feature {NONE} -- Implementation (Cache)

	fill_cache is
			-- Fill `actions_cache' with actions in `type_ids' indexed by type id.
		local
			lower: INTEGER
			upper: INTEGER
		do
			actions_cache.clear_all

			lower := actions_cache.lower
			upper := actions_cache.upper
			from type_ids.start until type_ids.after loop
				if type_ids.item_for_iteration < lower then
					lower := type_ids.item_for_iteration
				end
				if type_ids.item_for_iteration > upper then
					upper := type_ids.item_for_iteration
				end
				type_ids.forth
			end
			actions_cache.conservative_resize (lower, upper)

			from type_ids.start until type_ids.after loop
				actions_cache.put (type_ids.key_for_iteration, type_ids.item_for_iteration)
				type_ids.forth
			end
		end

	catch_all (an_element: G) is
			-- Routine called when no action is found for `an_element'
		do
		end

	catch_all_agent: PROCEDURE [ANY, TUPLE [G]]
			-- Agent on `catch_all'

invariant

	actions_not_void: actions /= Void
	no_void_action: not actions.has (Void)
	sorter_not_void: sorter /= Void
	type_ids_not_void: type_ids /= Void
	no_void_type_id: not type_ids.has (Void)
	expanded_items_not_void: expanded_items /= Void
	no_void_expanded_item_not_void: not expanded_items.has (Void)
	actions_cache_not_void: actions_cache /= Void
	catch_all_agent_not_void: catch_all_agent /= Void

end

--
Copyright (c) 2002-2004, ETH Zurich, Switzerland
