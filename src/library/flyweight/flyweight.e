note

	description:

		"Reusable flyweight component (may be shared or not)"

	library: "Flyweight library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class FLYWEIGHT [G -> SHARABLE create make end]

inherit

	COMPONENT [FLYWEIGHT [G]]
		rename
			do_something as do_something_component
		end

feature -- Initialization

	make (a_procedure: like procedure)
			-- Set `procedure' to `a_procedure'.
		require
			a_procedure_not_void: a_procedure /= Void
		do
			procedure := a_procedure
		ensure
			procedure_set: procedure = a_procedure
		end

feature -- Access

	external_characteristic (a_context: FLYWEIGHT_CONTEXT [G]): G
			-- External characteristic of flyweight in `a_context'
		require
			a_context_not_void: a_context /= Void
		do
			Result := a_context.external_characteristic
		ensure
			external_characteristic_not_void: Result /= Void
		end

	procedure: PROCEDURE [ANY, TUPLE [FLYWEIGHT [G], FLYWEIGHT_CONTEXT [G]]]
			-- Procedure called by `do_something' for shared flyweights

feature -- Element change

	set_external_characteristic (a_characteristic: like external_characteristic;
								a_context: FLYWEIGHT_CONTEXT [G])
			-- Set external_characteristic of `a_context' to `a_characteristic'.
		require
			a_characteristic_not_void: a_characteristic /= Void
			a_context_not_void: a_context /= Void
		do
			a_context.start
		ensure
			external_characteristic_set: a_context.external_characteristic /= Void
				and then a_context.external_characteristic = a_characteristic
		end

feature -- Output

	do_something (a_context: FLYWEIGHT_CONTEXT [G]) 
			-- Draw flyweight according to `a_context'.
		require
			a_context_not_void: a_context /= Void
		deferred
		end

end
