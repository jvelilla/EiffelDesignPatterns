indexing

	description:

		"Representation of a state"

	library: "State library"
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

	make_with_next (a_context: like context; a_state: like next) is
			-- Set `context' to `a_context'.
			-- Set `next' to `a_state'.
		require
			a_context_not_void: a_context /= Void
			a_state_not_void: a_state /= Void
		do
			context := a_context
			next := a_state
		ensure
			context_set: context = a_context
			next_set: next = a_state
		end

feature -- Access

	context: CONTEXT
			-- Application context

	next: STATE
			-- Next state

feature -- Status setting

	set_next (a_state: like next) is
			-- Set `next' to `a_state'.
		do
			next := a_state
		ensure
			next_set: next = a_state
		end

feature -- Basic operations

	do_something is
			-- Do something depending on the state.
		require
			state_not_null: not conforms_to (create {NULL_STATE}.make (context)) 
		do
			do_something_imp
			if next /= Void then
				context.set_state (next)
			end
		ensure
			next_state_set: next /= Void implies context.state = next
			state_unchanged: next = Void implies context.state = Current
		end

feature {NONE} -- Implementation

	do_something_imp is
			-- Do something depending on the state.
		require
			state_not_null: not conforms_to (create {NULL_STATE}.make (context))
		deferred
		end

invariant

	context_not_void: context /= Void

end
