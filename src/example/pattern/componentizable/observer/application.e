note

	description:

		"Application using the Observer pattern"

	pattern: "Observer"
	reusable_version: "Event library (see ${PATTERN}/library/event)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class APPLICATION

create

	make

feature {NONE} -- Initialization

	make
			-- Do something using the Observer pattern.
		local
			my_display: MY_DISPLAY2
		do
			create my_display.make (create {MY_DATA})
		end

end
