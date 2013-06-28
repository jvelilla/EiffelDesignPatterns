indexing

	description:

		"Singleton"

	pattern: "Singleton"
	author: "Eric Bezault, Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class MY_SINGLETON

inherit

	MY_SHARED_SINGLETON 

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a singleton object.
		require
			singleton_not_created: not singleton_created
		do
			singleton_cell.put (Current)
		end

invariant

	singleton_created: singleton_created
	singleton_pattern: Current = singleton

end
