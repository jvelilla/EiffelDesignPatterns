indexing

	description:
		"[
			Command supporting undo/redo
			(May be used to build a composite command)
		]"

	library: "Command library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class COMMAND

inherit

	COMPONENT [COMMAND]
		rename
			do_something as execute
		redefine
			execute
		end

create

	make,
	make_with_undo

feature {NONE} -- Initialization

	make (an_action: like action; a_value: like is_once_command) is
			-- Set `action' to `an_action'.
			-- Set `is_once_command' to `a_value'.
		require
			an_action_not_void: an_action /= Void
		do
			action := an_action
			is_once_command := a_value
		ensure
			action_set: action = an_action
			is_once_command_set: is_once_command = a_value
		end

	make_with_undo (an_action: like action; 
		an_undo_action: like undo_action; a_value: like is_once_command) is
			-- Set `action' to `an_action'.
			-- Set `undo_action' to `an_undo_action'.
			-- Set `is_once_command' to `a_value'.
		require
			an_action_not_void: an_action /= Void
			an_undo_action_not_void: an_undo_action /= Void
		do
			action := an_action
			undo_action := an_undo_action
			is_once_command := a_value
		ensure
			action_set: action = an_action
			undo_action_set: undo_action = an_undo_action
			is_once_command_set: is_once_command = a_value
		end

feature -- Access

	action: PROCEDURE [ANY, TUPLE]
			-- Action to be executed

	undo_action: PROCEDURE [ANY, TUPLE]
			-- Action to be executed to undo 
			-- the effects of calling `action'

feature -- Status report

	is_once_command: BOOLEAN
			-- Can this command be executed only once?

	valid_args (args: TUPLE): BOOLEAN is
			-- Are `args' valid arguments for `execute_with_args' and `redo'?
		do
			Result := action.valid_operands ([args])
		end

feature -- Status setting

	set_undo_action (an_action: like undo_action) is
			-- Set `undo_action' to `an_action'.
		do
			undo_action := an_action
		ensure
			undo_action_set: undo_action /= Void
		end

feature {HISTORY} -- Command pattern

	execute is
			-- Call `action' 
			-- with an empty tuple as arguments.
		do
			if action.valid_operands ([[]]) then
				action.call ([[]])
			end
		end

	execute_with_args (args: TUPLE) is
			-- Call `action' with `args'.
		require
			args_not_void: args /= Void
			valid_args: valid_args ([args])
		do
			action.call ([args])
		end

feature {HISTORY} -- Undo

	undo (args: TUPLE) is
			-- Undo last action.
			-- (Call `undo_action' with `args').
		require
			undo_action_not_void: undo_action /= Void
			args_not_void: args /= Void
			valid_args: undo_action.valid_operands ([args])
		do
			undo_action.call ([args])
		end

feature {HISTORY} -- Redo

	redo (args: TUPLE) is
			-- Redo last undone action.
			-- (Call `action' with `args'.)
		require
			args_not_void: args /= Void
			valid_args: valid_args ([args])
		do
			action.call ([args])
		end

invariant

	action_not_void: action /= Void

end
