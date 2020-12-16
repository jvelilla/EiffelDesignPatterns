note

	description:

		"Context"

	pattern: "State"
	reusable_version: "State library (see ${PATTERN}/library/state)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class CONTEXT

create

	make

feature {NONE} -- Initialization

	make
			-- Create initial state.
		do
			create initial_state.make (Current)
			create intermediary_state.make (Current)
			create final_state.make (Current)
			state := initial_state
		ensure
			initial_state: state = initial_state
		end

feature -- Basic operations

	do_something
			-- Do something depending on the state.
		do
			state.do_something
		end

feature -- Access

	initial_state: INITIAL_STATE
			-- Initial state

	intermediary_state: INTERMEDIARY_STATE
			-- Intermediary state

	final_state: FINAL_STATE
			-- Final state

feature -- Status report

	is_valid_state (a_state: like state): BOOLEAN
			-- Is `a_state' a valid state?
		require
			a_state_not_void: a_state /= Void
		do
			Result := (a_state = initial_state)
					or (a_state = intermediary_state)
					or (a_state = final_state)
		ensure
			definition: Result = ((a_state = initial_state)
							or (a_state = intermediary_state)
							or (a_state = final_state))
		end

feature {STATE} -- Access

	state: STATE
			-- Current state of the application

feature {STATE} -- Element change

	set_state (a_state: like state)
			-- Set `state' to `a_state'.
		require
			a_state_not_void: a_state /= Void
			valid_state: is_valid_state (a_state)
		do
			state := a_state
		ensure
			state_set: state = a_state
		end

invariant

	initial_state_not_void: initial_state /= Void
	intermediary_state_not_void: intermediary_state /= Void
	final_state_not_void: final_state /= Void
	state_not_void: state /= Void
	valid_state: is_valid_state (state)

end
