note

	description:

		"Particular application using a variant of the Bridge pattern"

	pattern: "Bridge"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class <BRIDGE_DESCENDANT_CLASS_NAME>

inherit

	<BRIDGE_CLASS_NAME>
		redefine
			impl
		end

create

	<BRIDGE_CREATION_PROCEDURE_NAME>

feature {NONE} -- Implementation

	impl: <BRIDGE_DESCENDANT_IMPLEMENTATION_CLASS_NAME>
			-- Implementation

end
