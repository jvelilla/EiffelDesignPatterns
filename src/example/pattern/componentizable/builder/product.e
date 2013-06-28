indexing

	description:

		"Product to be created by the concrete builder"

	pattern: "Builder"
	reusable_version: "Builder library (see ${PATTERN}/library/builder)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PRODUCT

feature -- Access

	part_a: PART_A
			-- First part of the product

	part_b: PART_B
			-- Second part of the product

feature {BUILDER} -- Status Setting

	set_part_a (first_part: like part_a) is
			-- Set `part_a' to `first_part'.
		require
			first_part_not_void: first_part /= Void
		do
			part_a := first_part
		ensure
			part_a_set: part_a = first_part
		end

	set_part_b (second_part: like part_b) is
			-- Set `part_b' to `second_part'.
		require
			second_part_not_void: second_part /= Void
		do
			part_b := second_part
		ensure
			part_b_set: part_b = second_part
		end

end
