indexing

	description:

		"Application using the Strategy library."

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2003/12/19"
	revision: "$Revision: 1.0"

class APPLICATION

create 

	make

feature {NONE} -- Initialization

	make is
			-- Do something
			-- using different strategies.
		local
			a_context: CONTEXT [STRATEGY]
		do
			create a_context.make (create {STRATEGY_A})
			a_context.do_something
			a_context.set_strategy (create {STRATEGY_B})
			a_context.do_something
			a_context.set_strategy (create {STRATEGY_C})
			a_context.do_something
		end

end
