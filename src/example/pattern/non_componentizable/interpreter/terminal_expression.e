note

	description:

		"Terminal expression"

	pattern: "Interpreter"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class TERMINAL_EXPRESSION

inherit

	EXPRESSION

feature -- Basic operation

	interpret (a_context: CONTEXT)
			-- Interpret terminal symbols of the grammar
			-- using shared information of `a_context.
		do
			debug
				io.put_string ("Interpret terminal symbols.%N")
			end
			-- Interpret symbols.
		end

end
