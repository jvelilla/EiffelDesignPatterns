note

	description:

		"Handle requests from client and build product part by part."

	pattern: "Builder"
	reusable_version: "Builder library (see ${PATTERN}/library/builder)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class MY_BUILDER

inherit

	BUILDER

feature -- Access

	last_product: detachable PRODUCT
			-- Product being built

feature -- Basic operations

	build
			-- Create and build `last_product'.
		do
			build_product
			build_part_a
			build_part_b
		ensure then
			part_a_not_void: attached last_product as l_last_product implies l_last_product.part_a /= Void
			part_b_not_void: attached last_product as l_last_product implies l_last_product.part_b /= Void
		end

feature {NONE} -- Implementation

	build_product
			-- Create `last_product'.
		do
			debug
				io.put_string ("Create new product.%N")
			end
			create last_product
		ensure
			last_product_not_void: last_product /= Void
		end

	build_part_a
			-- Build first part of the product.
		require
			last_product_not_void: last_product /= Void
		do
			check attached last_product as l_last_product then
				l_last_product.set_part_a (create {PART_A})
				debug
					io.put_string ("Set product part A.%N")
				end
			end
		ensure
			part_a_not_void: attached last_product as l_product implies l_product.part_a /= Void
		end

	build_part_b
			-- Build second part of the product.
		require
			last_product_not_void: last_product /= Void
			part_a_not_void: attached last_product as l_product implies l_product.part_a /= Void
		do
			check attached last_product as l_last_product then
				l_last_product.set_part_b (create {PART_B})
				debug
					io.put_string ("Set product part B.%N")
				end
			end

		ensure
			part_b_not_void: attached last_product as l_product implies l_product.part_b /= Void
		end

end
