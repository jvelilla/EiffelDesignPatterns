indexing

	description:

		"Constants for product families"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PRODUCT_CONSTANTS

feature -- Constants

	Product_family_1_id: INTEGER is 1
			-- Identifier of first product family

	Product_family_2_id: INTEGER is 2
			-- Identifier of second product family

feature -- Status report

	is_valid_product_family_id (an_id: INTEGER): BOOLEAN is
			-- Is `an_id' a valid product family identifier?
		do
			Result := an_id >= product_family_1_id 
						and an_id <= product_family_2_id
		ensure
			definition: Result = (an_id >= product_family_1_id 
								and an_id <= product_family_2_id)
		end

end
