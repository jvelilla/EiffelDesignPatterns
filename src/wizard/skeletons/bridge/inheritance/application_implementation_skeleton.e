note

	description:
		"[
			Implementation of application using non-conforming inheritance
			to simulate the Bridge design pattern
		]"

class <BRIDGE_IMPLEMENTATION_CLASS_NAME>

feature -- Basic operation

	<BRIDGE_IMPLEMENTATION_FEATURE_NAME> 
			-- Do something.
		do
			-- Do something.
			debug
				io.put_string_32 (generating_type.name_32)
				io.put_string (" does something.%N")
			end
		end

end
