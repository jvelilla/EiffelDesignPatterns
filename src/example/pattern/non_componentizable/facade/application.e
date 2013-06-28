indexing

	description:

		"Application using the Facade pattern"

	pattern: "Facade"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class APPLICATION

create

	make

feature -- Basic operation

	make is
			-- Do something.
		do
			(create {FACADE}).r
		end

end
