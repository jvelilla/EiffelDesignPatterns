indexing

	description:

		"Concrete colleague 2"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class COLLEAGUE_2

inherit

	COLLEAGUE

create

	make

feature -- Basic operation

	do_something is
			-- Do something.
		do
			debug
				io.put_string ("Do something in ")
				io.put_string (generating_type)
				io.put_string (".%N")
			end
			-- Do something.
		end

feature {NONE} -- Implementation

	do_change is
			-- Do something that changes Current's state.
		do
			debug
				io.put_new_line
				io.put_string ("Change something in ")
				io.put_string (generating_type)
				io.put_string (".%N")
			end
			-- Do something that changes Current's state.
		end

end
