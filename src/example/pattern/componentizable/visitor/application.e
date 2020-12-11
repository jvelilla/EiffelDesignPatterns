note

	description:

		"Application using the Visitor pattern"

	pattern: "Visitor"
	reusable_version: "Visitor library (see ${PATTERN}/library/visitor)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class APPLICATION

create

	make

feature {NONE} -- Initialization

	make 
			-- Use visitors.
		local
			element_a: ELEMENT_A
			element_b: ELEMENT_B
			visitor_1: VISITOR_1
			visitor_2: VISITOR_2
		do
			create element_a.make ("Characteristic A")
			create element_b

			create visitor_1
			debug
				io.put_string ("Visitor 1:%N")
			end
			element_a.accept (visitor_1)
			element_b.accept (visitor_1)

			debug
				io.put_new_line
				io.put_string ("Visitor 2:%N")
			end
			create visitor_2
			element_a.accept (visitor_2)
			element_b.accept (visitor_2)
		end

end
