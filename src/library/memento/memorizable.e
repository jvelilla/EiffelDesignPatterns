indexing

	description:
		"[
			Originator that can create a memento
			of its internal state
		]"

	library: "Memento library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class MEMORIZABLE

feature -- Access

	new_memento: TUPLE is
			-- New memento from internal state
		deferred
		ensure
			new_memento_not_void: Result /= Void
			new_memento_is_valid: is_valid (Result)
		end

feature -- Status setting

	set_state_from_memento (a_memento: like new_memento) is
			-- Set internal state from `a_memento'.
		require
			a_memento_not_void: a_memento /= Void
			is_valid: is_valid (a_memento)
		deferred
		end

feature -- Status report

	is_valid (a_memento: like new_memento): BOOLEAN is
			-- Is `a_memento' a valid memento?
		require
			a_memento_not_void: a_memento /= Void
		deferred
		end

end
