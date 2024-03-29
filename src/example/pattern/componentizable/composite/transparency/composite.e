note

	description:

		"Composite component"

	pattern: "Composite (transparency version)"
	reusable_version: "Composite library (see ${PATTERN}/library/composite)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class COMPOSITE

inherit

	COMPONENT
		redefine
			is_composite
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Initialize component parts.
		do
			create parts.make
		end

feature -- Status report

	is_composite: BOOLEAN
			-- Is component a composite?
		do
			Result := True
		end

feature -- Basic operation

	do_something
			-- Do something.
		do
			debug
				io.put_string ("Do something on a composite.%N")
			end
			across parts as ic loop ic.item.do_something end
		end

feature {NONE} -- Implementation

	parts: LINKED_LIST [like i_th]
			-- Component parts (which are themselves components)

invariant

	is_composite: is_composite
	parts_not_void: parts /= Void
--	no_void_part: not parts.has (Void)

end
