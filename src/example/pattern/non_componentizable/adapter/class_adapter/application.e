indexing

	description:

		"Application using the Class Adapter pattern"

	pattern: "Class adapter"
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
			-- Do something.
			-- (Show a typical use of the Adapter pattern.)
		do
				-- Call the version of `TARGET'.
			do_something (create {TARGET})

				-- Call the version of `ADAPTEE'.
			do_something (create {ADAPTER})
		end

feature -- Basic operations

	do_something (a_target: TARGET) is
			-- Do something on `a_target'.
		require
			a_target_not_void: a_target /= Void
		do
			a_target.f
		end

end
