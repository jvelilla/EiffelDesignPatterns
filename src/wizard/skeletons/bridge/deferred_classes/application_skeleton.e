indexing

	description:

		"Application using the Bridge design pattern"

	pattern: "Bridge"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"
	
deferred class <BRIDGE_CLASS_NAME>

feature {NONE} -- Initialization

	<BRIDGE_CREATION_PROCEDURE_NAME> (an_implementation: like impl) is
			-- Set `impl' to `an_implementation'.
		require
			an_implementation_not_void: an_implementation /= Void
		do
			impl := an_implementation
		ensure
			impl_set: impl = an_implementation
		end

feature -- Basic operation

	<BRIDGE_FEATURE_NAME> is
			-- Do something.
		do
			impl.<BRIDGE_IMPLEMENTATION_FEATURE_NAME>
		end

feature {NONE} -- Implementation

	impl: <BRIDGE_IMPLEMENTATION_CLASS_NAME>
			-- Implementation

invariant

	impl_not_void: impl /= Void

end
