note

	description:

		"Element to be visited"

	pattern: "Visitor"
	reusable_version: "Visitor library (see ${PATTERN}/library/visitor)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class ELEMENT

feature -- Visitor pattern

	accept (a_visitor: VISITOR) 
			-- Accept `a_visitor'.
			-- (Call `visit_*' procedure on `a_visitor'.)
		require
			a_visitor_not_void: a_visitor /= Void
		deferred
		end

end
