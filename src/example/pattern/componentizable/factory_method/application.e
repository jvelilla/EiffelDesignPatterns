indexing

	description:
		"[
			Do something on objects of type PRODUCT.
			Use the factory method `new_product', which
			creates instances of type PRODUCT to do so.
		]"

	pattern: "Factory Method"
	reusable_version: "Factory library (see ${PATTERN}/library/factory)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class APPLICATION

feature -- Basic operations

	do_something is
			-- Do something, which needs to create
			-- a new object of type `PRODUCT'.
			-- Use the factory method `new_product' to do so.
		local
			a_product: PRODUCT
		do
			a_product := new_product
			debug
				io.put_string ("Create a new instance of type ")
				io.put_string (a_product.generating_type)
				io.put_string (" to do something.%N")
			end
			-- Do something on `a_product'.
		end

feature {NONE} -- Factory method

	new_product: PRODUCT is
			-- New instance of type `PRODUCT'
		deferred
		ensure
			new_product_not_void: Result /= Void
		end

end
