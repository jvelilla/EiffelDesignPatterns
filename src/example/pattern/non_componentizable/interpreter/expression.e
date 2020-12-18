note

	description:

		"Expression"

	pattern: "Interpreter"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class EXPRESSION

feature -- Basic operation

	interpret (a_context: CONTEXT) 
			-- Interpret the symbols of the grammar
			-- using shared information of `a_context'.
		require
			a_context_not_void: a_context /= Void
		deferred
		end

end
