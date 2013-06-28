indexing

	description:

		"Originator using the Memento library"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2003/12/19"
	revision: "$Revision: 1.0"

class ORIGINATOR

inherit

	MEMORIZABLE

create

	make

feature {NONE} -- Initialization

	make is
			-- Initialize `attribute_1' and `attribute_3'.
		do
			create attribute_1
			create attribute_3
		end

feature -- Access

	attribute_1: TYPE_1
			-- Part of the originator's internal state

	attribute_2: TYPE_2
			-- Another part of the originator's internal state
			-- (May be Void)

	attribute_3: TYPE_3
			-- Another attribute 
			-- (not useful to characterize the originator's internal state)

feature -- Memento

	new_memento: TUPLE [TYPE_1, TYPE_2] is
			-- New memento from `attribute_1' and `attribute_2'
		do
			debug
				io.put_string ("Create new memento from current state.%N")
			end
			Result := [attribute_1, attribute_2]
		ensure then
			new_memento_has_two_elements: Result.count = 2
			attribute_1_set: Result.item (1) = attribute_1
			attribute_2_set: Result.item (2) = attribute_2
		end

feature -- Status setting

	set_state_from_memento (a_memento: like new_memento) is
			-- Set internal state (`attribute_1' and `attribute_2') from `a_memento'.
		do
			debug
				io.put_string ("Set state from given memento.%N")
			end
			attribute_1 ?= a_memento.item (1)
			attribute_2 ?= a_memento.item (2)
		ensure then
			attribute_1_set: attribute_1 = a_memento.item (1)
			attribute_2_set: attribute_2 = a_memento.item (2)
		end

feature -- Status report

	is_valid (a_memento: like new_memento): BOOLEAN is
			-- Is `a_memento' a valid memento?
		do
			Result := (a_memento.count = 2 and then a_memento.item (1) /= Void)
		ensure then
			definition: Result implies (a_memento.count = 2
								and then a_memento.item (1) /= Void)
		end

invariant

	attribute_1_not_void: attribute_1 /= Void
	attribute_3_not_void: attribute_3 /= Void

end
