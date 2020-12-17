note

	description:

		"Application using the Object Adapter pattern"

	pattern: "Object adapter"
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
			-- Do something.
			-- (Show a typical use of the Adapter pattern.)
		local
			an_adaptee: ADAPTEE
		do
				-- Call the version of `TARGET'.
			do_something (create {TARGET})

			create an_adaptee
			-- Possibly perform some operations on `an_adaptee'.

				-- Do something using existing object `adaptee'.
				-- Call the version of `ADAPTEE'.
			do_something (create {ADAPTER}.make (an_adaptee))
		end

feature -- Basic operations

	do_something (a_target: TARGET) 
			-- Do something on `a_target'.
		require
			a_target_not_void: a_target /= Void
		do
			a_target.f
		end

end
