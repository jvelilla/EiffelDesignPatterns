indexing

	description:

		"Second kind of element to be visited"

	pattern: "Visitor"
	reusable_version: "Visitor library (see ${PATTERN}/library/visitor)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class ELEMENT_B

inherit

	ELEMENT

feature -- Visitor pattern

	accept (a_visitor: VISITOR) is
			-- Accept `a_visitor'.
			-- (Call `visit_element_b' procedure on `a_visitor'.)
		do
			a_visitor.visit_element_b (Current)
		end

feature -- Basic operation

	do_something_b is
			-- Do something.
		do
			debug
				io.put_string ("Do something on element B.%N")
			end
		end

end
