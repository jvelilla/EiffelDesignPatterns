note

	description:
		"[
			Implementation of application using non-conforming inheritance
			to simulate the Bridge design pattern
		]"

class APPLICATION_IMP

feature -- Basic operation

	do_something_imp
			-- Do something.
		do
			-- Do something.
			debug
				io.put_string_32 (generating_type.name_32)
				io.put_string (" does something.%N")
			end
		end

end
