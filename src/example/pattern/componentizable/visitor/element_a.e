note

	description:

		"First kind of element to be visited"

	pattern: "Visitor"
	reusable_version: "Visitor library (see ${PATTERN}/library/visitor)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class ELEMENT_A

inherit

	ELEMENT

create

	make

feature {NONE} -- Initialization

	make (a_characteristic: like characteristic_a)
			-- Set `characteristic_a' to `a_characteristic'.
		require
			a_characteristic_not_void: a_characteristic /= Void
		do
			characteristic_a := a_characteristic
		ensure
			characteristic_a_set: characteristic_a = a_characteristic
		end

feature -- Visitor pattern

	accept (a_visitor: VISITOR)
			-- Accept `a_visitor'.
			-- (Call `visit_element_a' procedure on `a_visitor'.)
		do
			a_visitor.visit_element_a (Current)
		end

feature -- Basic operation

	do_something_a 
			-- Do something.
		do
			debug
				io.put_string ("Do something on element A.%N")
			end
		end

feature -- Access

	characteristic_a: ANY
			-- Characteristic of an element A

invariant

	characteristic_a_not_void: characteristic_a /= Void

end
