indexing

	description:
		"[
			Effect the factory method `new_product'.
			Redefine it covariantly to return
			an instance of type MY_PRODUCT.
		]"

	pattern: "Factory Method"
	reusable_version: "Factory library (see ${PATTERN}/library/factory)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class MY_APPLICATION

inherit

	APPLICATION

feature {NONE} -- Factory method

	new_product: MY_PRODUCT is
			-- New instance of type `MY_PRODUCT'
		do
			create Result
		end

end
