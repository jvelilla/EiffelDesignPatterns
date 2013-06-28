indexing

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

feature {NONE} -- Initialization

	make (a_value: like is_once_command) is
			-- Set `is_once_command' to `a_value'.
		do
			is_once_command := a_value
		ensure
			is_once_command_set: is_once_command = a_value
		end

feature -- Status report

	is_once_command: BOOLEAN
			-- Can this command be executed only once?

feature {HISTORY} -- Command pattern

	execute (args: TUPLE) is
			-- Execute command with `args'.
		require
			args_not_void: args /= Void
		deferred
		end

feature {HISTORY} -- Undo

	undo (args: TUPLE) is
			-- Undo last action.
		require
			args_not_void: args /= Void
		deferred
		end

feature {HISTORY} -- Redo

	redo (args: TUPLE) is
			-- Redo last undone action.
		require
			args_not_void: args /= Void
		deferred
		end

end
