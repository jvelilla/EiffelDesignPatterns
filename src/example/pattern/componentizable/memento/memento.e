note

	description:

		"Memento"

	pattern: "Memento"
	reusable_version: "Memento library (see ${PATTERN}/library/memento)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class MEMENTO

create

	make

feature {NONE} -- Initialization

	make (an_attribute_1: like attribute_1;
		an_attribute_2: like attribute_2)
			-- Set `attribute_1' to `an_attribute_1'.
			-- Set `attribute_2' to `an_attribute_2'.
		require
			an_attribute_1_not_void: an_attribute_1 /= Void
		do
			attribute_1 := an_attribute_1
			attribute_2 := an_attribute_2
		ensure
			attribute_1_set: attribute_1 = an_attribute_1
			attribute_2_set: attribute_2 = an_attribute_2
		end

feature {ORIGINATOR} -- Access

	attribute_1: TYPE_1
			-- Part of internal state of the Originator

	attribute_2: detachable TYPE_2
			-- Second part of internal state of the Originator

feature {ORIGINATOR} -- Element change

	set_state (an_attribute_1: like attribute_1;
		an_attribute_2: like attribute_2) 
			-- Set `attribute_1' to `an_attribute_1'.
			-- Set `attribute_2' to `an_attribute_2'.
		require
			an_attribute_1_not_void: an_attribute_1 /= Void
		do
			debug
				io.put_string ("Set memento with new state.%N")
			end
			attribute_1 := an_attribute_1
			attribute_2 := an_attribute_2
		ensure
			attribute_1_set: attribute_1 = an_attribute_1
			attribute_2_set: attribute_2 = an_attribute_2
		end

invariant

	attribute_1_not_void: attribute_1 /= Void

end
