indexing

	description:

		"Shared flyweight component"

	library: "Flyweight library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class SHARED_FLYWEIGHT [G -> SHARABLE create make end, H -> HASHABLE]

inherit

	FLYWEIGHT [G]
		rename
			make as make_flyweight
		redefine
			procedure,
			set_external_characteristic
		end

create

	make,
	make_from_procedure

feature -- Initialization

	make (a_characteristic: like characteristic) is
			-- Set `characteristic' to `a_characteristic'.
		require
			a_characteristic_not_void: a_characteristic /= Void
		do
			characteristic := a_characteristic
		ensure
			characteristic_set: characteristic = a_characteristic
		end

	make_from_procedure (a_characteristic: like characteristic; 
					a_procedure: like procedure) is
			-- Set `characteristic' to `a_characteristic'.
			-- Set `procedure' to `a_procedure'.
		require
			a_characteristic_not_void: a_characteristic /= Void
			a_procedure_not_void: a_procedure /= Void
		do
			characteristic := a_characteristic
			make_flyweight (a_procedure)
		ensure
			characteristic_set: characteristic = a_characteristic
			procedure_set: procedure = a_procedure
		end

feature -- Access

	characteristic: H
			-- Internal property of the flyweight

	procedure: PROCEDURE [ANY, TUPLE [like Current, FLYWEIGHT_CONTEXT [G]]]
			-- Procedure called by `draw'

feature -- Element change

	set_external_characteristic (a_characteristic: like external_characteristic;
								a_context: FLYWEIGHT_CONTEXT [G]) is
			-- Set external characteristic of `a_context' to `a_characteristic' 
			-- (i.e. for all flyweights of the composite).
		do
			Precursor {FLYWEIGHT} (a_characteristic, a_context)
			a_context.set_external_characteristic (a_characteristic, 1)
		end

feature -- Output

	do_something (a_context: FLYWEIGHT_CONTEXT [G]) is
			-- Call `procedure' if not Void otherwise do nothing.
		do
			if procedure /= Void then
				procedure.call ([Current, a_context])
			end
		end

feature {NONE} -- Basic operations

	do_something_component is
			-- Do nothing.
			-- May be redefined in descendants.
		do
		end

end
