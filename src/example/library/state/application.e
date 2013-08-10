note

	description:

		"Application using the State library"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2003/12/19"
	revision: "$Revision: 1.0"

class APPLICATION

create

	make

feature {NONE} -- Initialization

	make
			-- Do something depending on
			-- the application context state.
		local
			context_1: CONTEXT
			final_state_1: FINAL_STATE
			first_intermediary_state: INTERMEDIARY_STATE
			second_intermediary_state: INTERMEDIARY_STATE
			initial_state_1: INITIAL_STATE
			context_2: CONTEXT
			initial_state_2: INITIAL_STATE
			intermediary_state: INTERMEDIARY_STATE
			final_state_2: FINAL_STATE
		do
			debug
				io.put_string ("Use context 1:%N")
			end
			create context_1.make
			create final_state_1.make (context_1)
			create second_intermediary_state.make_with_next (context_1, final_state_1)
			create first_intermediary_state.make_with_next (context_1, second_intermediary_state)
			create initial_state_1.make_with_next (context_1, first_intermediary_state)
			context_1.set_state (initial_state_1)
			context_1.do_something
			context_1.do_something

			debug
				io.put_new_line
				io.put_string ("Use context 2:%N")
			end
			create context_2.make
			create final_state_2.make (context_2)
			create intermediary_state.make_with_next (context_2, final_state_2)
			create initial_state_2.make_with_next (context_2, intermediary_state)
			context_2.set_state (initial_state_2)
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
