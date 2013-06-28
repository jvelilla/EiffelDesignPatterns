indexing

	description:

		"Intermediate handler (cannot handle requests)"

	pattern: "Chain of Responsibility"
	reusable_version: "Chain of Responsibility library (see ${PATTERN}/library/chain_of_responsibility)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class INTERMEDIATE_HANDLER

inherit

	HANDLER

create

	default_create,
	make

feature -- Status report

	can_handle: BOOLEAN is
			-- Can current handle the request?
		once
			Result := False
		ensure then
			cannot_handle: not Result
		end

feature {NONE} -- Implementation

	do_handle is
			-- Handle request.
			-- (Not useful because `can_handle'
			-- will never be satisfied.)
		do
		end

end
