note

	description:

		"Mediator"

	pattern: "Mediator"
	reusable_version: "Mediator library (see ${PATTERN}/library/mediator)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class MEDIATOR

feature -- Basic operations

	update_colleagues (a_colleague: COLLEAGUE)
			-- Update colleagues because `a_colleague' changed.
		require
			a_colleague_not_void: a_colleague /= Void
		deferred
		end

end
