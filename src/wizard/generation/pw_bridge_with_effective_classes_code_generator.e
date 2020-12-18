note

	description:

		"Bridge with effective classes pattern code generator"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_BRIDGE_WITH_EFFECTIVE_CLASSES_CODE_GENERATOR

inherit

	PW_PATTERN_CODE_GENERATOR
		redefine
			pattern_info
		end

create

	default_create

feature -- Access

	pattern_info: PW_BRIDGE_WITH_EFFECTIVE_CLASSES_INFORMATION
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
			generate_code (project_directory + bridge_with_effective_classes_ace_name + ".ace" , pattern_delivery_directory + bridge_with_effective_classes_ace_file_name, some_changes)
		end

	generate_root_class
			-- Generate root class.
		local
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
			descendants_name: LINKED_LIST [STRING_32]
			local_variables_code: STRING_32
			local_variable_skeleton: STRING_32
			client_code: STRING_32
			client_code_skeleton: STRING_32
		do
			create some_changes.make

			descendants_name := pattern_info.descendant_application_classes_name
			create local_variables_code.make (128)
			create client_code.make (256)
			from descendants_name.start until descendants_name.after loop
				local_variable_skeleton := bridge_local_variable_code_skeleton.twin
				local_variable_skeleton.replace_substring_all (descendant_class_number_placeholder, descendants_name.index.out)
				local_variable_skeleton.replace_substring_all (descendant_class_name_placeholder, descendants_name.item.as_upper)
				local_variables_code := local_variables_code + local_variable_skeleton

				client_code_skeleton := bridge_client_code_skeleton.twin
				client_code_skeleton.replace_substring_all (descendant_class_number_placeholder, descendants_name.index.out)
				client_code_skeleton.replace_substring_all (bridge_creation_procedure_name_placeholder, pattern_info.application_creation_procedure_name)
				client_code_skeleton.replace_substring_all (bridge_feature_name_placeholder, pattern_info.application_feature_name)
				client_code_skeleton.replace_substring_all (descendant_implementation_class_name_placeholder, pattern_info.descendant_application_implementation_classes_name.i_th (descendants_name.index).as_upper)
				client_code := client_code + client_code_skeleton

				if descendants_name.index /= descendants_name.count then
					local_variables_code := local_variables_code + "%N%T%T%T"
					client_code := client_code + "%N%N%T%T%T"
				end

				descendants_name.forth
			end

			some_changes.extend ([bridge_client_local_variables_placeholder, local_variables_code])
			some_changes.extend ([bridge_client_code_placeholder, client_code])

			generate_code (project_directory + other_root_class_name.as_lower + ".e", pattern_delivery_directory + bridge_with_effective_classes_root_class_file_name, some_changes)
		end

	generate_pattern_code
			-- Generate Eiffel classes for this pattern (except the root class).
		do
			generate_application_class
			generate_descendant_application_classes
			generate_application_implementation_class
			generate_descendant_application_implementation_classes
		end

	generate_application_class
			-- Generate application class.
		require
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		local
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
		do
			create some_changes.make
			some_changes.extend ([bridge_class_name_placeholder, pattern_info.application_class_name.as_upper])
			some_changes.extend ([bridge_creation_procedure_name_placeholder, pattern_info.application_creation_procedure_name.as_lower])
			some_changes.extend ([bridge_feature_name_placeholder, pattern_info.application_feature_name.as_lower])
			some_changes.extend ([bridge_implementation_feature_name_placeholder, pattern_info.application_implementation_feature_name.as_lower])
			some_changes.extend ([bridge_implementation_class_name_placeholder, pattern_info.application_implementation_class_name.as_upper])

			generate_code (project_directory + pattern_info.application_class_name.as_lower + ".e", pattern_delivery_directory + bridge_with_effective_classes_class_file_name, some_changes)
		end

	generate_descendant_application_classes
			-- Generate descendant application classes.
		require
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		local
			descendants_name: LINKED_LIST [STRING_32]
			a_name: STRING_32
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
		do
			descendants_name := pattern_info.descendant_application_classes_name
			from descendants_name.start until descendants_name.after loop
				a_name := descendants_name.item.as_upper

				create some_changes.make
				some_changes.extend ([bridge_descendant_class_name_placeholder, a_name])
				some_changes.extend ([bridge_class_name_placeholder, pattern_info.application_class_name.as_upper])
				some_changes.extend ([bridge_creation_procedure_name_placeholder, pattern_info.application_creation_procedure_name.as_lower])
				some_changes.extend ([bridge_descendant_implementation_class_name_placeholder, pattern_info.descendant_application_implementation_classes_name.i_th (descendants_name.index).as_upper])

				generate_code (project_directory + a_name.as_lower + ".e", pattern_delivery_directory + bridge_with_effective_classes_descendant_class_file_name, some_changes)
				descendants_name.forth
			end
		end

	generate_application_implementation_class
			-- Generate application implementation class.
		require
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		local
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
		do
			create some_changes.make
			some_changes.extend ([bridge_implementation_class_name_placeholder, pattern_info.application_implementation_class_name.as_upper])
			some_changes.extend ([bridge_implementation_feature_name_placeholder, pattern_info.application_implementation_feature_name.as_lower])

			generate_code (project_directory + pattern_info.application_implementation_class_name.as_lower + ".e", pattern_delivery_directory + bridge_with_effective_classes_implementation_class_file_name, some_changes)
		end

	generate_descendant_application_implementation_classes
			-- Generate application implementation classes.
		require
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		local
			descendants_name: LINKED_LIST [STRING_32]
			a_name: STRING_32
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
		do
			descendants_name := pattern_info.descendant_application_implementation_classes_name
			from descendants_name.start until descendants_name.after loop
				a_name := descendants_name.item.as_upper

				create some_changes.make
				some_changes.extend ([bridge_descendant_implementation_class_name_placeholder, a_name])
				some_changes.extend ([bridge_implementation_class_name_placeholder, pattern_info.application_implementation_class_name.as_upper])
				some_changes.extend ([bridge_implementation_feature_name_placeholder, pattern_info.application_implementation_feature_name.as_lower])

				generate_code (project_directory + a_name.as_lower + ".e", pattern_delivery_directory + bridge_with_effective_classes_descendant_implementation_class_file_name, some_changes)
				descendants_name.forth
			end
		end

end
