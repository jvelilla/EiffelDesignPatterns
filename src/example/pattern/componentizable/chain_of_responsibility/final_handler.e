note

	description:

		"Final handler (can handle requests)"

	pattern: "Chain of Responsibility"
	reusable_version: "Chain of Responsibility library (see ${PATTERN}/library/chain_of_responsibility)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"


class FINAL_HANDLER

inherit

	HANDLER

create

	default_create,
	make

feature -- Status report

	can_handle: BOOLEAN
			-- Can current handle the request?
		once
			Result := True
		ensure then
			can_handle: Result
		end

feature {NONE} -- Implementation

	do_handle 
			-- Handle request.
		do
			debug
				io.put_string ("Handle request (")
				io.put_string_32 (generating_type.name_32)
				io.put_string (").%N")
			end
			-- Do something.
		end

end
