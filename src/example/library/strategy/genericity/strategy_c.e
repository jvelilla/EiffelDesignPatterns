indexing

	description:

		"Strategy C"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2003/12/19"
	revision: "$Revision: 1.0"

class STRATEGY_C

inherit

	STRATEGY

feature -- Basic operations

	do_something is
			-- Do something.
		do
			debug
				io.put_string ("Do something (Strategy C).%N")
			end
		end

end
