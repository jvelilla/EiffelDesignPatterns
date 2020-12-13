note

	description:

		"Leaf (Non-composite component)"

	pattern: "Composite (safety version)"
	reusable_version: "Composite library (see ${PATTERN}/library/composite)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class LEAF

inherit

	COMPONENT

feature -- Basic Operation

	do_something 
			-- Do something.
		do
			-- Do something.
			debug
				io.put_string ("Do something on a leaf.%N")
			end
		end

invariant

	is_leaf: not is_composite

end
