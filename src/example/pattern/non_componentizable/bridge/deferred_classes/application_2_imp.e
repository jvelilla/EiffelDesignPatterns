note

	description:

		"Implementation of application using the Bridge design pattern"

	pattern: "Bridge"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class APPLICATION_2_IMP

inherit

	APPLICATION_IMP

feature -- Basic operation

	do_something
			-- Do something.
		do
			debug
				io.put_string_32 (generating_type.name_32)
				io.put_string (" do something else.%N")
			end
		end

end
