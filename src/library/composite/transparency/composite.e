indexing

	description:

		"Composite component"

	library: "Composite library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class COMPOSITE [G]

inherit

	COMPONENT [G]
		redefine
			is_composite
		end

create

	make,
	make_from_components

feature {NONE} -- Initialization

	make is
			-- Initialize component parts.
		do
			create parts.make
		end

	make_from_components (some_components: like parts) is
			-- Set `parts' to `some_components'.
		require
			some_components_not_void: some_components /= Void
			no_void_component: not some_components.has (Void)
		do
			parts := some_components
		ensure
			parts_set: parts = some_components
		end

feature -- Status report

	is_composite: BOOLEAN is
			-- Is component a composite?
		do
			Result := True
		end

feature -- Basic Operation

	do_something is
			-- Do something.
		do
			debug
				io.put_string ("Do something on a composite.%N")
			end
			from parts.start until parts.after loop
				parts.item.do_something
				parts.forth
			end
		end

feature {NONE} -- Implementation

	parts: LINKED_LIST [like item]
			-- Component parts (which are themselves components)

invariant

	is_composite: is_composite
	parts_not_void: parts /= Void
	no_void_part: not parts.has (Void)

end
