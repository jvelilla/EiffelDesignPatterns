note

	description:

		"Application using the Bridge design pattern"

	pattern: "Bridge"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class APPLICATION

feature {NONE} -- Initialization

	make (an_implementation: like impl)
			-- Set `impl' to `an_implementation'.
		require
			an_implementation_not_void: an_implementation /= Void
		do
			impl := an_implementation
		ensure
			impl_set: impl = an_implementation
		end

feature -- Basic operation

	do_something 
			-- Do something.
		do
			impl.do_something
		end

feature {NONE} -- Implementation

	impl: APPLICATION_IMP
			-- Implementation

invariant

	impl_not_void: impl /= Void

end
