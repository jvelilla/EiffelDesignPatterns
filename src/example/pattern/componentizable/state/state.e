indexing

	description:

		"Representation of a state"

	pattern: "State"
	reusable_version: "State library (see ${PATTERN}/library/state)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class STATE

feature {NONE} -- Initialization

	make (a_context: like context) is
			-- Set `context' to `a_context'.
		require
			a_context_not_void: a_context /= Void
		do
			context := a_context
		ensure
			context_set: context = a_context
		end

feature -- Access

	context: CONTEXT
			-- Application context

feature -- Basic operations

	do_something is
			-- Do something depending on the state.
		deferred
		end

invariant

	context_not_void: context /= Void

end
