note

	description:

		"Adapter of ADAPTEE to be usable as a TARGET"

	pattern: "Class adapter"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class ADAPTER

inherit

	TARGET
		undefine
			f
		end
--inherit {NONE}
	ADAPTEE
		rename
			g as f
		export
			{NONE} all
		end

end
