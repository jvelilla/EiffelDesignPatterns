note

	description:

		"Initial state"

	pattern: "State"
	reusable_version: "State library (see ${PATTERN}/library/state)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class INITIAL_STATE

inherit

	STATE

create

	make

feature -- Basic operations

	do_something 
			-- Do something depending on the state.
		do
			-- Do something.
			debug
				io.put_string ("Initial state%N")
			end
			context.set_state (context.intermediary_state)
		end

end
