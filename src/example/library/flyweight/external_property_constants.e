indexing

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

	Beige: INTEGER is 2
			-- Beige color

	Black: INTEGER is 3
			-- Black color

	Blue: INTEGER is 4
			-- Blue color

	Green: INTEGER is 5
			-- Green color

	Grey: INTEGER is 6
			-- Grey color

	Red: INTEGER is 7
			-- Red color

	White: INTEGER is 8
			-- White color

	Yellow: INTEGER is 9
			-- Yellow color

feature -- Contract support

	Minimum_code: INTEGER is 
			-- Minimum external property code for an instance of MY_SHARED_FLYWEIGHT
		once
			Result := beige
		ensure then
			beige_code: Result = beige
		end

	Maximum_code: INTEGER is
			-- Maximum external property code for an instance of MY_SHARED_FLYWEIGHT
		once
			Result := yellow
		ensure then
			yellow_code: Result = yellow
		end

end
