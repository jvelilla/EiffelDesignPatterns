note

	description:

		"Product to be created by the three-part builder"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class THREE_PART_PRODUCT

inherit

	BUILDABLE [PART_A, PART_B, PART_C]
		rename
			g as part_a,
			h as part_b,
			j as part_c,
			set_g as set_part_a,
			set_h as set_part_b,
			set_j as set_part_c
		redefine
			part_a,
			part_b,
			part_c
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name) 
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

feature -- Access

	name: STRING
			-- Name of product part

	part_a: detachable PART_A
			-- First part of product

	part_b: detachable PART_B
			-- Second part of product

	part_c: detachable PART_C
			-- Third part of product

invariant

	name_not_void: name /= Void
	name_not_empty: not name.is_empty

end
