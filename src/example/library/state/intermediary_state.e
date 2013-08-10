note

	description:

		"Intermediary state"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2003/12/19"
	revision: "$Revision: 1.0"

class INTERMEDIARY_STATE

inherit

	STATE

create

	make,
	make_with_next

feature {NONE} -- Implementation

	do_something_imp 
			-- Do something depending on the state.
		do
			-- Do something.
			debug
				io.put_string ("Intermediary state%N")
			end
		end

end
