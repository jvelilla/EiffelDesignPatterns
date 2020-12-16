note

	description:

		"Application using the State pattern"

	pattern: "State"
	reusable_version: "State library (see ${PATTERN}/library/state)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class APPLICATION

create

	make

feature {NONE} -- Initialization

	make
			-- Do something depending on
			-- the application context state.
		local
			context_1: CONTEXT
			context_2: CONTEXT
		do
			debug
				io.put_string ("Use context 1:%N")
			end
			create context_1.make
			context_1.do_something
			context_1.do_something

			debug
				io.put_new_line
				io.put_string ("Use context 2:%N")
			end
			create context_2.make
			context_2.do_something
			context_2.do_something
			context_2.do_something
			context_2.do_something

			debug
				io.put_new_line
				io.put_string ("Use context 1:%N")
			end
			context_1.do_something
			context_1.do_something
		end

end
