indexing

	description:

		"Context"

	library: "State library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class CONTEXT

create

	make

feature {NONE} -- Initialization

	make is
			-- Initialize `state' to a "null" state
			-- that does nothing.
		do
			create {NULL_STATE} state.make (Current)
		ensure
			null_state: state.conforms_to (create {NULL_STATE}.make (Current))
		end

feature -- Basic operations

	do_something is
			-- Do something depending on the state.
		do
			state.do_something
		end

feature -- Access

	state: STATE
			-- Current state of the application

feature -- Element change

	set_state (a_state: like state) is
			-- Set `state' to `a_state'.
		require
			a_state_not_void: a_state /= Void
		do
			state := a_state
		ensure
			state_set: state = a_state
		end 

invariant

	state_not_void: state /= Void

end
