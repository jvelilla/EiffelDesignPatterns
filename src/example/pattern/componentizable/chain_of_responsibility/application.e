indexing

	description:

		"Application using the Chain of Responsibility pattern"

	pattern: "Chain of Responsibility"
	reusable_version: "Chain of Responsibility library (see ${PATTERN}/library/chain_of_responsibility)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class APPLICATION

create 

	make

feature {NONE} -- Initialization

	make is
			-- Create a chain of responsibility and handle a request.
		local
			handler_1, handler_2: INTERMEDIATE_HANDLER
			handler_3: FINAL_HANDLER
		do
				-- Create chain of responsibility.
			create handler_3
			create handler_2.make (handler_3)
			create handler_1.make (handler_2)

				-- Handle request.
			handler_1.handle
		end

end
