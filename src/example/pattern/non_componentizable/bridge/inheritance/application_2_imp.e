note

	description:
		"[
			Implementation of application using non-conforming inheritance
			to simulate the Bridge design pattern
		]"

	pattern: "Bridge"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class APPLICATION_2_IMP

inherit

	APPLICATION_IMP
		redefine
			do_something_imp
		end

feature -- Basic operation

	do_something_imp
			-- Do something.
		do
			debug
				io.put_string ("%N")
			end
			Precursor {APPLICATION_IMP}
			-- Do something more.
			debug
				io.put_string_32 (generating_type.name_32)
				io.put_string (" does something more.%N")
			end
		end

end
