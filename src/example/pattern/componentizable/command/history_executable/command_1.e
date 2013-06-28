indexing

	description:

		"First kind of concrete command"

	pattern: "Command"
	reusable_version: "Command library (see ${PATTERN}/library/command)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class COMMAND_1

inherit

	COMMAND

create

	make

feature {HISTORY} -- Command pattern

	execute (args: TUPLE) is
			-- Execute command with `args'.
		do
			debug
				io.put_string ("Execute command 1.%N")
			end
		end

feature {HISTORY} -- Undo

	undo (args: TUPLE) is
			-- Undo last action.
		do
			debug
				io.put_string ("Undo command 1.%N")
			end
		end

feature {HISTORY} -- Redo

	redo (args: TUPLE) is
			-- Redo last undone action.
		do
			debug
				io.put_string ("Redo command 1.%N")
			end
		end

end
