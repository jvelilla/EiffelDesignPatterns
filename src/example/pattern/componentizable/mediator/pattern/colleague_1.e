note

	description:

		"Concrete colleague 1"

	pattern: "Mediator"
	reusable_version: "Mediator library (see ${PATTERN}/library/mediator)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class COLLEAGUE_1

inherit

	COLLEAGUE

create

	make

feature -- Basic operations

	change_1
			-- Change something on Current.
		do
			debug
				io.put_string ("Change something in ")
				io.put_string_32 (generating_type.name_32.to_string_32)
				io.put_string (".%N")
			end
			-- Do something that changes Current's state.
			notify_mediator
		end

	do_something_1
			-- Do something.
		do
			debug
				io.put_string ("Do something in ")
				io.put_string_32 (generating_type.name_32.to_string_32)
				io.put_string (".%N")
			end
			-- Do something.
		end

end
