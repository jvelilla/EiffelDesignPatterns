note

	description:
		"[
			Particular application using non-conforming inheritance
			to simulate the Bridge design pattern
		]"

	pattern: "Bridge"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class <BRIDGE_DESCENDANT_CLASS_NAME>

inherit

	<BRIDGE_CLASS_NAME>
		undefine
			<BRIDGE_IMPLEMENTATION_FEATURE_NAME>
		end

	--expanded <BRIDGE_DESCENDANT_IMPLEMENTATION_CLASS_NAME>
	<BRIDGE_DESCENDANT_IMPLEMENTATION_CLASS_NAME>
		export
			{NONE} all
		end

end
