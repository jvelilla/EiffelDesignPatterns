note

	description:

		"Representation of a command (Support for undo/redo)"

	pattern: "Command"
	reusable_version: "Command library (see ${PATTERN}/library/command)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class COMMAND

inherit

	ANY

	SHARED_HISTORY
		export
			{NONE} all
		end

feature {NONE} -- Initialization

	make (a_value: like is_once_command)
			-- Set `is_once_command' to `a_value'.
		do
			is_once_command := a_value
		ensure
			is_once_command_set: is_once_command = a_value
		end

feature -- Status report

	is_once_command: BOOLEAN
			-- Can this command be executed only once?

feature -- Command pattern

	execute (args: TUPLE)
			-- Execute command with `args'.
		require
			args_not_void: args /= Void
		deferred
		end

	register_to_history (args: TUPLE)
			-- Register command with `args' to the shared history.
		do
			if is_once_command and then history.has (Current) then
				history.extend (Current.twin, args)
			else
				history.extend (Current, args)
			end
		end

feature {HISTORY} -- Undo

	undo (args: TUPLE)
			-- Undo last action.
		require
			args_not_void: args /= Void
		deferred
		end

feature {HISTORY} -- Redo

	redo (args: TUPLE)
			-- Redo last undone action.
		require
			args_not_void: args /= Void
		deferred
		end

end
