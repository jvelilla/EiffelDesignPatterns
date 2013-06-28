indexing

	description:

		"Concrete colleague 1"

	pattern: "Mediator"
	reusable_version: "Mediator library (see ${PATTERN}/library/mediator)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class COLLEAGUE_1

inherit

	COLLEAGUE
		redefine
			make
		end

create

	make

feature {NONE} -- Initialization

	make (a_mediator: like mediator) is
			-- Set `mediator' to `a_mediator'.
		do
			mediator := a_mediator
			create event_1
		end

feature -- Event

	event_1: EVENT_TYPE [TUPLE]
			-- Event

feature -- Basic operations

	change_1 is
			-- Change something on Current.
		do
			debug
				io.put_string ("Change something in ")
				io.put_string (generating_type)
				io.put_string (".%N")
			end
			-- Do something that changes Current's state.
			event_1.publish ([])
		end

	do_something_1 is
			-- Do something.
		do
			debug
				io.put_string ("Do something in ")
				io.put_string (generating_type)
				io.put_string (".%N")
			end
			-- Do something.
		end

invariant

	event_1_not_void: event_1 /= Void

end
