note

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

	make
			-- Initialize component parts.
		do
			create parts.make
		end

	make_from_components (some_components: like parts)
			-- Set `parts' to `some_components'.
		require
			some_components_not_void: some_components /= Void
--			no_void_component: not some_components.has (Void)
		do
			parts := some_components
		ensure
			parts_set: parts = some_components
		end

feature -- Status report

	is_composite: BOOLEAN
			-- Is component a composite?
		do
			Result := True
		end

feature -- Basic operation

	do_something
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

feature -- Access

	item: COMPONENT [G]
			-- Current part of composite
		do
			Result := parts.item
		ensure
			definition: Result = parts.item
			component_not_void: Result /= Void
		end

	i_th alias "@" (i: INTEGER): like item
			-- `i'-th part
		require
			index_valid: i > 0 and i <= count
		do
			Result := parts @ i
		ensure
			definition: Result = parts @ i
			component_not_void: Result /= Void
		end

	first: like item
			-- First component part
		require
			not_empty: not is_empty
		do
			Result := parts.first
		ensure
			definition: Result = parts.first
			component_not_void: Result /= Void
		end

	last: like item
			-- Last component part
		require
			not_empty: not is_empty
		do
			Result := parts.last
		ensure
			definition: Result = parts.last
			component_not_void: Result /= Void
		end

feature -- Status report

	has (a_part: like item): BOOLEAN
			-- Does composite contain `a_part'?
		require
			a_part_not_void: a_part /= Void
		do
			Result := parts.has (a_part)
		ensure
			definition: Result = parts.has (a_part)
		end

	is_empty: BOOLEAN
			-- Does component contain no part?
		do
			Result := parts.is_empty
		ensure
			definition: Result = (count = 0)
		end

	off: BOOLEAN
			-- Is there no component at current position?
		do
			Result := parts.off
		ensure
			definition: Result = (after or before)
		end

	after: BOOLEAN
			-- Is there no valid position to the right of current one?
		do
			Result := parts.after
		ensure
			definition: Result = parts.after
		end

	before: BOOLEAN
			-- Is there no valid position to the left of current one?
		do
			Result := parts.before
		ensure
			definition: Result = parts.before
		end

feature -- Measurement

	count: INTEGER
			-- Number of component parts
		do
			Result := parts.count
		ensure
			definition: Result = parts.count
		end

feature -- Element change

	add (a_part: like item)
			-- Add `a_part' to component `parts'.
		require
			a_part_not_void: a_part /= Void
			not_part: not has (a_part)
		do
			debug
				io.put_string ("Adding part to a composite.%N")
			end
			parts.extend (a_part)
		ensure
			one_more: parts.count = old parts.count + 1
			has_part: has (a_part)
		end

feature -- Removal

	remove (a_part: like item)
			-- Remove `a_part' from component `parts'.
		require
			a_part_not_void: a_part /= Void
			has_part: has (a_part)
		do
			debug
				io.put_string ("Removing part from a composite.%N")
			end
			parts.search (a_part)
			parts.remove
		ensure
			one_less: parts.count = old parts.count - 1
			not_part: not has (a_part)
		end

feature -- Cursor movement

	start
			-- Move cursor to first component part.
			-- Go `after' if no such part.
		do
			parts.start
		end

	forth
			-- Move cursor to the next component.
			-- Go `after' if no such part.
		require
			not_after: not after
		do
			parts.forth
		end

	finish
			-- Move cursor to last component.
			-- Go `before' if no such part.
		do
			parts.finish
		end

	back
			-- Move cursor to the previous component.
			-- Go `before' if no such part.
		require
			not_before: not before
		do
			parts.back
		end

feature {NONE} -- Implementation

	parts: LINKED_LIST [like item]
			-- Component parts (which are themselves components)

invariant

	is_composite: is_composite
	parts_not_void: parts /= Void
--	no_void_part: not parts.has (Void)

end
