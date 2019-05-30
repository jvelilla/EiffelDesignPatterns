note

	description:

		"Context zone with the same item"

	library: "Flyweight library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class CONTEXT_ZONE [G]

create {FLYWEIGHT_CONTEXT}

	make

feature {FLYWEIGHT_CONTEXT} -- Initialization

	make (a_characteristic: like external_characteristic; a_size: like size) 
			-- Set `external_characteristic' to `a_characteristic'.
			-- Set `size' to `a_size'.
		require
			a_characteristic_not_void: a_characteristic /= Void
			a_size_positive: a_size >= 0
		do
			external_characteristic := a_characteristic
			size := a_size
		ensure
			external_characteristic_set: external_characteristic = a_characteristic
			size_set: size = a_size
		end

feature -- Access

	external_characteristic: G
			-- Item used in the current zone

	size: INTEGER
			-- Size of current external_characteristic zone

feature {ANY} -- Element change

	resize (a_delta: like size) is
			-- Add `a_delta' to `size'.
		require
			adjusted_size_is_positive: size + a_delta >= 0
		do
			size := size + a_delta
		ensure
			size_adjusted: size = old size + a_delta
		end

invariant

	external_characteristic_not_void: external_characteristic /= Void
	positive_size: size >= 0

end
