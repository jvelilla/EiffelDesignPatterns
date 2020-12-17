note

	description:

		"Decorated component ('Decorator')"

	pattern: "Decorator"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class DECORATED_COMPONENT

inherit

	COMPONENT

feature {NONE} -- Initialization

	make (a_component: like component)
			-- Set `component' to `a_component'.
		require
			a_component_not_void: a_component /= Void
		do
			component := a_component
		ensure
			component_set: component = a_component
		end

feature -- Basic Operation

	do_something 
			-- Do something.
		do
			component.do_something
		end

feature {NONE} -- Implementation

	component: COMPONENT
			-- Component that will be used for the "decoration"

invariant

	component_not_void: component /= Void

end
