indexing

	description:
		"[
			Implementation of application using non-conforming inheritance
			to simulate the Bridge design pattern
		]"

class <BRIDGE_IMPLEMENTATION_CLASS_NAME>

feature -- Basic operation

	<BRIDGE_IMPLEMENTATION_FEATURE_NAME> is
			-- Do something.
		do
			-- Do something.
			debug
				io.put_string (generating_type)
				io.put_string (" does something.%N")
			end
		end

end
