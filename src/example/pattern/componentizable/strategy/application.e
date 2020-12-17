note

	description:

		"Application using the Strategy pattern"

	pattern: "Strategy"
	reusable_version: "Strategy library (see ${PATTERN}/library/strategy)"
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
			-- Do something
			-- using different strategies.
		local
			a_context: CONTEXT
		do
			create a_context.make (create {STRATEGY_A})
			a_context.do_something
			a_context.set_strategy (create {STRATEGY_B})
			a_context.do_something
			a_context.set_strategy (create {STRATEGY_C})
			a_context.do_something
			a_context.do_something
		end

end
