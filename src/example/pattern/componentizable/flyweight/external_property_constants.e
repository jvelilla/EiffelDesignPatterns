indexing

	description:

		"Codes of possible external properties for a flyweight"

	pattern: "Flyweight"
	reusable_version: "Flyweight library (see ${PATTERN}/library/flyweight)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class EXTERNAL_PROPERTY_CONSTANTS

feature -- Access

	Beige, Black, Blue, Default_code, Green, Grey, Red, White, Yellow: INTEGER is unique
			-- Possible external properties for a flyweight

end
