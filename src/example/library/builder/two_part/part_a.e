indexing

	description:
		"[
			First part of product to be created
			by the two-part builder
		]"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PART_A

create

	make

feature {NONE} -- Initialization

	make (a_name: like name_a) is
			-- Set `name_a' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			name_a := a_name
		ensure
			name_a_set: name_a = a_name
		end

feature -- Access

	name_a: STRING
			-- Name of product part

invariant

	name_a_not_void: name_a /= Void
	name_a_not_empty: not name_a.is_empty

end
