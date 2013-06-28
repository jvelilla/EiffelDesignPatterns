indexing

	description:

		"Non-terminal expression"

	pattern: "Interpreter"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class NON_TERMINAL_EXPRESSION

inherit

	EXPRESSION

create

	make

feature {NONE} -- Initialization

	make is
			-- Initialize `expressions'.
		do
			create expressions.make
		end

feature -- Access

	expressions: LINKED_LIST [EXPRESSION]
			-- Expressions current non-terminal expression is made of

feature -- Element change

	extend (an_expression: EXPRESSION) is
			-- Extend `expressions' with `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			expressions.extend (an_expression)
		ensure
			one_more: expressions.count = old expressions.count + 1
			inserted: expressions.last = an_expression
		end

feature -- Basic operation

	interpret (a_context: CONTEXT) is
			-- Interpret non-terminal symbols of the grammar
			-- using shared information of `a_context.
		do
			debug
				io.put_string ("Interpret non-terminal symbols.%N")
			end

			from expressions.start until expressions.after loop
				expressions.item.interpret (a_context)
				expressions.forth
			end
		end

invariant

	expressions_not_void: expressions /= Void
	no_void_expression: not expressions.has (Void)

end
