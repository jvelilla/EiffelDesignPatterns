note

	description:

		"Abstract factory for products of type PRODUCT_A and PRODUCT_B"

	pattern: "Abstract Factory"
	reusable_version: "Factory library (see ${PATTERN}/library/factory)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class FACTORY

feature -- Factory methods

	new_product_a: PRODUCT_A
			-- New product of type `PRODUCT_A'
		deferred
		ensure
			new_product_a_not_void: Result /= Void
		end

	new_product_b: PRODUCT_B
			-- New product of type `PRODUCT_B'
		deferred
		ensure
			new_product_b_not_void: Result /= Void
		end

end
