note

	description:

		"Flyweight (shared or not)"

	pattern: "Flyweight"
	reusable_version: "Flyweight library (see ${PATTERN}/library/flyweight)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class FLYWEIGHT

inherit

	COMPONENT [FLYWEIGHT]

feature -- Access

	external_characteristic (a_context: FLYWEIGHT_CONTEXT): EXTERNAL_PROPERTY
			-- External characteristic of flyweight in `a_context'
		require
			a_context_not_void: a_context /= Void
		do
			Result := a_context.external_characteristic
		ensure
			external_characteristic_not_void: Result /= Void
		end

feature -- Element change

	set_external_characteristic (a_characteristic: like external_characteristic;
									a_context: FLYWEIGHT_CONTEXT) 
			-- Set external characteristic of `a_context' to `a_characteristic'.
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

	draw (a_context: detachable FLYWEIGHT_CONTEXT)
			-- Draw flyweight according to `a_context'.
		require
			a_context_not_void: a_context /= Void
		deferred
		end

feature -- Basic operation

	do_something
			-- Do nothing.
			-- May be redefined in descendants.
		do
		end

end
