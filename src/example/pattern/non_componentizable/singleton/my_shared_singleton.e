note

	description:

		"Access point to the Singleton"

	pattern: "Singleton"
	author: "Eric Bezault, Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class MY_SHARED_SINGLETON

feature -- Access

	singleton: MY_SINGLETON
			-- Singleton object
		do
			Result := singleton_cell.item
			if Result = Void then
				create Result.make
			end
		ensure
			singleton_created: singleton_created
			singleton_not_void: Result /= Void
		end

feature -- Status report

	singleton_created: BOOLEAN
			-- Has singleton already been created?
		do
			Result := singleton_cell.item /= Void
		end

feature {NONE} -- Implementation

	singleton_cell: CELL [detachable MY_SINGLETON]
			-- Cell containing the singleton if already created
		once
			create Result.put (Void)
		ensure
			cell_not_void: Result /= Void
		end

end
