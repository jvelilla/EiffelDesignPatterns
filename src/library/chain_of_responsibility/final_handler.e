note

	description:

		"Final handler (can handle requests)"

	library: "Chain of Responsibility library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class FINAL_HANDLER [G]

inherit

	HANDLER [G]

create

	default_create,
	make

feature -- Status report

	can_handle (a_request: G): BOOLEAN
			-- Can current handle `a_request'?
		do
			Result := a_request /= Void
		ensure then
			a_request_not_void: Result implies a_request /= Void
		end

feature {NONE} -- Implementation

	do_handle (a_request: G) 
			-- Handle `a_request'.
		do
			debug
				io.put_string ("Handle request (")
				io.put_string_32 (generating_type.name_32)
				io.put_string (").%N")
			end
			-- Do something.
		end

end
