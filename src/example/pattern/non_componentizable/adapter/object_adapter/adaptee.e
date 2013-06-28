indexing

	description:

		"Adaptee that needs to be adapted to TARGET"

	pattern: "Object adapter"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class ADAPTEE

feature -- Basic operations

	g is
			-- Do something.
		do
			debug
				io.put_string ("Do something on adaptee.%N")
			end
		end

end
