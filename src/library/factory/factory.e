note

	description:

		"Factory creating objects of type `G' by using agents."

	library: "Factory library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class FACTORY [G]

create

	make

feature -- Initialization

	make (a_function: like factory_function)
			-- Set `factory_function' to `a_function'.
		require
			a_function_not_void: a_function /= Void
		do
			factory_function := a_function
		ensure
			factory_function_set: factory_function = a_function
		end

feature -- Status report

	valid_args (args: TUPLE): BOOLEAN
			-- Are `args' valid to create a new instance of type `G'?
		do
			Result := factory_function.valid_operands (args)
		end

feature -- Factory functions

	new: detachable G
			-- New instance of type `G'
		require
			valid_args: valid_args ([])
		do
			factory_function.call ([])
			Result := factory_function.last_result
		ensure
			new_not_void: Result /= Void
		end

	new_with_args (args: TUPLE): detachable G
			-- New instance of type `G' initialized with `args'
		require
			args_valid: valid_args (args)
		do
			factory_function.call (args)
			Result := factory_function.last_result
		ensure
			new_not_void: Result /= Void
		end

feature -- Access

	factory_function: FUNCTION [ANY, TUPLE [], G]
			-- Factory function creating new instances of type `G'

invariant

	factory_function_not_void: factory_function /= Void

end
