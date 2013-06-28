indexing

	description:

		"Client using the Abstract Factory design pattern"

	pattern: "Abstract Factory"
	reusable_version: "Factory library (see ${PATTERN}/library/factory)"
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
				create {FACTORY_1} factory
			when product_family_2_id then 
				create {FACTORY_2} factory
			end
			product_a := factory.new_product_a
			debug 
				io.put_string ("A new product of type ")
				io.put_string (product_a.generating_type)
				io.put_string (" has been created.%N%N")
			end
			product_b := factory.new_product_b
			debug 
				io.put_string ("A new product of type ")
				io.put_string (product_b.generating_type)
				io.put_string (" has been created.%N%N")
			end
		end

feature -- Access

	factory: FACTORY
			-- Abstract factory

	product_a: PRODUCT_A
			-- Abstract product A

	product_b: PRODUCT_B
			-- Abtract product B

invariant

	factory_not_void: factory /= Void
	product_a_not_void: product_a /= Void
	product_b_not_void: product_b /= Void

end
