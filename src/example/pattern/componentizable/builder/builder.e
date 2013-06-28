indexing

	description:

		"Handle requests from client and build product part by part."

	pattern: "Builder"
	reusable_version: "Builder library (see ${PATTERN}/library/builder)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class BUILDER

feature -- Access

	last_product: ANY is
			-- Product under construction
		deferred
		end

feature -- Basic operations

	build is
			-- Create and build `last_product'.
		deferred
		ensure
			last_product_not_void: last_product /= Void
		end

end

