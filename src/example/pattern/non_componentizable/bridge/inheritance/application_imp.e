indexing

	description:
		"[
			Implementation of application using non-conforming inheritance
			to simulate the Bridge design pattern
		]"

class APPLICATION_IMP

feature -- Basic operation

	do_something_imp is
			-- Do something.
		do
			-- Do something.
			debug
				io.put_string (generating_type)
				io.put_string (" does something.%N")
			end
		end

end
