note

	description:

		"Template method pattern code generator"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_TEMPLATE_METHOD_CODE_GENERATOR

inherit

	PW_PATTERN_CODE_GENERATOR
		redefine
			pattern_info
		end

create

	default_create

feature -- Access

	pattern_info: PW_ORIGINAL_TEMPLATE_METHOD_INFORMATION
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
			generate_code (project_directory + template_method_pattern_ace_name + ".ace" , pattern_delivery_directory + template_method_ace_file_name, some_changes)
		end

	generate_root_class
			-- Generate root class.
		local
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
		do
			create some_changes.make
			some_changes.extend ([template_method_class_name_placeholder, pattern_info.class_name.as_upper])
			some_changes.extend ([template_method_effective_class_name_placeholder, pattern_info.effective_class_name.as_upper])
			some_changes.extend ([template_method_name_placeholder, pattern_info.template_method_name.as_lower])

			generate_code (project_directory + other_root_class_name.as_lower + ".e", pattern_delivery_directory + template_method_root_class_file_name, some_changes)
		end

	generate_pattern_code
			-- Generate Eiffel classes for this pattern (except the root class).
		do
			generate_template_method_class
			generate_effective_class
		end

	generate_template_method_class
			-- Generate class containint the template method.
		require
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		local
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
			implementation_features_name: LINKED_LIST [STRING_32]
			features_name: STRING_32
			parts_done: STRING_32
			part_done_skeleton: STRING_32
			implementation_features_code: STRING_32
			assertion_skeleton: STRING_32
		do
			create some_changes.make
			some_changes.extend ([template_method_class_name_placeholder, pattern_info.class_name.as_upper])
			some_changes.extend ([template_method_name_placeholder, pattern_info.template_method_name.as_lower])

			implementation_features_name := pattern_info.implementation_features_name
			create features_name.make (128)
			create parts_done.make (256)
			create implementation_features_code.make (256)

			from implementation_features_name.start until implementation_features_name.after loop
				features_name := features_name + implementation_features_name.item.as_lower

				if implementation_features_name.index <= implementation_features_name.count - 1 then
					part_done_skeleton := part_done_code_skeleton.twin
					part_done_skeleton.replace_substring_all (feature_number_placeholder, implementation_features_name.index.out)
					part_done_skeleton.replace_substring_all (implementation_feature_name_placeholder, implementation_features_name.item.as_lower)
					parts_done := parts_done + part_done_skeleton
					if implementation_features_name.index /= implementation_features_name.count - 1 then
						parts_done := parts_done + "%N%N%T"
					end
				end

				if implementation_features_name.index > 1 then
					implementation_features_code := implementation_features_code + "%T"
				end
				implementation_features_code := implementation_features_code + implementation_features_name.item.as_lower
				implementation_features_code := implementation_features_code + " " + implementation_feature_code_skeleton_header
				if implementation_features_name.index = 1 then
					implementation_features_code := implementation_features_code + implementation_feature_first_precondition
				else
					assertion_skeleton := implementation_feature_assertion_skeleton.twin
					assertion_skeleton.replace_substring_all (feature_number_placeholder, (implementation_features_name.index - 1).out)
					implementation_features_code := implementation_features_code + assertion_skeleton
				end
				implementation_features_code := implementation_features_code + implementation_feature_body

				if implementation_features_name.index /= implementation_features_name.count then
					features_name := features_name + "%N%T%T%T"
					assertion_skeleton := implementation_feature_assertion_skeleton.twin
					assertion_skeleton.replace_substring_all (feature_number_placeholder, implementation_features_name.index.out)
					implementation_features_code := implementation_features_code + assertion_skeleton
				else
					implementation_features_code := implementation_features_code + implementation_feature_last_postcondition
				end
				implementation_features_code := implementation_features_code + implementation_feature_end
				if implementation_features_name.index /= implementation_features_name.count then
					implementation_features_code := implementation_features_code + "%N%N"
				end
				implementation_features_name.forth
			end

			some_changes.extend ([template_method_implementation_features_name_placeholder, features_name])
			some_changes.extend ([template_method_parts_done_placeholder, parts_done])
			some_changes.extend ([template_method_implementation_features_code_placeholder, implementation_features_code])

			generate_code (project_directory + pattern_info.class_name.as_lower + ".e", pattern_delivery_directory + template_method_class_file_name, some_changes)
		end

	generate_effective_class
			-- Generate class containint the template method.
		require
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		local
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
			implementation_features_name: LINKED_LIST [STRING_32]
			parts_done: STRING_32
			part_done_skeleton: STRING_32
			implementation_features_code: STRING_32
			implementation_feature_skeleton: STRING_32
			assignment_target_skeleton: STRING_32
		do
			create some_changes.make
			some_changes.extend ([template_method_class_name_placeholder, pattern_info.class_name.as_upper])
			some_changes.extend ([template_method_effective_class_name_placeholder, pattern_info.effective_class_name.as_upper])

			implementation_features_name := pattern_info.implementation_features_name
			create parts_done.make (256)
			create implementation_features_code.make (256)

			from implementation_features_name.start until implementation_features_name.after loop
				if implementation_features_name.index <= implementation_features_name.count - 1 then
					part_done_skeleton := effective_part_done_skeleton.twin
					part_done_skeleton.replace_substring_all (feature_number_placeholder, implementation_features_name.index.out)
					part_done_skeleton.replace_substring_all (implementation_feature_name_placeholder, implementation_features_name.item.as_lower)
					parts_done := parts_done + part_done_skeleton
					if implementation_features_name.index /= implementation_features_name.count - 1 then
						parts_done := parts_done + "%N%N%T"
					end
				end

				implementation_features_code := implementation_features_code + implementation_features_name.item.as_lower
				implementation_feature_skeleton := effective_implementation_feature_code_skeleton_first.twin
				implementation_feature_skeleton.replace_substring_all (feature_number_placeholder, implementation_features_name.index.out)
				implementation_features_code := implementation_features_code + implementation_feature_skeleton
				if implementation_features_name.index /= implementation_features_name.count then
					assignment_target_skeleton := effective_implementation_feature_assignment_target_skeleton.twin
					assignment_target_skeleton.replace_substring_all (feature_number_placeholder, implementation_features_name.index.out)
					implementation_features_code := implementation_features_code + assignment_target_skeleton + effective_implementation_feature_code_skeleton_end + "%N%N%T"
				else
					implementation_features_code := implementation_features_code + effective_implementation_feature_assignment_target_end
					implementation_features_code := implementation_features_code + effective_implementation_feature_code_skeleton_end
				end
				implementation_features_name.forth
			end

			some_changes.extend ([template_method_effective_parts_done_placeholder, parts_done])
			some_changes.extend ([template_method_effective_implementation_features_code_placeholder, implementation_features_code])

			generate_code (project_directory + pattern_info.effective_class_name.as_lower + ".e", pattern_delivery_directory + template_method_effective_class_file_name, some_changes)
		end

end
