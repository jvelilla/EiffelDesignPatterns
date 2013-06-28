indexing

	description:

		"Mediator"

	library: "Mediator library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class MEDIATOR [G -> COLLEAGUE]

create

	make

feature {NONE} -- Initialization

	make is
			-- Initialize `colleagues'.
		do
			create colleagues.make
		end

feature -- Access

	colleagues: LINKED_LIST [G]
			-- Colleagues of mediator

feature -- Element change

	extend (a_colleague: G) is
			-- Extend `colleagues' with `a_colleague'.
			-- Update event subscription of `colleagues'.
		require
			a_colleague_not_void: a_colleague /= Void
			not_has_a_colleague: not colleagues.has (a_colleague)
		local
			other_colleague: COLLEAGUE
			new_colleague: COLLEAGUE
			a_cursor: CURSOR
		do
			new_colleague := a_colleague
			a_cursor := colleagues.cursor

				-- Subscribe existing colleagues to `a_colleague.do_something'.
				-- Subscribe `a_colleague' to other colleagues' event.
			from colleagues.start until colleagues.after loop
				other_colleague := colleagues.item
				other_colleague.event.subscribe (agent new_colleague.do_something)
					-- Replace the above line by:
					-- other_colleague.event.subscribe (agent a_colleague.do_something)
					-- as soon as the ISE Eiffel compiler supports it.
				new_colleague.event.subscribe (agent other_colleague.do_something)
					-- Replace the above line by:
					-- a_colleague.event.subscribe (agent other_colleague.do_something)
					-- as soon as the ISE Eiffel compiler supports it.
				colleagues.forth
			end

				-- Add `a_colleague' to the list of `colleagues'.
			colleagues.extend (a_colleague)

			colleagues.go_to (a_cursor)
		ensure
			one_more: colleagues.count = old colleagues.count + 1
			is_last: colleagues.last = a_colleague
			subscribed: colleagues.for_all (agent is_colleague_subscribed)
		   		-- Replace the above line by:
		   		-- subscribed: colleagues.for_all (agent {COLLEAGUE}.subscribed)
		   		-- as soon as the ISE Eiffel compiler supports it.
		end

feature -- Removal

	remove (a_colleague: G) is
			-- Remove `a_colleague' from `colleagues'.
			-- Update event subscription of remaining `colleagues'.
		require
			a_colleague_not_void: a_colleague /= Void
			has_colleague: colleagues.has (a_colleague)
		local
			a_cursor: CURSOR
			old_colleague: COLLEAGUE
			other_colleague: COLLEAGUE
		do
			a_cursor := colleagues.cursor

				-- Unsubscribe remaining colleagues from `a_colleague.do_something'.
				-- Unsubscribe events from `a_colleague'.
				-- Remove `a_colleague' from `colleagues'.
			old_colleague := a_colleague
			from colleagues.start until colleagues.after loop
				other_colleague := colleagues.item
				if other_colleague = a_colleague then
					colleagues.remove
				else
					other_colleague.event.unsubscribe (agent old_colleague.do_something)
						-- Replace the above line by:
						-- other_colleague.event.unsubscribe (agent a_colleague.do_something)
						-- as soon as the ISE Eiffel compiler supports it.
					old_colleague.event.unsubscribe (agent other_colleague.do_something)
						-- Replace the above line by:
						-- a_colleague.event.unsubscribe (agent other_colleague.do_something)
						-- as soon as the ISE Eiffel compiler supports it.
					colleagues.forth
				end
			end

			colleagues.go_to (a_cursor)
		ensure
			one_less: colleagues.count = old colleagues.count - 1
			not_has_colleague: not colleagues.has (a_colleague)
			unsubscribed: a_colleague.unsubscribed
		end

feature {NONE} -- Implementation
 
	is_colleague_subscribed (a_colleague: G): BOOLEAN is
			-- Is a colleague subscribed to other colleagues' event?
		require
			a_colleague_not_void: a_colleague /= Void
		do
			Result := a_colleague.subscribed
		ensure
			definition: Result = a_colleague.subscribed
		end

	is_colleague_unsubscribed (a_colleague: G): BOOLEAN is
			-- Is a colleague unsubscribed from other colleagues' event?
		require
			a_colleague_not_void: a_colleague /= Void
		do
			Result := a_colleague.unsubscribed
		ensure
			definition: Result = a_colleague.unsubscribed
		end

invariant

	colleagues_not_void: colleagues /= Void
	no_void_colleague: not colleagues.has (Void)

end
