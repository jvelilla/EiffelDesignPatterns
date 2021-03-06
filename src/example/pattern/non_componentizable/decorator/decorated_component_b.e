note

	description:
		"[
			Second kind of concrete decorated component
			('Concrete Decorator') 
			with redefined operation (additional behavior)
		]"

	pattern: "Decorator"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class DECORATED_COMPONENT_B

inherit

	DECORATED_COMPONENT
		redefine
			do_something
		end

create

	make

feature -- Basic Operation

	do_something
			-- Do something.
		do
			Precursor {DECORATED_COMPONENT}
			do_something_more
		end

feature {NONE} -- Implementation

	do_something_more 
			-- Do something more.
		do
			-- Do something more than just
			-- `do_something'.
			debug
				io.put_string ("Do something more...%N")
			end
		end

end
