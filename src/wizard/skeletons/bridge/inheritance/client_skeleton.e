note

	description:
		"[
			Illustrate how to use
			the Bridge pattern simulated with
			non-conforming inheritance.
		]"
				
	pattern: "Bridge"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class CLIENT

create

	make

feature {NONE} -- Initialization

	make 
			-- Perform an operation.
		local
			<BRIDGE_CLIENT_LOCAL_VARIABLES>
		do
			<BRIDGE_CLIENT_CODE>
		end

end
