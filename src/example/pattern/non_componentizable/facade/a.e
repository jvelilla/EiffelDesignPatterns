indexing

	description:

		"Internal class"

	pattern: "Facade"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class A

create {FACADE}

	default_create

feature {FACADE} -- Basic operation

	ra is
			-- Do something.
		do
			debug
				io.put_string ("Executing ra on an object of type A.%N")
			end
		end

end
