note

	description:

		"State that does nothing"

	library: "State library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class NULL_STATE

inherit

	STATE

create

	make

feature {NONE} -- Implementation

	do_something_imp 
			-- Do nothing.
		do
		end

end
