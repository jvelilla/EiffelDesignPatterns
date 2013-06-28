indexing

	description:

		"Concrete component"

	pattern: "Decorator"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class MY_COMPONENT

inherit

	COMPONENT

feature -- Basic Operation

	do_something is
			-- Do something.
		do
			-- Do something.
			debug
				io.put_string ("Do something...%N")
			end
		end

end
