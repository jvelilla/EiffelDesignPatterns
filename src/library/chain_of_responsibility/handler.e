note

	description:

		"Handler"

	library: "Chain of Responsibility library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class HANDLER [G]

feature {NONE} -- Initialization

	make (a_successor: like next)
			-- Set `next' to `a_successor'.
		require
			a_successor_not_void: a_successor /= Void
		do
			next := a_successor
		ensure
			next_set: next = a_successor
		end

feature -- Access

	next: detachable HANDLER [G]
			-- Successor in the chain of responsibility.

feature -- Status report

	can_handle (a_request: G): BOOLEAN
			-- Can current handle `a_request'?
		deferred
		end

	handled: BOOLEAN
			-- Has request been handled?

feature -- Element change

	set_next (a_successor: like next)
			-- Set `next' to `a_successor'.
		do
			next := a_successor
		ensure
			next_set: next = a_successor
		end

feature -- Basic operation

	handle (a_request: G)
			-- Handle `a_request' if `can_handle'
			-- otherwise forward it to `next'.
			-- If `next' is void, set `handled' to False.
		do
			if can_handle (a_request) then
				do_handle (a_request)
				handled := True
			else
				if attached next as l_next then
					debug
						io.put_string_32 (generating_type.name_32)
						io.put_string (" cannot handle request. Forward it to next handler.%N")
					end
					l_next.handle (a_request)
					handled := l_next.handled
				else
					debug
						io.put_string ("Request not handled.%N")
					end
					handled := False
				end
			end
		ensure
			handled_if_possible: can_handle (a_request) implies handled
			handled_by_next_otherwise:
				(not can_handle (a_request) and then attached next as l_next) implies handled = l_next.handled
			not_handled_if_next_is_void:
				(not can_handle (a_request) and then next = Void) implies not handled
		end

feature {NONE} -- Implementation

	do_handle (a_request: G)
			-- Handle `a_request'.
		require
			can_handle: can_handle (a_request)
		deferred
		end

end
