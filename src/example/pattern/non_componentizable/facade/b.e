indexing

	description:

		"Internal class"

	pattern: "Facade"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class B

create {FACADE}

	default_create

feature {FACADE} -- Basic operation

	rb is
			-- Do something.
		do
			debug
				io.put_string ("Executing rb on an object of type B.%N")
			end
		end

end
