note

	description:

		"Originator"

	pattern: "Memento"
	reusable_version: "Memento library (see ${PATTERN}/library/memento)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class ORIGINATOR

create

	make

feature {NONE} -- Initialization

	make is
			-- Initialize `state'.
		do
			create attribute_1
			create attribute_3
		end

feature -- Access

	attribute_1: TYPE_1
			-- Part of the originator's internal state

	attribute_2: detachable TYPE_2
			-- Another part of the originator's internal state
			-- (May be Void)

	attribute_3: TYPE_3
			-- Another attribute
			-- (not useful to characterize the originator's internal state)

	new_memento: MEMENTO
			-- New memento from `attribute_1' and `attribute_2'
		do
			debug
				io.put_string ("Create new memento with current internal state.%N")
			end
			create Result.make (attribute_1, attribute_2)
		ensure
			new_memento_not_void: Result /= Void
			attribute_1_set: Result.attribute_1 = attribute_1
			attribute_2_set: Result.attribute_2 = attribute_2
		end

feature -- Status setting

	set_state_from_memento (a_memento: MEMENTO) 
			-- Set internal state from `a_memento', i.e.:
			-- set `attribute_1' to `a_memento.attribute_1'
			-- set `attribute_2' to `a_memento.attribute_2'.
		require
			a_memento_not_void: a_memento /= Void
		do
			debug
				io.put_string ("Set internal state from given memento.%N")
			end
			attribute_1 := a_memento.attribute_1
			attribute_2 := a_memento.attribute_2
		ensure
			attribute_1_set: attribute_1 = a_memento.attribute_1
			attribute_2_set: attribute_2 = a_memento.attribute_2
		end

invariant

	attribute_1_not_void: attribute_1 /= Void
	attribute_3_not_void: attribute_3 /= Void

end
