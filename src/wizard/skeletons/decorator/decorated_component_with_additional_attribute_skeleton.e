note

	description:
		"[
			First kind of concrete decorated component
			('Concrete Decorator') 
			with an additional attribute
		]"

	pattern: "Decorator"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class DECORATED_COMPONENT_A

inherit

	<DECORATOR_DECORATED_COMPONENT_CLASS_NAME>

create

	<DECORATOR_DECORATED_COMPONENT_CREATION_PROCEDURE_NAME>,
	make_with_attribute

feature {NONE} -- Initialization

	make_with_attribute (a_component: like component; an_attribute: like <DECORATOR_ADDITIONAL_ATTRIBUTE_NAME>) 
			-- Set `component' to `a_component'.
			-- Set `additional_attribute' to `an_attribute'.
		require
			a_component_not_void: a_component /= Void
			an_attribute_not_void: an_attribute /= Void
		do
			<DECORATOR_DECORATED_COMPONENT_CREATION_PROCEDURE_NAME> (a_component)
			<DECORATOR_ADDITIONAL_ATTRIBUTE_NAME> := an_attribute
		ensure
			component_set: component = a_component
			attribute_set: <DECORATOR_ADDITIONAL_ATTRIBUTE_NAME> = an_attribute
		end

feature -- Access

	<DECORATOR_ADDITIONAL_ATTRIBUTE_NAME>: <DECORATOR_ADDITIONAL_ATTRIBUTE_TYPE_NAME>
			-- Additional attribute

end
