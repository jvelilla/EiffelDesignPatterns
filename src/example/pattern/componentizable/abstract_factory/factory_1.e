note

	description:
		"[
			First concrete factory for products 
			of type PRODUCT_A1 and PRODUCT_B1
		]"

	pattern: "Abstract Factory"
	reusable_version: "Factory library (see ${PATTERN}/library/factory)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class FACTORY_1

inherit

	FACTORY

feature -- Factory methods

	new_product_a: PRODUCT_A1
			-- New product of type `PRODUCT_A1'
		do
			create Result
		end

	new_product_b: PRODUCT_B1 
			-- New product of type `PRODUCT_B1'
		do
			create Result
		end

end
