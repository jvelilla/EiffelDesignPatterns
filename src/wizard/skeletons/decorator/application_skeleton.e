indexing

	description:

		"Application using the Decorator pattern"

	pattern: "Decorator"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class APPLICATION

create

	make

feature {NONE} -- Initialization

	make is
			-- Illustrate how to create and use
			-- decorated objects.
		local
			my_component: <DECORATOR_EFFECTIVE_COMPONENT_CLASS_NAME>
			decorated_component_a: DECORATED_COMPONENT_A
			decorated_component_b: DECORATED_COMPONENT_B
		do
			debug
				io.put_string ("Original component:%N")
			end
			create my_component
			use_component (my_component)

			debug
				io.put_string ("New decorated component built from original component with additional attribute: %N")
			end
			create decorated_component_a.make_with_attribute (my_component, create {<DECORATOR_ADDITIONAL_ATTRIBUTE_TYPE_NAME>})
			use_component (decorated_component_a)

			debug
				io.put_string ("New decorated component built from original component with additional behavior: %N")
			end
			create decorated_component_b.<DECORATOR_DECORATED_COMPONENT_CREATION_PROCEDURE_NAME> (my_component)
			use_component (decorated_component_b)
		end

feature {NONE} -- Implementation

	use_component (a_component: <DECORATOR_COMPONENT_CLASS_NAME>) is
			-- Use `a_component'.
		require
			a_component_not_void: a_component /= Void
		do
			a_component.<DECORATOR_FEATURE_NAME>
		end

end
