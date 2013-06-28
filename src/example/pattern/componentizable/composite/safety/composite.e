indexing

	description:

		"Composite component"

	pattern: "Composite (safety version)"
	reusable_version: "Composite library (see ${PATTERN}/library/composite)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class COMPOSITE

inherit

	COMPONENT
		redefine
			is_composite
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Initialize component parts.
		do
			create parts.make
		end

feature -- Status report

	is_composite: BOOLEAN is
			-- Is component a composite?
		do
			Result := True
		end

feature -- Basic operation

	do_something is
			-- Do something.
		do
			debug
				io.put_string ("Do something on a composite.%N")
			end
			from
				parts.start
			until
				parts.after
			loop
				parts.item.do_something
				parts.forth
			end
		end

feature -- Access

	i_th, infix "@" (i: INTEGER): COMPONENT is
			-- `i'-th part
		require
			index_valid: i > 0 and i <= count
		do
			Result := parts @ i
		ensure
			definition: Result = parts @ i
			component_not_void: Result /= Void
		end

feature -- Measurement

	count: INTEGER is
			-- Number of component parts
		do
			Result := parts.count
		ensure
			definition: Result = parts.count
		end

feature -- Element change

	add (a_part: like i_th) is
			-- Add `a_part' to component `parts'.
		require
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

	remove (a_part: like i_th) is
			-- Remove `a_part' from component `parts'.
		require
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

	has (a_part: like i_th): BOOLEAN is
			-- Does composite contain `a_part'?
		require
			a_part_not_void: a_part /= Void
		do
			Result := parts.has (a_part)
		ensure
			definition: Result = parts.has (a_part)
		end

feature {NONE} -- Implementation

	parts: LINKED_LIST [like i_th]
			-- Component parts (which are themselves components)

invariant

	is_composite: is_composite
	parts_not_void: parts /= Void
	no_void_part: not parts.has (Void)

end
