indexing

	description:

		"Adapter of ADAPTEE to be usable as a TARGET"

	pattern: "Object adapter"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class ADAPTER

inherit

	TARGET
		redefine
			f
		end

create

	make

feature {NONE} -- Initialization

	make (an_adaptee: like adaptee) is
			-- Set `adaptee' to `an_adaptee'.
		require
			an_adaptee_not_void: an_adaptee /= Void
		do
			adaptee := an_adaptee
		ensure
			adaptee_set: adaptee = an_adaptee
		end

feature -- Access

	adaptee: ADAPTEE
			-- Object to be adapted to `TARGET'

feature -- Basic operations

	f is
			-- Perform an operation.
			-- Delegate work to `adaptee'.
		do
			adaptee.g
		end

invariant

	adaptee_not_void: adaptee /= Void

end
