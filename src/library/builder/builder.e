note

	description:

		"Build a product of type `G'"

	library: "Builder library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class BUILDER [G]

feature -- Access

	last_product: detachable G
			-- Product under construction
		deferred
		end

feature -- Status report

	is_ready: BOOLEAN
			-- Is builder ready to build `last_product'?
		deferred
		end

feature -- Basic operations

	build
			-- Build `last_product'.
		require
			is_ready: is_ready
		deferred
		ensure
			last_product_not_void: last_product /= Void
		end

end
