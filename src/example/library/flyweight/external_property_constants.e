note

	description:
		"[
			Codes of possible external properties
			for a shared flyweight
		]"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class EXTERNAL_PROPERTY_CONSTANTS

inherit

	FLYWEIGHT_CONSTANTS

feature -- External property codes

	Beige: INTEGER = 2
			-- Beige color

	Black: INTEGER = 3
			-- Black color

	Blue: INTEGER = 4
			-- Blue color

	Green: INTEGER = 5
			-- Green color

	Grey: INTEGER = 6
			-- Grey color

	Red: INTEGER = 7
			-- Red color

	White: INTEGER = 8
			-- White color

	Yellow: INTEGER = 9
			-- Yellow color

feature -- Contract support

	Minimum_code: INTEGER
			-- Minimum external property code for an instance of MY_SHARED_FLYWEIGHT
		once
			Result := beige
		ensure then
			beige_code: Result = beige
		end

	Maximum_code: INTEGER
			-- Maximum external property code for an instance of MY_SHARED_FLYWEIGHT
		once
			Result := yellow
		ensure then
			yellow_code: Result = yellow
		end

end
