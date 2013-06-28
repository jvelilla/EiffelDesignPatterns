indexing

	description:
		"[
			Second part of product to be created
			by the three-part builder
		]"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PART_B

create

	make

feature {NONE} -- Initialization

	make (a_name: like name_b) is
			-- Set `name_b' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			name_b := a_name
		ensure
			name_b_set: name_b = a_name
		end

feature -- Access

	name_b: STRING
			-- Name of product part

invariant

	name_b_not_void: name_b /= Void
	name_b_not_empty: not name_b.is_empty

end
