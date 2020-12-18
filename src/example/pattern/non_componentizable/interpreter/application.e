note

	description:

		"Application using the Interpreter pattern"

	pattern: "Interpreter"
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
			-- Interpret a non-terminal expression
			-- made of two terminal expressions.
		local
			a_context: CONTEXT
			non_terminal: NON_TERMINAL_EXPRESSION
		do
			create a_context
			create non_terminal.make
			non_terminal.extend (create {TERMINAL_EXPRESSION})
			non_terminal.extend (create {TERMINAL_EXPRESSION})
			non_terminal.interpret (a_context)
		end

end
