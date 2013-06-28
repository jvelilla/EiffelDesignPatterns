indexing

	description:

		"Information about the Decorator pattern needed for the code generation"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_DECORATOR_INFORMATION

inherit

	PW_PATTERN_INFORMATION

create

	default_create

feature -- Access

	component_class_name: STRING
			-- Name of the original (deferred) component class

	feature_name: STRING
			-- Name of the feature of the component class

	effective_component_class_name: STRING
			-- Name of the original effective component class

	decorated_component_class_name: STRING
			-- Name of the decorated component class

	decorated_component_creation_procedure_name: STRING
			-- Name of the creationp procedure of the decorated component

	additional_attribute_name: STRING
			-- Name of the additional attribute of the decorated component class

	additional_attribute_type_name: STRING
			-- Type name of the additional attribute of the decorated component class

	additional_feature_name: STRING
			-- Name of the additional feature of the decorated component class
			-- (with additional behavior)

feature -- Status report

	component_with_additional_attribute_generation: BOOLEAN
			-- Should a decorated component with an additional attribute be generated?

	component_with_additional_behavior_generation: BOOLEAN
			-- Should a decorated component with additional behavior be generated?

	is_complete: BOOLEAN is
			-- Is decorator information complete
			-- (i.e. ready for code generation)?
		do
			Result := (
						component_class_name /= Void and
						feature_name /= Void and
						effective_component_class_name /= Void and
						decorated_component_class_name /= Void and
						decorated_component_creation_procedure_name /= Void and
						component_with_additional_attribute_generation_set and 
						component_with_additional_attribute_generation implies (
																				additional_attribute_name /= Void and
																				additional_attribute_type_name /= Void
																				)
						and component_with_additional_behavior_generation_set and
						component_with_additional_behavior_generation implies additional_feature_name /= Void
					)
		ensure then
			definition: Result implies (
											component_class_name /= Void and
											feature_name /= Void and
											effective_component_class_name /= Void and
											decorated_component_class_name /= Void and
											decorated_component_creation_procedure_name /= Void and
											component_with_additional_attribute_generation_set and 
											component_with_additional_attribute_generation implies (
																									additional_attribute_name /= Void and
																									additional_attribute_type_name /= Void
																									)
											and component_with_additional_behavior_generation_set and
											component_with_additional_behavior_generation implies additional_feature_name /= Void
										) 
		end

feature -- Element change

	set_component_class_name (a_name: like component_class_name) is
			-- Set `component_class_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			component_class_name := a_name
		ensure
			component_class_name_set: component_class_name = a_name
		end

	set_feature_name (a_name: like feature_name) is
			-- Set `feature_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			feature_name := a_name
		ensure
			feature_name_set: feature_name = a_name
		end

	set_effective_component_class_name (a_name: like effective_component_class_name) is
			-- Set `effective_component_class_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			effective_component_class_name := a_name
		ensure
			effective_component_class_name_set: effective_component_class_name = a_name
		end

	set_decorated_component_class_name (a_name: like decorated_component_class_name) is
			-- Set `decorated_component_class_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			decorated_component_class_name := a_name
		ensure
			decorated_component_class_name_set: decorated_component_class_name = a_name
		end

	set_decorated_component_creation_procedure_name (a_name: like decorated_component_creation_procedure_name) is
			-- Set `decorated_component_creation_procedure_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			decorated_component_creation_procedure_name := a_name
		ensure
			decorated_component_creation_procedure_name_set: decorated_component_creation_procedure_name = a_name
		end

	set_additional_attribute_name (a_name: like additional_attribute_name) is
			-- Set `additional_attribute_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			additional_attribute_name := a_name
		ensure
			additional_attribute_name_set: additional_attribute_name = a_name
		end

	set_additional_attribute_type_name (a_name: like additional_attribute_type_name) is
			-- Set `additional_attribute_type_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			additional_attribute_type_name := a_name
		ensure
			additional_attribute_type_name_set: additional_attribute_type_name = a_name
		end

	set_additional_feature_name (a_name: like additional_feature_name) is
			-- Set `additional_feature_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			additional_feature_name := a_name
		ensure
			additional_feature_name_set: additional_feature_name = a_name
		end

	set_component_with_additional_attribute_generation (a_value: like component_with_additional_attribute_generation) is
			-- Set `component_with_additional_attribute_generation' to `a_value'.
		do
			component_with_additional_attribute_generation := a_value
			component_with_additional_attribute_generation_set := True
		ensure
			component_with_additional_attribute_generation_set: component_with_additional_attribute_generation = a_value
																and component_with_additional_attribute_generation_set
		end

	set_component_with_additional_behavior_generation (a_value: like component_with_additional_behavior_generation) is
			-- Set `component_with_additional_behavior_generation' to `a_value'.
		do
			component_with_additional_behavior_generation := a_value
			component_with_additional_behavior_generation_set := True
		ensure
			component_with_additional_behavior_generation_set: component_with_additional_behavior_generation = a_value
																and component_with_additional_behavior_generation_set
		end

feature {NONE} -- Implementation (contract support)

	component_with_additional_attribute_generation_set: BOOLEAN
			-- Has `component_with_additional_attribute_generation' been set?

	component_with_additional_behavior_generation_set: BOOLEAN
			-- Has `component_with_additional_behavior_generation' been set?

invariant

	component_class_name_not_empty_if_not_void: component_class_name /= Void implies not component_class_name.is_empty 
	feature_name_not_empty_if_not_void: feature_name /= Void implies not feature_name.is_empty
	effective_component_class_name_not_empty_if_not_void: effective_component_class_name /= Void implies not effective_component_class_name.is_empty
	decorated_component_class_name_not_empty_if_not_void: decorated_component_class_name /= Void implies not decorated_component_class_name.is_empty 
	decorated_component_creation_procedure_name_not_empty_if_not_void: decorated_component_creation_procedure_name /= Void implies not decorated_component_creation_procedure_name.is_empty
	additional_attribute_name_not_empty_if_not_void: additional_attribute_name /= Void implies not additional_attribute_name.is_empty 
	additional_attribute_type_name_not_empty_if_not_void: additional_attribute_type_name /= Void implies not additional_attribute_type_name.is_empty
	additional_feature_name_not_empty_if_not_void: additional_feature_name /= Void implies not additional_feature_name.is_empty

end
