indexing

	description:

		"Application using the Command pattern"

	pattern: "Command"
	reusable_version: "Command library (see ${PATTERN}/library/command)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class APPLICATION

inherit

	SHARED_HISTORY
		export
			{NONE} all
		end

	ANY

create 

	make

feature {NONE} -- Initialization

	make is
			-- Create a command and execute it.
			-- Usee the undo/redo mechanism.
		local
			command_1: COMMAND_1
			command_2: COMMAND_2
		do
			create command_1.make (True)
			create command_2.make (False)

			debug
				io.put_string ("Test single undo/redo.%N")
			end
			command_1.execute ([])
			command_2.execute ([])
			history.undo
			command_1.execute ([])
			history.undo
			history.undo
			history.redo
			history.redo
			command_2.execute ([])
			command_1.execute (["Command"])
			command_2.execute ([])

			debug
				io.put_new_line
				io.put_string ("Test multiple levels of undo/redo.%N")
			end
			history.undo_all
			history.redo_all
		end

end
