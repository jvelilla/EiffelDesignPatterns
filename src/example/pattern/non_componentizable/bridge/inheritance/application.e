note

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

class APPLICATION

inherit

	--inherit {NONE} APPLICATION_IMP
	  APPLICATION_IMP
		export
			{NONE} all
		end


feature -- Basic operation

	do_something 
			-- Do something.
		do
			do_something_imp
		end

end
