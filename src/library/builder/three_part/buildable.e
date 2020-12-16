note

	description:
		"[
			Common properties of products,
			which can be built by a three-part builder
		]"

	library: "Builder library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class BUILDABLE [G, H, J]

feature -- Access

	g: detachable G
			-- First part of the product to be created

	h: detachable H
			-- Second part of the product to be created

	j: detachable J
			-- Third part of the product to be created

feature {THREE_PART_BUILDER} -- Status Setting

	set_g (a_g: like g)
			-- Set `g' to `a_g'.
		require
			a_g_not_void: a_g /= Void
		do
			g := a_g
		ensure
			g_set: g = a_g
		end

	set_h (a_h: like h)
			-- Set `h' to `a_h'.
		require
			a_h_not_void: a_h /= Void
		do
			h := a_h
		ensure
			h_set: h = a_h
		end

	set_j (a_j: like j)
			-- Set `j' to `a_j'.
		require
			a_j_not_void: a_j /= Void
		do
			j := a_j
		ensure
			j_set: j = a_j
		end

end
