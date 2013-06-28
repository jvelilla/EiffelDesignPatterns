indexing

	description:

		"Particular application using a variant of the Bridge pattern"

	pattern: "Bridge"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class APPLICATION_2

inherit

	APPLICATION
		redefine
			impl
		end

create

	make

feature {NONE} -- Implementation

	impl: APPLICATION_2_IMP
			-- Implementation

end
