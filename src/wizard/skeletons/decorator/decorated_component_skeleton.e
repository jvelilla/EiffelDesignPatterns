note

	description:

		"Decorated component ('Decorator')"

	pattern: "Decorator"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class <DECORATOR_DECORATED_COMPONENT_CLASS_NAME>

inherit

	<DECORATOR_COMPONENT_CLASS_NAME>

feature {NONE} -- Initialization

	<DECORATOR_DECORATED_COMPONENT_CREATION_PROCEDURE_NAME> (a_component: like component) 
			-- Set `component' to `a_component'.
		require
			a_component_not_void: a_component /= Void
		do
			component := a_component
		ensure
			component_set: component = a_component
		end

feature -- Basic Operation

	<DECORATOR_FEATURE_NAME> 
			-- Do something.
		do
			component.<DECORATOR_FEATURE_NAME>
		end

feature {NONE} -- Implementation

	component: <DECORATOR_COMPONENT_CLASS_NAME>
			-- Component that will be used for the "decoration"

invariant

	component_not_void: component /= Void

end
