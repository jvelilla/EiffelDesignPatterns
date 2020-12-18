note

	description:

		"Decorator pattern code generator"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_DECORATOR_CODE_GENERATOR

inherit

	PW_PATTERN_CODE_GENERATOR
		redefine
			pattern_info
		end

create

	default_create

feature -- Access

	pattern_info: PW_DECORATOR_INFORMATION
			-- Pattern information needed for the code generation
			-- (name of classes, name of features, etc.)

feature {NONE} -- Implementation (Code generation)

	generate_ace_file
			-- Generate Ace file.
		local
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
		do
			create some_changes.make
			some_changes.extend ([project_directory_placeholder, project_directory])
			generate_code (project_directory + decorator_ace_name + ".ace" , pattern_delivery_directory + decorator_ace_file_name, some_changes)
		end

	generate_root_class
			-- Generate root class.
		local
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
		do
			create some_changes.make
			some_changes.extend ([decorator_effective_component_class_name_placeholder, pattern_info.effective_component_class_name.as_upper])
			some_changes.extend ([decorator_additional_attribute_type_name_placeholder, pattern_info.additional_attribute_type_name.as_upper])
			some_changes.extend ([decorator_decorated_component_creation_procedure_name_placeholder, pattern_info.decorated_component_creation_procedure_name.as_lower])
			some_changes.extend ([decorator_component_class_name_placeholder, pattern_info.component_class_name.as_upper])
			some_changes.extend ([decorator_feature_name_placeholder, pattern_info.feature_name.as_lower])

			generate_code (project_directory + default_root_class_name.as_lower + ".e", pattern_delivery_directory + decorator_root_class_file_name, some_changes)
		end

	generate_pattern_code
			-- Generate Eiffel classes for this pattern (except the root class).
		do
			generate_component_class
			generate_effective_component_class
			generate_decorated_component_class
			if pattern_info.component_with_additional_attribute_generation then
				generate_decorated_component_with_additional_attribute_class
			end
			if pattern_info.component_with_additional_behavior_generation then
				generate_decorated_component_with_additional_behavior_class
			end
		end

	generate_component_class
			-- Generate component class.
		require
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		local
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
		do
			create some_changes.make
			some_changes.extend ([decorator_component_class_name_placeholder, pattern_info.component_class_name.as_upper])
			some_changes.extend ([decorator_feature_name_placeholder, pattern_info.feature_name.as_lower])

			generate_code (project_directory + pattern_info.component_class_name.as_lower + ".e", pattern_delivery_directory + decorator_component_class_file_name, some_changes)
		end

	generate_effective_component_class 
			-- Generate effective component class.
		require
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		local
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
		do
			create some_changes.make
			some_changes.extend ([decorator_component_class_name_placeholder, pattern_info.component_class_name.as_upper])
			some_changes.extend ([decorator_feature_name_placeholder, pattern_info.feature_name.as_lower])
			some_changes.extend ([decorator_effective_component_class_name_placeholder, pattern_info.effective_component_class_name.as_upper])

			generate_code (project_directory + pattern_info.effective_component_class_name.as_lower + ".e", pattern_delivery_directory + decorator_effective_component_class_file_name, some_changes)
		end

	generate_decorated_component_class
			-- Generate decorated component class.
		require
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		local
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
		do
			create some_changes.make
			some_changes.extend ([decorator_component_class_name_placeholder, pattern_info.component_class_name.as_upper])
			some_changes.extend ([decorator_feature_name_placeholder, pattern_info.feature_name.as_lower])
			some_changes.extend ([decorator_decorated_component_class_name_placeholder, pattern_info.decorated_component_class_name.as_upper])
			some_changes.extend ([decorator_decorated_component_creation_procedure_name_placeholder, pattern_info.decorated_component_creation_procedure_name.as_lower])

			generate_code (project_directory + pattern_info.decorated_component_class_name.as_lower + ".e", pattern_delivery_directory + decorator_decorated_component_class_file_name, some_changes)
		end

	generate_decorated_component_with_additional_attribute_class
			-- Generate decorated component with additional attribute class.
			-- Generate class file corresponding to the type of the additional attribute.
			-- (No check is performed to know whether this type's base class already exists in the system.
			-- Therefore the generated project may not compile. If it does not compile, just delete this extra file.)
		require
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		local
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
		do
				-- Generate decorated component class with additional attribute.
			create some_changes.make
			some_changes.extend ([decorator_decorated_component_class_name_placeholder, pattern_info.decorated_component_class_name.as_upper])
			some_changes.extend ([decorator_additional_attribute_name_placeholder, pattern_info.additional_attribute_name.as_lower])
			some_changes.extend ([decorator_additional_attribute_type_name_placeholder, pattern_info.additional_attribute_type_name.as_upper])

			generate_code (project_directory + default_decorator_decorated_component_with_additional_attribute_class_name.as_lower + ".e", pattern_delivery_directory + decorator_decorated_component_with_additional_attribute_class_file_name, some_changes)

				-- Generate additional attribute's type.
			create some_changes.make
			some_changes.extend ([decorator_additional_attribute_type_name_placeholder, pattern_info.additional_attribute_type_name.as_upper])
	 		generate_code (project_directory + pattern_info.additional_attribute_type_name.as_lower + ".e", pattern_delivery_directory + decorator_additional_attribute_type_file_name, some_changes)
		end

	generate_decorated_component_with_additional_behavior_class
			-- Generate decorated component with additional behavior class.
		require
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		local
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
		do
			create some_changes.make
			some_changes.extend ([decorator_decorated_component_class_name_placeholder, pattern_info.decorated_component_class_name.as_upper])
			some_changes.extend ([decorator_decorated_component_creation_procedure_name_placeholder, pattern_info.decorated_component_creation_procedure_name.as_lower])
			some_changes.extend ([decorator_feature_name_placeholder, pattern_info.feature_name.as_lower])
			some_changes.extend ([decorator_additional_feature_name_placeholder, pattern_info.additional_feature_name.as_lower])

			generate_code (project_directory + default_decorator_decorated_component_with_additional_behavior_class_name.as_lower + ".e", pattern_delivery_directory + decorator_decorated_component_with_additional_behavior_class_file_name, some_changes)
		end

end
