indexing

	description:

		"Codes of possible items for a flyweight"

	library: "Flyweight library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class FLYWEIGHT_CONSTANTS

feature -- Access

	Default_code: INTEGER is 1
			-- Code of default item for a flyweight

feature -- Contract support

	Minimum_code: INTEGER is
			-- Minimum value of item code for a flyweight
		deferred
		end

	Maximum_code: INTEGER is
			-- Maximum value of item code for a flyweight
		deferred
		end

invariant

	consistent: minimum_code <= maximum_code

end
