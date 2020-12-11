note

	description:

		"Subject"

	pattern: "Observer"
	reusable_version: "Event library (see ${PATTERN}/library/event)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class SUBJECT

inherit

	ANY
		redefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
			-- Create `observers'.
		do
			create observers.make
		end

feature -- Observer pattern

	add_observer (an_observer: OBSERVER)
			-- Add an_observer to the list of observers.
		require
			not_yet_an_observer: not observers.has (an_observer)
		do
			observers.extend (an_observer)
		ensure
			observer_added: observers.has (an_observer)
			one_more: observers.count = old observers.count + 1
		end

	remove_observer (an_observer: OBSERVER)
			-- Remove an_observer from the list of observers.
		require
			is_an_observer: observers.has (an_observer)
		do
			observers.search (an_observer)
			observers.remove
		ensure
			observer_removed: not observers.has (an_observer)
			one_less: observers.count = old observers.count - 1
		end

	notify_observers
			-- Notify all observers.
			-- (Call update on each observer.)
		do
			across observers as ic loop
				ic.item.update
			end
		end

	observers: LINKED_LIST [OBSERVER]
			-- List of observers.

invariant

	observers_not_void: observers /= Void

end
