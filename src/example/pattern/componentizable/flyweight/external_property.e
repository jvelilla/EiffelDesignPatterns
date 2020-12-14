note

	description:

		"External property of a flyweight"

	pattern: "Flyweight"
	reusable_version: "Flyweight library (see ${PATTERN}/library/flyweight)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class EXTERNAL_PROPERTY

inherit

	EXTERNAL_PROPERTY_CONSTANTS
		export
			{NONE} all
		end

	ANY

create

	make

feature {NONE} -- Initialization

	make (a_code: like code)
			-- Set `code' to `a_code'.
		require
			a_code_is_valid: a_code >= beige and a_code <= yellow
		do
			code := a_code
		ensure
			code_set: code = a_code
		end

feature -- Access

	code: INTEGER
			-- Code of the color

feature -- Status report

	is_valid: BOOLEAN
			-- Is color valid?
		do
			Result := (code >= beige and code <= yellow)
		ensure
			definition: Result = (code >= beige and code <= yellow)
		end

invariant

	is_valid: is_valid

end
