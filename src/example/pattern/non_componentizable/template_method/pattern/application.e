indexing

	description:

		"Application using the Template method pattern."

	pattern: "Template method"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class APPLICATION

feature -- Template method

	frozen do_something is
			-- Do something.
		require
			ready: ready
		do
			debug
				io.put_string ("Do something -- Template method -- in ")
				io.put_string (generating_type)
				io.put_string (".%N")
			end
			do_something_imp_1
			do_something_imp_2
		ensure
			done: done
		end

feature -- Status report

	ready: BOOLEAN is
			-- Are all conditions met for 
			-- feature `do_something' to be called?
		deferred
		end

	done: BOOLEAN is
			-- Has `do_something' done its job?
		deferred
		end

feature {NONE} -- Status report

	first_part_done: BOOLEAN is
			-- Has `do_something_imp_1' done its job?
		deferred
		end

feature {NONE} -- Implementation ("Hook" features)

	do_something_imp_1 is
			-- Do something.
		require
			ready: ready
		deferred
		ensure
			first_part_done: first_part_done
		end

	do_something_imp_2 is
			-- Do something.
		require
			first_part_done: first_part_done
		deferred
		ensure
			done: done
		end

end
