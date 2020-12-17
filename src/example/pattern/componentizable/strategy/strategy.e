note

	description:

		"Strategy"

	pattern: "Strategy"
	reusable_version: "Strategy library (see ${PATTERN}/library/strategy)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class STRATEGY

feature -- Basic operations

	do_something 
			-- Do something.
		deferred
		end

end
