indexing

	description:
		"[
			Third part of product to be created
			by the three-part builder
		]"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PART_C

create

	make

feature {NONE} -- Initialization

	make (a_name: like name_c) is
			-- Set `name_c' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			name_c := a_name
		ensure
			name_c_set: name_c = a_name
		end

feature -- Access

	name_c: STRING
			-- Name of product part

invariant

	name_c_not_void: name_c /= Void
	name_c_not_empty: not name_c.is_empty

end
