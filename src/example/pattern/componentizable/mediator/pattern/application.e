indexing

	description:

		"Application using the Mediator pattern"

	pattern: "Mediator"
	reusable_version: "Mediator library (see ${PATTERN}/library/mediator)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class APPLICATION

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a mediator and 
			-- change some of its colleagues.
		local
			a_mediator: MY_MEDIATOR
		do
			create a_mediator.make
			debug
				io.put_string ("Change something in colleague 1 of mediator:%N")
			end
			a_mediator.colleague_1.change_1

			debug
				io.put_new_line
				io.put_string ("Change something in colleague 2 of mediator:%N")
			end
			a_mediator.colleague_2.change_2 
		end

end
