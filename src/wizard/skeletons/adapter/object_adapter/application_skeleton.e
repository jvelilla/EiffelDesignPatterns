indexing

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

	make is
			-- Do something.
			-- (Show a typical use of the Adapter pattern.)
		local
			an_adaptee: <ADAPTER_ADAPTEE_CLASS_NAME>
		do
				-- Call the version of `TARGET'.
			do_something (create {<ADAPTER_TARGET_CLASS_NAME>})

			create an_adaptee
			-- Possibly perform some operations on `an_adaptee'.

				-- Do something using existing object `adaptee'.
				-- Call the version of `ADAPTEE'.
			do_something (create {<ADAPTER_CLASS_NAME>}.<ADAPTER_CREATION_PROCEDURE_NAME> (an_adaptee))
		end

feature -- Basic operations

	do_something (a_target: <ADAPTER_TARGET_CLASS_NAME>) is
			-- Do something on `a_target'.
		require
			a_target_not_void: a_target /= Void
		do
			a_target.<ADAPTER_TARGET_FEATURE_NAME>
		end

end
