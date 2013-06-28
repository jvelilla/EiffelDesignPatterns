indexing

	description:

		"Client using the Factory library"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class CLIENT

inherit

	PRODUCT_CONSTANTS
		export
			{NONE} all
			{ANY} is_valid_product_family_id
		end

	ANY

create 

	make

feature -- Initialization

	make (an_id: INTEGER) is
			-- Create a product depending on `an_id'.
		require
			id_valid: is_valid_product_family_id (an_id)
		do
			inspect an_id
			when product_family_1_id then 
				create {FACTORY [PRODUCT_A1]} factory_a.make (agent new_product_a1)
				create {FACTORY [PRODUCT_B1]} factory_b.make (agent new_product_b1)
			when product_family_2_id then 
				create {FACTORY [PRODUCT_A2]} factory_a.make (agent new_product_a2)
				create {FACTORY [PRODUCT_B2]} factory_b.make (agent new_product_b2)
			end
			product_a := factory_a.new
			debug 
				io.put_string ("A new product of type ")
				io.put_string (product_a.generating_type)
				io.put_string (" has been created.%N%N")
			end
			product_b := factory_b.new
			debug 
				io.put_string ("A new product of type ")
				io.put_string (product_b.generating_type)
				io.put_string (" has been created.%N%N")
			end
		ensure
			product_a_not_void: product_a /= Void
			product_b_not_void: product_b /= Void
		end

feature -- Access

	factory_a: FACTORY [PRODUCT_A]
			-- Factory of PRODUCT_A

	factory_b: FACTORY [PRODUCT_B]
			-- Factory of PRODUCT_B

	product_a: PRODUCT_A
			-- Abstract product A

	product_b: PRODUCT_B
			-- Abtract product B

feature {NONE} -- Implementation

	new_product_a1: PRODUCT_A1 is
			-- New product of type PRODUCT_A1
		do
			create Result
		ensure
			product_a1_not_void: Result /= Void
		end

	new_product_a2: PRODUCT_A2 is
			-- New product of type PRODUCT_A2
		do
			create Result
		ensure
			product_a2_not_void: Result /= Void
		end

	new_product_b1: PRODUCT_B1 is
			-- New product of type PRODUCT_B1
		do
			create Result
		ensure
			product_b1_not_void: Result /= Void
		end

	new_product_b2: PRODUCT_B2 is
			-- New product of type PRODUCT_B2
		do
			create Result
		ensure
			product_b2_not_void: Result /= Void
		end

invariant

	factory_a_not_void: factory_a /= Void
	factory_b_not_void: factory_b /= Void

end
