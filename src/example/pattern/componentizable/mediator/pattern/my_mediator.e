note

	description:

		"Concrete mediator"

	pattern: "Mediator"
	reusable_version: "Mediator library (see ${PATTERN}/library/mediator)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class MY_MEDIATOR

inherit

	MEDIATOR

create

	make

feature {NONE} -- Initialization

	make
			-- Create `colleague_1' and `colleague_2'.
		do
			create colleague_1.make (Current)
			create colleague_2.make (Current)
		end

feature -- Access

	colleague_1: COLLEAGUE_1
			-- First colleague of mediator

	colleague_2: COLLEAGUE_2
			-- Second colleague of mediator

feature -- Basic operations

	update_colleagues (a_colleague: COLLEAGUE)
			-- Update colleagues because `a_colleague' changed.
		do
			debug
				io.put_string ("Update colleagues.%N")
			end
			if a_colleague = colleague_1 then
				colleague_2.do_something_2
			elseif a_colleague = colleague_2 then
				colleague_1.do_something_1
			else
				debug
					io.put_string ("Colleague not known.%N")
				end
			end
		end

invariant

	colleague_1_not_void: colleague_1 /= Void
	colleague_2_not_void: colleague_2 /= Void

end
