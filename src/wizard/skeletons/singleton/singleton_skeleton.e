note

	description:

		"Singleton"

	pattern: "Singleton"
	author: "Eric Bezault, Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class <SINGLETON_CLASS_NAME>

inherit

	<SINGLETON_ACCESS_POINT_CLASS_NAME>

create

	<SINGLETON_CREATION_PROCEDURE_NAME>

feature {NONE} -- Initialization

	<SINGLETON_CREATION_PROCEDURE_NAME>
			-- Create a singleton object.
		require
			singleton_not_created: not singleton_created
		do
			singleton_cell.put (Current)
		end

invariant

	singleton_created: singleton_created
	singleton_pattern: Current = <SINGLETON_ACCESS_FEATURE_NAME>

end
