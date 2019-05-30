note

	description:

		"Observer"

	pattern: "Observer"
	reusable_version: "Event library (see ${PATTERN}/library/event)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class OBSERVER

feature -- Observer pattern

	update 
			-- Update observer according to the state of
			-- subject data.
		deferred
		end

end
