note

	description:

		"Context"

	library: "Strategy library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class CONTEXT

create

	make

feature {NONE} -- Initialization

	make (a_procedure: like strategy_procedure)
			-- Set `strategy_procedure' to `a_procedure'.
		require
			a_procedure_not_void: a_procedure /= Void
		do
			strategy_procedure := a_procedure
		ensure
			strategy_procedure_set: strategy_procedure = a_procedure
		end

feature -- Basic operations

	do_something
			-- Do something.
			-- (Call algorithm corresponding to `strategy'.)
		do
			if strategy_procedure.valid_operands ([]) then
				strategy_procedure.call ([])
			end
		end

feature -- Access

	strategy_procedure: PROCEDURE [TUPLE]
			-- Strategy procedure to be called

feature -- Element change

	set_strategy_procedure (a_procedure: like strategy_procedure)
			-- Set `strategy_procedure' to `a_procedure'.
		require
			a_procedure_not_void: a_procedure /= Void
		do
			strategy_procedure := a_procedure
		ensure
			strategy_procedure_set: strategy_procedure = a_procedure
		end

invariant

	strategy_procedure_not_void: strategy_procedure /= Void

end
