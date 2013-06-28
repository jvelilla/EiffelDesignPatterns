indexing

	description:

		"Leaf (Non-composite component)"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class LEAF

inherit

	COMPONENT [LEAF]
		export
			{NONE} all

			{ANY} 
				do_something,
				is_composite
		end

	ANY

feature -- Basic Operation

	do_something is
			-- Do something.
		do
			-- Do something.
			debug
				io.put_string ("Do something on a leaf.%N")
			end
		end

feature {NONE} -- Implementation

	parts: LINKED_LIST [like item] is
			-- Component parts (Void because a leaf is not a composite)
		do
			Result := Void
		end

invariant

	is_leaf: not is_composite
	void_parts: parts = Void

end
