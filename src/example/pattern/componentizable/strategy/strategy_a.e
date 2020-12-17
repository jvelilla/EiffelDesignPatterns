note

	description:

		"Strategy A"

	pattern: "Strategy"
	reusable_version: "Strategy library (see ${PATTERN}/library/strategy)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class STRATEGY_A

inherit

	STRATEGY

feature -- Basic operations

	do_something 
			-- Do something.
		do
			debug
				io.put_string ("Do something (Strategy A).%N")
			end
		end

end
