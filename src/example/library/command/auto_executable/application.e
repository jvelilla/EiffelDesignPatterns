indexing

	description:

		"Application using the Command library"

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
			command_1: COMMAND
		do
			create command_1.make_with_undo (agent do_something,
											agent undo_something, True)

			debug
				io.put_string ("Test single undo/redo.%N")
			end
			command_1.execute
			check
				can_undo: history.can_undo
			end
			history.undo
			check
				can_redo: history.can_redo
			end
			history.redo

			debug
				io.put_new_line
				io.put_string ("Test multiple levels of undo/redo.%N")
			end
			command_1.execute_with_args (["Command"])

			command_1.execute
			history.undo
			history.redo
			history.undo_all
			history.redo_all
		end

feature -- Basic operations

	do_something (args: TUPLE) is
			-- Do something with `args'.
		do
			-- Do something.
			debug
				io.put_string ("Do something.%N")
			end
		end

	undo_something (args: TUPLE) is
			-- Undo what `do_something' does.
		do
			-- Undo what `do_something' does.
			debug
				io.put_string ("Undo something.%N")
			end
		end

end
