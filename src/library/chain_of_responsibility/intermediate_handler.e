note

	description:

		"Intermediate handler (cannot handle requests)"

	library: "Chain of Responsibility library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class INTERMEDIATE_HANDLER [G]

inherit

	HANDLER [G]

create

	default_create,
	make

feature -- Status report

	can_handle (a_request: G): BOOLEAN is
			-- Can current handle `a_request'?
		do
			Result := False
		ensure then
			cannot_handle: not Result
		end

feature {NONE} -- Implementation

	do_handle (a_request: G) is
			-- Handle `a_request'.
			-- (Not useful because `can_handle'
			-- will never be satisfied.)
		do
		end

end
