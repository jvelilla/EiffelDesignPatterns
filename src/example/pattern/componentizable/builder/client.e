indexing
	
	description:

		"Notify the builder when a new product should be built."

	pattern: "Builder"
	reusable_version: "Builder library (see ${PATTERN}/library/builder)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class CLIENT

create

	make

feature {NONE} -- Initialization

	make (a_builder: like my_builder) is
			-- Set `my_builder' to `a_builder'.
		require
			builder_not_void: a_builder /= Void
		do
			my_builder := a_builder
		ensure
			my_builder_set: my_builder = a_builder
		end

feature -- Access

	my_builder: MY_BUILDER
			-- Product builder

feature -- Basic Operations

	build is
			-- Call `my_builder' to construct a new product.
		do
			my_builder.build
		ensure
			product_not_void: my_builder.last_product /= Void
			part_a_not_void: my_builder.last_product.part_a /= Void
			part_b_not_void: my_builder.last_product.part_b /= Void
		end

invariant

	my_builder_not_void: my_builder /= Void

end
