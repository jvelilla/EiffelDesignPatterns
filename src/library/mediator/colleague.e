indexing

	description:

		"Colleague"

	library: "Mediator library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class COLLEAGUE

feature {NONE} -- Initialization

	make (a_mediator: like mediator) is
			-- Set `mediator' to `a_mediator'.
		require
			a_mediator_not_void: a_mediator /= Void
		do
			mediator := a_mediator
			create event
		ensure
			mediator_set: mediator = a_mediator
		end

feature -- Access

	mediator: MEDIATOR [COLLEAGUE]
			-- Mediator

feature -- Event

	event: EVENT_TYPE [TUPLE]
			-- Event

feature -- Status report

	subscribed: BOOLEAN is
			-- Is current colleague subscribed to other colleagues' event?
		local
			colleagues: LINKED_LIST [COLLEAGUE]
			a_cursor: CURSOR
			a_colleague: COLLEAGUE
		do
			colleagues := mediator.colleagues
			if not colleagues.is_empty then
				a_cursor := colleagues.cursor
				from 
					colleagues.start
					Result := True
				until
					colleagues.after 
				loop
					a_colleague := colleagues.item
					if a_colleague /= Current then
						Result := Result and a_colleague.event.has (agent do_something)
					end
					colleagues.forth
				end
				colleagues.go_to (a_cursor)
			end
		end

	unsubscribed: BOOLEAN is
			-- Is current colleague unsubscribed from other colleagues' event?
		local
			colleagues: LINKED_LIST [COLLEAGUE]
			a_cursor: CURSOR
			a_colleague: COLLEAGUE
		do
			colleagues := mediator.colleagues
			Result := True
			if not colleagues.is_empty then
				a_cursor := colleagues.cursor
				from colleagues.start until colleagues.after loop
					a_colleague := colleagues.item
					if a_colleague /= Current then
						Result := Result and not a_colleague.event.has (agent do_something)
					end
					colleagues.forth
				end
				colleagues.go_to (a_cursor)
			end
		end

feature -- Basic operations

	change is
			-- Change something on Current.
		do
			-- Do something that changes Current's state.
			do_change
			event.publish ([])
		end

	do_something is
			-- Do something.
		deferred 
		end

feature {NONE} -- Implementation

	do_change is
			-- Do something that changes Current's state.
		deferred
		end

invariant

	mediator_not_void: mediator /= Void
	event_not_void: event /= Void

end
