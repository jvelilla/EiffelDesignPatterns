indexing

	description:

		"Final state"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2003/12/19"
	revision: "$Revision: 1.0"

class FINAL_STATE

inherit

	STATE

create

	make,
	make_with_next

feature {NONE} -- Implementation

	do_something_imp is
			-- Do something depending on the state.
		do
			-- Do something.
			debug
				io.put_string ("Final state.%N")
			end
		end

end
