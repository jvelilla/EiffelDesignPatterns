indexing

	description:

		"Composite flyweight (unshared)"

	pattern: "Flyweight"
	reusable_version: "Flyweight library (see ${PATTERN}/library/flyweight)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class COMPOSITE_FLYWEIGHT

inherit

	FLYWEIGHT
		undefine
			do_something,
			is_composite
		redefine
			set_external_characteristic
		end

	COMPOSITE [FLYWEIGHT]
		rename
			parts as flyweights,
			add as add_flyweight,
			remove as remove_flyweight
		redefine
			make,
			item,
			add_flyweight,
			remove_flyweight
		end

	EXTERNAL_PROPERTY_CONSTANTS
		export
			{NONE} all
		end

create

	make

feature -- Initialization

	make is
			-- Initialize context and pool of instantiated flyweights.
		do
			Precursor {COMPOSITE}
			create context.make (default_external_characteristic)
			create flyweight_pool.make (1, flyweight_pool_count)
		ensure then
			context_external_characteristic_set: 
				context.external_characteristic = default_external_characteristic
		end

feature -- Access

	item: SHARED_FLYWEIGHT is
			-- Current item
		do
			Result ?= Precursor {COMPOSITE}
		end

feature -- Element change

	set_external_characteristic (a_characteristic: like external_characteristic;
									a_context: FLYWEIGHT_CONTEXT) is
			-- Set external characteristic of `a_context' to `a_characteristic' 
			-- (i.e. for all flyweights of the composite).
		do
			Precursor {FLYWEIGHT} (a_characteristic, a_context)
			a_context.set_external_characteristic (a_characteristic, flyweights.count)
			set_context (a_context)
		end

	set_external_characteristic_range (a_characteristic: like external_characteristic;
										lower, upper: INTEGER) is
			-- Set external characteristic of current context to `a_characteristic'
			-- for `lower' to `upper' flyweights.
		require
			a_characteristic_not_void: a_characteristic /= Void
			valid_range: lower <= upper and then lower >= 1 and upper <= context.size
		do
			context.start
			context.move (lower - 2)
			context.set_external_characteristic (a_characteristic, upper - lower + 1)
		end

	set_context (a_context: like context) is
			-- Set `context' to `a_context'.
		require
			a_context_not_void: a_context /= Void
		do
			context := a_context
		ensure
			context_set: context = a_context
		end

	add_flyweights (some_flyweights: ARRAY [like item]) is
			-- Extend current composite with `some_flyweights'.
		require
			some_flyweights_not_void: some_flyweights /= Void
			no_void_flyweight: not some_flyweights.has (Void)
			some_flyweights_not_empty: not some_flyweights.is_empty
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > some_flyweights.count
			loop
				add_flyweight (some_flyweights @ i)
				i := i + 1
			end
		ensure
			flyweight_count_increased: flyweights.count = old flyweights.count + some_flyweights.count
		end

	add_flyweight (a_flyweight: like item) is
			-- Add `a_flyweight' to composite and update current context.
			--|Extend `flyweights'.
		do
			context.start
			if not flyweights.is_empty then
				context.move (flyweights.count - 1)
			end
			context.insert (1)
			flyweights.extend (flyweight_factory.new_with_args ([a_flyweight.characteristic]))
		end

	insert_flyweights (some_flyweights: ARRAY [like item]; an_index: INTEGER) is
			-- Insert `some_flyweights' in current composite flyweight
			-- starting from `an_index'.
		require 
			some_flyweights_not_void: some_flyweights /= Void
			no_void_flyweight: not some_flyweights.has (Void)
			some_flyweights_not_empty: not some_flyweights.is_empty
			an_index_is_positive: an_index >= 0
		local
			i: INTEGER
		do
			if flyweights.is_empty then
				add_flyweights (some_flyweights)
			end

			context.start
			context.move (an_index - 2)
			context.insert (some_flyweights.count)

			from
				flyweights.go_i_th (an_index - 1)
				i := 1
			until
				i > some_flyweights.count
			loop
				flyweights.put_right (flyweight_factory.new_with_args ([(some_flyweights @ i).characteristic]))
				flyweights.forth
				i := i + 1
			end
		ensure
			flyweight_count_increased: flyweights.count = old flyweights.count + some_flyweights.count
		end

feature -- Removal

	remove_flyweight (a_flyweight: like item) is
			-- Remove `a_flyweight' from composite and update current context.
		do
			flyweights.search (a_flyweight)
			context.start
			context.move (flyweights.index - 1)
			context.insert (-1)
			flyweights.remove
		end

feature -- Output

	draw (a_context: FLYWEIGHT_CONTEXT) is
			-- Draw current according to `a_context'.
		require else
			a_context_may_be_void: a_context = Void and then context /= Void
		local
			a_size: INTEGER
		do
			if a_context /= Void then
				context := a_context
				a_size := context.size
				if a_size /= flyweights.count then
					context.start
					context.insert (flyweights.count - a_size)
				end
			end
			from
				start
				context.start
			until
				after
			loop
				item.draw (context)
				forth
				context.forth
			end
		ensure then
			context_set: old context = Void implies context = a_context
		end

feature -- Access

	context: FLYWEIGHT_CONTEXT
			-- Extrinsic context of the flyweight

feature {NONE} -- Constant

	Flyweight_pool_count: INTEGER is 128
			-- Number of flyweights that can be created

feature {NONE} -- Implementation

	flyweight_factory: FACTORY [SHARED_FLYWEIGHT] is
			-- Factory of flyweight
		once
			create Result.make (agent new_flyweight)
		ensure
			flyweight_factory_created: Result /= Void
		end

	new_flyweight (a_characteristic: INTEGER): like item is
			-- New flyweight with diameter `a_diameter'
		require
			a_characteristic_above_minimum: a_characteristic >= feature {SHARED_FLYWEIGHT}.minimum_characteristic
			a_characteristic_under_maximum: a_characteristic <= feature {SHARED_FLYWEIGHT}.maximum_characteristic
		do
			if (flyweight_pool @ a_characteristic) = Void then
				create Result.make (a_characteristic)
				flyweight_pool.put (Result, a_characteristic)
			else
				Result := flyweight_pool @ a_characteristic
			end
		ensure
			flyweight_not_void: Result /= Void
			flyweight_diameter_set: Result.characteristic = a_characteristic
		end

	default_external_characteristic: EXTERNAL_PROPERTY is
			-- Default external_characteristic
		once
			create Result.make (default_code)
		ensure
			default_external_characteristic_not_void: Result /= Void
		end

	flyweight_pool: ARRAY [like item]
			-- Pool of instantiated flyweights

invariant

	context_not_void: context /= Void
	flyweight_pool_not_void: flyweight_pool /= Void
	consistent_flyweight_pool: flyweight_pool.count = flyweight_pool_count

end
