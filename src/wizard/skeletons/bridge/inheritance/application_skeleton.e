indexing

	description:
		"[
			Application using non-conforming inheritance
			to simulate the Bridge design pattern
		]"

	pattern: "Bridge"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class <BRIDGE_CLASS_NAME>

inherit

	--expanded <BRIDGE_IMPLEMENTATION_CLASS_NAME>
	<BRIDGE_IMPLEMENTATION_CLASS_NAME>
		export
			{NONE} all
		end

	--ANY

feature -- Basic operation

	<BRIDGE_FEATURE_NAME> is
			-- Do something.
		do
			<BRIDGE_IMPLEMENTATION_FEATURE_NAME>
		end

end
