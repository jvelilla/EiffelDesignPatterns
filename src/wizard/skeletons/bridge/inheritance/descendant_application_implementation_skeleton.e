indexing

	description:
		"[
			Implementation of application using non-conforming inheritance
			to simulate the Bridge design pattern
		]"

	pattern: "Bridge"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class <BRIDGE_DESCENDANT_IMPLEMENTATION_CLASS_NAME>

inherit

	<BRIDGE_IMPLEMENTATION_CLASS_NAME>
		redefine
			<BRIDGE_IMPLEMENTATION_FEATURE_NAME>
		end

feature -- Basic operation

	<BRIDGE_IMPLEMENTATION_FEATURE_NAME> is
			-- Do something.
		do
			debug
				io.put_string ("%N")
			end
			Precursor {<BRIDGE_IMPLEMENTATION_CLASS_NAME>}
			-- Do something more.
			debug
				io.put_string (generating_type)
				io.put_string (" does something more.%N")
			end
		end

end
