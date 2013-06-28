indexing

	description:

		"History of executed commands"

	pattern: "Command"
	reusable_version: "Command library (see ${PATTERN}/library/command)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class HISTORY

create

	make

feature {NONE} -- Initialization

	make is
			-- Initialize history.
			--| Initialize `commands' and `arguments'.
		do
			create {LINKED_LIST [COMMAND]} commands.make
			create {LINKED_LIST [TUPLE]} arguments.make
		end

feature -- Status report

	can_undo: BOOLEAN is
			-- Can last command be undone?
		do
			Result := (not commands.is_empty and not commands.off)
		ensure
			definition: Result = (not commands.is_empty and not commands.off)
		end

	can_redo: BOOLEAN is
			-- Can last command be executed again?
		do
			Result := (not commands.is_empty and then 
						(commands.before or else 
						commands.index <= commands.count - 1))
		ensure
			definition: Result = (not commands.is_empty and then 
									(commands.before or else 
									commands.index <= commands.count - 1))
		end

feature -- Command pattern

	execute (a_command: COMMAND; args: TUPLE) is
			-- Execute `a_command'.
		require
			a_command_not_void: a_command /= Void
			args_not_void: args /= Void
		local
			new_command: COMMAND
		do
			if a_command.is_once_command then
				new_command := clone (a_command)
				new_command.execute (args)
				extend (new_command, args)
			else
				a_command.execute (args)
				extend (a_command, args)
			end
		ensure
			can_undo: can_undo
			one_more: commands.count = old commands.index + 1
			one_more_argument: arguments.count = old arguments.index + 1
			is_last: commands.islast
			is_last_argument: arguments.islast
			command_inserted: not a_command.is_once_command implies commands.last = a_command
			arguments_inserted: arguments.last = args
		end

feature -- Undo/Redo
			  
	undo is
			-- Undo last command.
			--| Move cursor of `commands' and `arguments'
			--| one step backward.
		require
			can_undo: can_undo
		do
			commands.item.undo (arguments.item)
			commands.back
			arguments.back
		ensure
			can_redo: can_redo
			command_cursor_moved_backward:
				commands.index = old commands.index - 1
			argument_cursor_moved_backward:
				arguments.index = old arguments.index - 1
		end

	redo is
			-- Redo next command.
			--| Move cursor of `commands' and `arguments'
			--| one step forward.
		require
			can_redo: can_redo
		do
			commands.forth
			arguments.forth
			commands.item.redo (arguments.item)
		ensure
			can_undo: can_undo
			command_cursor_moved_forward:
				commands.index = old commands.index + 1
			argument_cursor_moved_forward:
				arguments.index = old arguments.index + 1
		end

feature -- Multiple Undo/Redo

	undo_all is
			-- Undo all commands.
			-- (Start at current position.)
		require
			can_undo: can_undo
		do
			from until commands.before loop
				undo
			end
		ensure
			cannot_undo: not can_undo
			before: commands.before
			arguments_before: arguments.before
		end

	redo_all is
			-- Redo all commands.
			-- (Start at current position.)
		require
			can_redo: can_redo
		do
			from until commands.index = commands.count loop
				redo
			end
		ensure
			cannot_redo: not can_redo
			is_last: commands.islast
			is_last_argument: arguments.islast
		end

feature {NONE} -- Implementation (Access)

	commands: LIST [COMMAND]
			-- History of commands

	arguments: LIST [TUPLE]
			-- History of arguments
			-- (corresponding to the history of `commands')

feature {NONE} -- Implementation (Element change)

	extend (a_command: COMMAND; args: TUPLE) is
			-- Extend `commands' with `a_command'
			-- and `arguments' with `args'.
		require
			a_command_not_void: a_command /= Void
			args_not_void: args /= Void
		do
			from commands.forth until commands.after loop
				commands.remove
			end
			from arguments.forth until arguments.after loop
				arguments.remove
			end

			commands.extend (a_command)
			arguments.extend (args)

			commands.finish
			arguments.finish
		ensure
			one_more: commands.count = old commands.index + 1
			one_more_argument: arguments.count = old arguments.index + 1
			is_last: commands.islast
			is_last_argument: arguments.islast
			command_inserted: commands.last = a_command
			arguments_inserted: arguments.last = args
		end

invariant

	commands_not_void: commands /= Void
	no_void_command: not commands.has (Void)
	arguments_not_void: arguments /= Void
	consistent: commands.count = arguments.count
	same_cursor_position: commands.index = arguments.index

end
