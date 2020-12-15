note

	description:

		"Application using the Chain of Responsibility library"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class APPLICATION

create

	make

feature {NONE} -- Initialization

	make 
			-- Create a chain of responsibility and handle a request.
		local
			handler_1, handler_2: INTERMEDIATE_HANDLER [REQUEST]
			handler_3: FINAL_HANDLER [REQUEST]
		do
				-- Create chain of responsibility.
			create handler_3
			create handler_2.make (handler_3)
			create handler_1.make (handler_2)

				-- Handle request.
			handler_1.handle (create {REQUEST})
		end

end
