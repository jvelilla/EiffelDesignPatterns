note
	description: "Summary description for {ELEMENT_C}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ELEMENT_C


inherit

	ELEMENT_B

feature -- Basic operation

	do_something_c
			-- Do something.
		do
			debug
				io.put_string ("Do something on element C.%N")
			end
		end


end
