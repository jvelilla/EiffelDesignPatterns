note

	description:

		"Component"

	pattern: "Composite (transparency version)"
	reusable_version: "Composite library (see ${PATTERN}/library/composite)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class COMPONENT

feature -- Basic operation

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

	i_th alias "@" (i: INTEGER): COMPONENT
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

	add (a_part: like i_th)
			-- Add `a_part' to component `parts'.
		require
			is_composite: is_composite
			a_part_not_void: a_part /= Void
			not_part: not has (a_part)
		do
			debug
				io.put_string ("Add a part to composite.%N")
			end
			parts.extend (a_part)
		ensure
			one_more: parts.count = old parts.count + 1
			has_part: has (a_part)
		end

feature -- Removal

	remove (a_part: like i_th)
			-- Remove `a_part' from component `parts'.
		require
			is_composite: is_composite
			a_part_not_void: a_part /= Void
			has_part: has (a_part)
		do
			debug
				io.put_string ("Remove a part from composite.%N")
			end
			parts.search (a_part)
			parts.remove
		ensure
			one_less: parts.count = old parts.count - 1
			not_part: not has (a_part)
		end

feature -- Contract support

	has (a_part: like i_th): BOOLEAN
			-- Does composite contain `a_part'?
		require
			is_composite: is_composite
			a_part_not_void: a_part /= Void
		do
			Result := parts.has (a_part)
		ensure
			definition: Result = parts.has (a_part)
		end

feature {NONE} -- Implementation

	parts: LINKED_LIST [like i_th] 
			-- Component parts
			-- (which are themselves components)
		deferred
		end

invariant

	parts_consistent:
--		is_composite implies (parts /= Void and then not parts.has (Void))

end
