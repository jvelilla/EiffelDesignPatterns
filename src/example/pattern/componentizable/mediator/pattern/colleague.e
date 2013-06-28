indexing

	description:

		"Colleague"

	pattern: "Mediator"
	reusable_version: "Mediator library (see ${PATTERN}/library/mediator)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class COLLEAGUE

feature {NONE} -- Initialization

	make (a_mediator: like mediator) is
			-- Set `mediator' to `a_mediator'.
		require
			a_mediator_not_void: a_mediator /= Void
		do
			mediator := a_mediator
		ensure
			mediator_set: mediator = a_mediator
		end

feature -- Access

	mediator: MEDIATOR
			-- Mediator

feature -- Mediator pattern

	notify_mediator is
			-- Notify `mediator' that Current has changed.
		do
			mediator.update_colleagues (Current)
		end

invariant

	mediator_not_void: mediator /= Void

end
