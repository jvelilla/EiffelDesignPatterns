indexing

	description:

		"Implementation of application using a variant of the Bridge pattern"

	pattern: "Bridge"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class APPLICATION_IMP

feature -- Basic operation

	do_something is
			-- Do something.
		do
			-- Do something.
			debug
				io.put_string (generating_type)
				io.put_string (" do something.%N")
			end
		end

end
