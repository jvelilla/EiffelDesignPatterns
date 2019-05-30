note

	description:

		"Particular subject"

	pattern: "Observer"
	reusable_version: "Event library (see ${PATTERN}/library/event)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class MY_DATA

inherit

	SUBJECT

feature -- Observer pattern

	add
		        -- Add Current to data to be observed.
		do
		        -- Do something.
		        notify_observers
		end

	remove 
		        -- Remove Current from data to be observed.
		do
		        -- Do something.
		        notify_observers
		end

end
