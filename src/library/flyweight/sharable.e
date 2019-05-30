note

	description:

		"Property that may be made extrinsic by a flyweight"

	library: "Flyweight library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class SHARABLE

inherit

	FLYWEIGHT_CONSTANTS

feature {NONE} -- Initialization

	make (a_code: like code)
			-- Set `code' to `a_code'.
		require
			a_code_is_valid: is_valid_code (a_code)
		do
			code := a_code
		ensure
			code_set: code = a_code
		end

feature -- Access

	code: INTEGER
			-- Code of the item

feature -- Status report

	is_valid: BOOLEAN
			-- Is current valid?
		do
			Result := is_valid_code (code)
		ensure
			definition: Result = is_valid_code (code)
		end

	is_valid_code (a_code: INTEGER): BOOLEAN 
			-- Is `a_code' a valid code?
		do
			Result := (a_code = default_code or
					(a_code >= minimum_code and a_code <= maximum_code))
		ensure
			definition: Result = (a_code = default_code or
					(a_code >= minimum_code and a_code <= maximum_code))
		end

invariant

	is_valid: is_valid

end
