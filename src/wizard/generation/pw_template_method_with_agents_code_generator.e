note

	description:

		"Template method with agents pattern code generator"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_TEMPLATE_METHOD_WITH_AGENTS_CODE_GENERATOR

inherit

	PW_PATTERN_CODE_GENERATOR
		redefine
			pattern_info
		end

create

	default_create

feature -- Access

	pattern_info: PW_TEMPLATE_METHOD_WITH_AGENTS_INFORMATION
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
			some_changes.extend ([template_method_client_class_name_placeholder, pattern_info.client_class_name.as_upper])

			generate_code (project_directory + template_method_with_agents_ace_name + ".ace" , pattern_delivery_directory + template_method_with_agents_ace_file_name, some_changes)
		end

	generate_root_class
			-- Generate root class.
		local
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
			implementation_features_name: LINKED_LIST [STRING_32]
			features_name: STRING_32
			feature_name_skeleton: STRING_32
			features_code: STRING_32
			feature_code_skeleton: STRING_32
		do
			create some_changes.make
			some_changes.extend ([template_method_client_class_name_placeholder, pattern_info.client_class_name.as_upper])
			some_changes.extend ([template_method_class_name_placeholder, pattern_info.class_name.as_upper])
			some_changes.extend ([template_method_creation_procedure_name_placeholder, pattern_info.creation_procedure_name.as_lower])
			some_changes.extend ([template_method_name_placeholder, pattern_info.template_method_name.as_lower])

			implementation_features_name := pattern_info.implementation_features_name
			create features_name.make (128)
			create features_code.make (128)
			from implementation_features_name.start until implementation_features_name.after loop
				feature_name_skeleton := clone (implementation_feature_name_skeleton)
				feature_name_skeleton.replace_substring_all (implementation_feature_name_placeholder, implementation_features_name.item.as_lower)
				features_name := features_name + feature_name_skeleton

				features_code := features_code + implementation_features_name.item.as_lower
				feature_code_skeleton := clone (implementation_feature_code_skeleton)
				feature_code_skeleton.replace_substring_all (feature_number_placeholder, implementation_features_name.index.out)
				features_code := features_code + feature_code_skeleton

				if implementation_features_name.index /= implementation_features_name.count then
					features_name := features_name + "%N%T%T%T"
					features_code := features_code + "%N%N%T"
				end
				implementation_features_name.forth
			end
			some_changes.extend ([template_method_implementation_features_name_placeholder, features_name])
			some_changes.extend ([template_method_implementation_features_code_placeholder, features_code])

			generate_code (project_directory + pattern_info.client_class_name.as_lower + ".e", pattern_delivery_directory + template_method_with_agents_root_class_file_name, some_changes)
		end

	generate_pattern_code
			-- Generate Eiffel classes for this pattern (except the root class).
		do
			generate_template_method_class
		end

	generate_template_method_class
			-- Generate class containint the template method.
		require
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		local
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
		do
			create some_changes.make
			some_changes.extend ([template_method_class_name_placeholder, pattern_info.class_name.as_upper])
			some_changes.extend ([template_method_creation_procedure_name_placeholder, pattern_info.creation_procedure_name.as_lower])
			some_changes.extend ([template_method_name_placeholder, pattern_info.template_method_name.as_lower])

			generate_code (project_directory + pattern_info.class_name.as_lower + ".e", pattern_delivery_directory + template_method_with_agents_class_file_name, some_changes)
		end

end
