note

	description:
		"[
			Subject interface to which
			proxy parameter should conform.
		]"

	library: "Proxy library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class SUBJECT

feature {NONE} -- Initialization

	make (a_characteristic: like characteristic)
			-- Initialize subject with `a_characteristic'.
		require
			a_characteristic_not_void: a_characteristic /= Void
		deferred
		end

feature -- Access

	characteristic: TUPLE
			-- Characteristic of a subject
		deferred
		ensure
			characteristic_not_void: Result /= Void
		end

feature -- Status setting

	set_characteristic (a_characteristic: like characteristic)
			-- Set `characteristic' to `a_characteristic'.
		require
			a_characteristic_not_void: a_characteristic /= Void
		deferred
		ensure
			characteristic_set: characteristic = a_characteristic
		end

feature -- Basic operations

	request
			-- Request something on current subject.
		require
			characteristic_not_void: characteristic /= Void
		deferred
		end

	request_with_args (args: TUPLE) 
			-- Request something on current subject using `args'.
		require
			characteristic_not_void: characteristic /= Void
			args_not_void: args /= Void
		deferred
		end

end
