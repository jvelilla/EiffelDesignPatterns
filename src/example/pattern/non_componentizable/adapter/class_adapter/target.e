note

	description:

		"Target used by clients, to which adaptee's interface should conform"

	pattern: "Class adapter"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class TARGET

feature -- Basic operations

	f 
			-- Do something.
		do
			debug
				io.put_string ("Do something on target.%N")
			end
		end

end
