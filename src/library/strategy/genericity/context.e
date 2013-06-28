indexing

	description:

		"Context"

	library: "Strategy library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class CONTEXT [G -> STRATEGY]

create

	make

feature {NONE} -- Initialization

	make (a_strategy: like strategy) is
			-- Set `strategy' to `a_strategy'.
		require
			a_strategy_not_void: a_strategy /= Void
		do
			strategy := a_strategy
		ensure
			strategy_set: strategy = a_strategy
		end

feature -- Basic operations

	do_something is
			-- Do something.
			-- (Call algorithm corresponding to `strategy'.)
		do
			strategy.do_something
		end

feature -- Access

	strategy: G
			-- Strategy to be applied

feature -- Element change

	set_strategy (a_strategy: like strategy) is
			-- Set `strategy' to `a_strategy'.
		require
			a_strategy_not_void: a_strategy /= Void
		do
			strategy := a_strategy
		ensure
			strategy_set: strategy = a_strategy
		end 

invariant

	strategy_not_void: strategy /= Void

end
