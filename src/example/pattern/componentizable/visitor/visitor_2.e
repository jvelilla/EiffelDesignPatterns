note

	description:

		"Second kind of visitor"

	pattern: "Visitor"
	reusable_version: "Visitor library (see ${PATTERN}/library/visitor)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class VISITOR_2

inherit

	VISITOR

feature -- Visitor pattern

	visit_element_a (an_element_a: ELEMENT_A)
			-- Visit `an_element_a'.
		do
			do_something (an_element_a)
		end

	visit_element_b (an_element_b: ELEMENT_B)
			-- Visit `an_element_b'.
		do
			an_element_b.do_something_b
		end

feature {NONE} -- Implementation

	do_something (an_element: ELEMENT_A) 
			-- Do something with characteristic of `an_element'.
		require
			an_element_not_void: an_element /= Void
		do
			io.put_string ("Do something with an element of characteristic: ")
			io.put_string (an_element.characteristic_a.out)
			io.put_string (".%N")
		end

end
