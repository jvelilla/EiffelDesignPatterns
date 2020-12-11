note

	description:

		"Application using the Visitor library"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2003/12/19"
	revision: "$Revision: 1.0"

class APPLICATION

create

	make

feature {NONE} -- Initialization

	make
			-- Use visitors.
		local

			element_a: ELEMENT_A
			element_b: ELEMENT_B
			element_c: ELEMENT_C
			visitor_1: VISITOR [like element]
			visitor_2: VISITOR [like element]
		do
			create element
			create element_a.make ("Characteristic A")
			create element_b
			create element_c

			debug
				io.put_string ("Visitor 1:%N")
			end
			create visitor_1.make
			visitor_1.extend (agent {ELEMENT_A}.do_something_a)
			visitor_1.extend (agent {ELEMENT_B}.do_something_b)
			visitor_1.extend (agent {ELEMENT_C}.do_something_c)
			visitor_1.visit (element_a)
			visitor_1.visit (element_b)
			visitor_1.visit (element_c)

			debug
				io.put_new_line
				io.put_string ("Visitor 2:%N")
			end
			create visitor_2.make
			visitor_2.extend (agent do_something)
			visitor_2.extend (agent {ELEMENT_B}.do_something_b)
			visitor_2.visit (element_a)
			visitor_2.visit (element_b)
		end

	element: ELEMENT

feature {NONE} -- Implementation

	do_something (an_element: ELEMENT_A)
			-- Do something with characteristic of `an_element'.
			-- (This feature could be defined in another class
			-- from which APPLICATION would inherit or be a client of.)
		require
			an_element_not_void: an_element /= Void
		do
			io.put_string ("Do something with an element of characteristic: ")
			io.put_string (an_element.characteristic_a.out)
			io.put_new_line
		end

end
