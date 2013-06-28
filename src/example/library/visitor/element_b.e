indexing

	description:

		"Second kind of element to be visited"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2003/12/19"
	revision: "$Revision: 1.0"

class ELEMENT_B

inherit

	ELEMENT

feature -- Basic operation

	do_something_b is
			-- Do something.
		do
			debug
				io.put_string ("Do something on element B.%N")
			end
		end

end
