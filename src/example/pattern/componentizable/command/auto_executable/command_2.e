note

	description:

		"Second kind of command"

	pattern: "Command"
	reusable_version: "Command library (see ${PATTERN}/library/command)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class COMMAND_2

inherit

	COMMAND

create

	make

feature -- Command pattern

	execute (args: TUPLE) is
			-- Execute command with `args'.
		do
			debug
				io.put_string ("Execute command 2.%N")
			end
			register_to_history (args)
		end

feature {HISTORY} -- Undo

	undo (args: TUPLE) is
			-- Undo last action.
		do
			debug
				io.put_string ("Undo command 2.%N")
			end
		end

feature {HISTORY} -- Redo

	redo (args: TUPLE) is
			-- Redo last undone action.
		do
			debug
				io.put_string ("Redo command 2.%N")
			end
		end

end
