indexing

	description:

		"Caretaker (responsible for the memento's safekeeping)"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2003/12/19"
	revision: "$Revision: 1.0"

class APPLICATION

create

	make

feature {NONE} -- Initialization

	make is
			-- Request a memento to an originator 
			-- and give it back after a while.
		local
			an_originator: ORIGINATOR
		do
			create an_originator.make

				-- Create a snapshot of current state
				-- of `an_originator'.
			memento := an_originator.new_memento

				-- Time passes and state of changes...

				-- Give the memento back to the originator.
			an_originator.set_state_from_memento (memento)
		end

feature -- Access

	memento: TUPLE [TYPE_1, TYPE_2]
			-- Access to memento
        
end
