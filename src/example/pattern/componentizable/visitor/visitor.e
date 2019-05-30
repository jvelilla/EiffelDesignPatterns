note

	description:

		"Visitor"

	pattern: "Visitor"
	reusable_version: "Visitor library (see ${PATTERN}/library/visitor)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class VISITOR

feature -- Visitor pattern

	visit_element_a (an_element_a: ELEMENT_A)
			-- Visit `an_element_a'.
		require
			an_element_a_not_void: an_element_a /= Void
		deferred
		end

	visit_element_b (an_element_b: ELEMENT_B) 
			-- Visit `an_element_b'.
		require
			an_element_b_not_void: an_element_b /= Void
		deferred
		end

end
