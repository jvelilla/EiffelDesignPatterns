indexing

	description:

		"Mediator"

	pattern: "Mediator"
	reusable_version: "Mediator library (see ${PATTERN}/library/mediator)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class MEDIATOR

create

	make

feature {NONE} -- Initialization

	make is
			-- Create `colleague_1' and `colleague_2'.
		do
			create colleague_1.make (Current)
			create colleague_2.make (Current)

			colleague_1.event_1.subscribe (agent colleague_2.do_something_2)
			colleague_2.event_2.subscribe (agent colleague_1.do_something_1)
		end

feature -- Access

	colleague_1: COLLEAGUE_1
			-- First colleague of mediator

	colleague_2: COLLEAGUE_2
			-- Second colleague of mediator

invariant

	colleague_1_not_void: colleague_1 /= Void
	colleague_2_not_void: colleague_2 /= Void

end
