indexing

	description:

		"Adaptee that needs to be adapted to TARGET"

	pattern: "Object adapter"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class <ADAPTER_ADAPTEE_CLASS_NAME>

feature -- Basic operations

	<ADAPTER_ADAPTEE_FEATURE_NAME> is
			-- Do something.
		do
			debug
				io.put_string ("Do something on adaptee.%N")
			end
		end

end
