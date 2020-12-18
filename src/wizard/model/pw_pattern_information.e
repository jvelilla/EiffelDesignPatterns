note

	description:

		"Pattern information needed for the code generation"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class PW_PATTERN_INFORMATION

feature -- Status report

	is_complete: BOOLEAN is
			-- Is pattern information complete
			-- (i.e. ready for code generation)?
		deferred
		end

end
