note

	description:

		"First kind of visitor"

	pattern: "Visitor"
	reusable_version: "Visitor library (see ${PATTERN}/library/visitor)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class VISITOR_1

inherit

	VISITOR

feature -- Visitor pattern

	visit_element_a (an_element_a: ELEMENT_A)
			-- Visit `an_element_a'.
		do
			an_element_a.do_something_a
		end

	visit_element_b (an_element_b: ELEMENT_B) 
			-- Visit `an_element_b'.
		do
			an_element_b.do_something_b
		end

end
