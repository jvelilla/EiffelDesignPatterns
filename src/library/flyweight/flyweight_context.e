indexing

	description:

		"Flyweight context"

	library: "Flyweight library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class FLYWEIGHT_CONTEXT [G]

create

	make

feature {NONE} -- Initialization

	make (a_characteristic: like external_characteristic) is
			-- Create a first context zone from `a_characteristic'.
		require
			a_characteristic_not_void: a_characteristic /= Void
		do
			create external_characteristic_zones.make
			external_characteristic_zones.extend (new_zone (a_characteristic, 0))
			external_characteristic_zones.start
		ensure
			is_first_external_characteristic_zone: zone_number = 1
		end

feature -- Access

	external_characteristic: G is
			-- External characteristic of current zone
		do
			Result := external_characteristic_zones.item.external_characteristic 
		ensure
			definition: Result = external_characteristic_zones.item.external_characteristic
		end

feature -- Element change

	insert (a_number: INTEGER) is
			-- Insert `a_number' of flyweights
			-- at the current place in the composite.
		require
			a_number_strictly_positif: a_number > 0
		do
			external_characteristic_zones.item.resize (a_number)
		ensure
			inserted: external_characteristic_zones.item.size = 
						old external_characteristic_zones.item.size + a_number
		end

	set_external_characteristic (a_characteristic: like external_characteristic; a_number: INTEGER) is
			-- Change the external characteristic for `a_number' of flyweights
			-- from current position in the context.
		require
			a_characteristic_not_void: a_characteristic /= Void
			a_number_strictly_positive: a_number > 0
		local
			right_size: INTEGER 
			old_external_characteristic: G
		do
					-- Space left at the right of the new zone
			right_size := external_characteristic_zones.item.size - (index + a_number)
			old_external_characteristic := external_characteristic_zones.item.external_characteristic
			if index = 1 then
					-- Replace from the beginning of the zone.
				external_characteristic_zones.item.make (a_characteristic, a_number)
			else
					-- Shorten the current zone, and insert the new one.
				external_characteristic_zones.item.make (old_external_characteristic, index)
				external_characteristic_zones.go_i_th (zone_number)
				external_characteristic_zones.put_right (new_zone (a_characteristic, a_number))
				external_characteristic_zones.forth
			end
			if right_size > 0 then
					-- Insert a new zone at the right, with old external_characteristic.
				external_characteristic_zones.go_i_th (zone_number)
				external_characteristic_zones.put_right (new_zone (old_external_characteristic, right_size))
				external_characteristic_zones.forth
			end
				-- first flyweight in the new zone
			start
		end

	size: INTEGER is
			-- Total size of the context (in number of flyweights)
		do
			from
				external_characteristic_zones.start
			until
				external_characteristic_zones.after
			loop
				Result := Result + external_characteristic_zones.item.size
				external_characteristic_zones.forth
			end
		end

feature -- Traversal

	start is
			-- Start a traversal.
			--|Start `external_characteristic_zones'.
			--|Set `index' to 1.
		do
			external_characteristic_zones.start
			index := 1
		ensure
			first_external_characteristic_zone: zone_number = 1
			index_equals_one: index = 1 
		end

	forth is
			-- Advance to the next flyweight.
		do
			move (1)
		end

	move (a_step: INTEGER) is
			-- Move index `a_step' times.
		require
			a_step_positive: a_step >= 0
		do
			from
				index := index + a_step
			until
				zone_number = external_characteristic_zones.count
				or else index <= external_characteristic_zones.item.size 
			loop
				index := index - external_characteristic_zones.item.size 
				set_zone_number (zone_number + 1)
			end
		end

feature {NONE} -- Implementation

	external_characteristic_zones: LINKED_LIST [CONTEXT_ZONE [G]]
			-- Item zones in composite

	zone_number: INTEGER is
			-- Index of current external_characteristic zone in `external_characteristic_zones'
		do
			Result := external_characteristic_zones.index
		ensure
			definition: Result = external_characteristic_zones.index
		end

	set_zone_number (a_zone_number: like zone_number) is
			-- Set zone number with `a_zone_number'.
		require
			a_zone_number_is_valid: 
				external_characteristic_zones.valid_index (a_zone_number)
		do
			external_characteristic_zones.go_i_th (a_zone_number)
		ensure
			zone_number_set: zone_number = a_zone_number
		end

	index: INTEGER
			-- Position in external_characteristic zone during traversals

	new_zone (a_characteristic: G; a_size: INTEGER): CONTEXT_ZONE [G] is
			-- New external characteristic zone with `a_characteristic' and size `a_size'
		require
			a_characteristic_not_void: a_characteristic /= Void
			a_size_positive: a_size >= 0
		do
			create Result.make (a_characteristic, a_size)
		end

invariant

	external_characteristic_zones_not_void: external_characteristic_zones /= Void
	no_void_external_characteristic_zone: not external_characteristic_zones.has (Void)
	external_characteristic_zones_not_empty: not external_characteristic_zones.is_empty
	index_positive: index >= 0

end
