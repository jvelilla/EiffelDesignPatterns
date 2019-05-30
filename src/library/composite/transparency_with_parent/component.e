note

	description:

		"Component"

	library: "Composite library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class COMPONENT [G]

feature -- Basic Operation

	do_something
			-- Do something.
		deferred
		end

feature -- Status report

	is_composite: BOOLEAN
			-- Is component a composite?
		do
			Result := False
		end

feature -- Access

	parent: detachable COMPOSITE [G]
			-- Parent component, which must be a composite

	item: COMPONENT [G]
			-- Current part of composite
		require
			is_composite: is_composite
		do
			Result := parts.item
		ensure
			definition: Result = parts.item
			component_not_void: Result /= Void
		end

	i_th alias "@" (i: INTEGER): like item
			-- `i'-th part
		require
			is_composite: is_composite
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
			is_composite: is_composite
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
			is_composite: is_composite
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
			is_composite: is_composite
			a_part_not_void: a_part /= Void
		do
			Result := parts.has (a_part)
		ensure
			definition: Result = parts.has (a_part)
		end

	is_empty: BOOLEAN
			-- Does component contain no part?
		require
			is_composite: is_composite
		do
			Result := parts.is_empty
		ensure
			definition: Result = (count = 0)
		end

	off: BOOLEAN
			-- Is there no component at current position?
		require
			is_composite: is_composite
		do
			Result := parts.off
		ensure
			definition: Result = (after or before)
		end

	after: BOOLEAN
			-- Is there no valid position to the right of current one?
		require
			is_composite: is_composite
		do
			Result := parts.after
		ensure
			definition: Result = parts.after
		end

	before: BOOLEAN
			-- Is there no valid position to the left of current one?
		require
			is_composite: is_composite
		do
			Result := parts.before
		ensure
			definition: Result = parts.before
		end

feature -- Measurement

	count: INTEGER
			-- Number of component parts
		require
			is_composite: is_composite
		do
			Result := parts.count
		ensure
			definition: Result = parts.count
		end

feature -- Element change

	add (a_part: like item)
			-- Add `a_part' to component `parts'.
		require
			is_composite: is_composite
			a_part_not_void: a_part /= Void
			not_part: not has (a_part)
			a_part_orphan: a_part.parent = Void
		local
			a_composite: like parent
		do
			debug
				io.put_string ("Adding a part to a composite.%N")
			end
			parts.extend (a_part)
			a_composite ?= Current
			if a_composite /= Void then
				a_part.set_parent (a_composite)
			end
		ensure
			parent_set: a_part.parent = Current
			one_more: parts.count = old parts.count + 1
			has_part: has (a_part)
		end

feature -- Removal

	remove (a_part: like item)
			-- Remove `a_part' from component `parts'.
		require
			is_composite: is_composite
			a_part_not_void: a_part /= Void
			has_part: has (a_part)
			not_orphan: a_part.parent = Current
		do
			debug
				io.put_string ("Removing a part from a composite.%N")
			end
			parts.search (a_part)
			a_part.set_parent (Void)
			parts.remove
		ensure
			void_parent: a_part.parent = Void
			one_less: parts.count = old parts.count - 1
			not_part: not has (a_part)
		end

feature -- Cursor movement

	start
			-- Move cursor to first component part.
			-- Go `after' if no such part.
		require
			is_composite: is_composite
		do
			parts.start
		end

	forth
			-- Move cursor to the next component.
			-- Go `after' if no such part.
		require
			is_composite: is_composite
			not_after: not after
		do
			parts.forth
		end

	finish
			-- Move cursor to last component.
			-- Go `before' if no such part.
		require
			is_composite: is_composite
		do
			parts.finish
		end

	back
			-- Move cursor to the previous component.
			-- Go `before' if no such part.
		require
			is_composite: is_composite
			not_before: not before
		do
			parts.back
		end

feature {COMPONENT} -- Status setting

	set_parent (a_parent: like parent)
			-- Set `parent' to `a_parent'.
		do
			parent := a_parent
		ensure
			parent_set: parent = a_parent
		end

feature {NONE} -- Implementation

	parts: LINKED_LIST [like item]
			-- Component parts (which are themselves components)
		deferred
		end

invariant

	parent_consistent: attached parent as l_parent implies l_parent.has (Current)
--	parts_consistent:
--		is_composite implies (parts /= Void and then not parts.has (Void))

end
