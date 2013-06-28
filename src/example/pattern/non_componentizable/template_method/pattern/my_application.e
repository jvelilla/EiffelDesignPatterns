indexing

	description:

		"Particular application using the Template method pattern."

	pattern: "Template method"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class MY_APPLICATION

inherit

	APPLICATION

feature -- Status report

	ready: BOOLEAN is True
			-- Are all conditions met for 
			-- feature `do_something' to be called?

	done: BOOLEAN
			-- Has `do_something' done its job?

feature {NONE} -- Status report

	first_part_done: BOOLEAN
			-- Has `do_something_imp_1' done its job?

feature {NONE} -- Implementation ("Hook" features)

	do_something_imp_1 is
			-- Do something.
		do
			debug
				io.put_string ("Do something -- First part -- in ")
				io.put_string (generating_type)
				io.put_string (".%N")
			end
			-- Do something
			first_part_done := True
		end

	do_something_imp_2 is
			-- Do something.
		do
			debug
				io.put_string ("Do something -- Second -- in ")
				io.put_string (generating_type)
				io.put_string (".%N")
			end
			-- Do something.
			done := True
		end

end

