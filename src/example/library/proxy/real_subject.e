indexing

	description:

		"Real subject"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2003/12/19"
	revision: "$Revision: 1.0"

class REAL_SUBJECT

inherit

	SUBJECT

create

	make

feature {NONE} -- Initialization

	make (a_characteristic: like characteristic) is
			-- Initialize subject with `a_characteristic'.
		do
			characteristic := a_characteristic
		ensure then
			characteristic_set: characteristic = a_characteristic
		end

feature -- Access

	characteristic: TUPLE
			-- Characteristic of a subject

feature -- Status setting

	set_characteristic (a_characteristic: like characteristic) is
			-- Set `characteristic' to `a_characteristic'.
		do
			debug
				io.put_string ("Set characteristic of real subject to: ")
				io.put_string ((a_characteristic @ 1).out)
				io.put_new_line
			end
			characteristic := a_characteristic
		end

feature -- Basic operations

	request is
			-- Request something on current subject.
		do
			debug
				io.put_string ("Request on real subject with characteristic: ")
				io.put_string ((characteristic @ 1).out)
				io.put_new_line
			end
		end

	request_with_args (args: TUPLE) is
			-- Request something on current subject using `args'.
		do
			debug
				io.put_string ("Request on real subject with characteristic: ")
				io.put_string ((characteristic @ 1).out)
				io.put_string ("; args: ")
				io.put_string ((args @ 1).out)
				io.put_new_line
			end
		end

invariant

	characteristic_not_void: characteristic /= Void

end
