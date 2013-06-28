indexing

	description:

		"Application using a two-part builder"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class APPLICATION

create

	make

feature {NONE} -- Initialization

	make is
			-- Build a new two-part product with a two-part builder.
		local
			my_builder: TWO_PART_BUILDER [TWO_PART_PRODUCT,
											PART_A, PART_B]
			my_product: TWO_PART_PRODUCT
		do
			create my_builder.make (agent new_product,
									agent new_part_a,
									agent new_part_b)
			my_builder.build_with_args (["Two-part product"],
								["Part A"],
								["Part B"])
			my_product := my_builder.last_product
		end

feature -- Factory functions

	new_product (a_name: STRING): TWO_PART_PRODUCT is
			-- New object of type `TWO_PART_PRODUCT'
			-- from `a_name'
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			debug
				io.put_string ("Create new product with name ")
				io.put_string (a_name)
				io.put_string (".%N")
			end
			create Result.make (a_name)
		ensure
			new_product_not_void: Result /= Void
			name_set: Result.name = a_name
		end

	new_part_a (a_name: STRING): PART_A is
			-- New object of type `PART_A' from `a_name'
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			debug
				io.put_string ("Build product part A with name ")
				io.put_string (a_name)
				io.put_string (".%N")
			end
			create Result.make (a_name)
		ensure
			new_part_a_not_void: Result /= Void
			name_set: Result.name_a = a_name
		end

	new_part_b (a_name: STRING): PART_B is
			-- New object of type `PART_B' from `a_name'
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			debug
				io.put_string ("Build product part B with name ")
				io.put_string (a_name)
				io.put_string (".%N")
			end
			create Result.make (a_name)
		ensure
			new_part_b_not_void: Result /= Void
			name_set: Result.name_b = a_name
		end

end
