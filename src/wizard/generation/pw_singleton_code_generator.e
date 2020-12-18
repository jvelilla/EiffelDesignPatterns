note

	description:

		"Singleton pattern code generator"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_SINGLETON_CODE_GENERATOR

inherit

	PW_PATTERN_CODE_GENERATOR
		redefine
			pattern_info
		end

create

	default_create

feature -- Access

	pattern_info: PW_SINGLETON_INFORMATION
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
			generate_code (project_directory + singleton_ace_name + ".ecf" , pattern_delivery_directory + singleton_ace_file_name, some_changes)
		end

	generate_root_class
			-- Generate root class.
		local
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
		do
			create some_changes.make
			some_changes.extend ([singleton_access_point_class_name_placeholder, pattern_info.access_point_class_name.as_upper])
			some_changes.extend ([singleton_access_feature_name_placeholder, pattern_info.access_point_feature_name.as_lower])

			generate_code (project_directory + default_root_class_name.as_lower + ".e", pattern_delivery_directory + singleton_root_class_file_name, some_changes)
		end

	generate_pattern_code
			-- Generate Eiffel classes for this pattern (except the root class).
		do
			generate_singleton_class
			generate_singleton_access_point_class
		end

	generate_singleton_class
			-- Generate singleton class.
		require
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		local
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
		do
			create some_changes.make
			some_changes.extend ([singleton_class_name_placeholder, pattern_info.class_name])
			some_changes.extend ([singleton_access_point_class_name_placeholder, pattern_info.access_point_class_name.as_upper])
			some_changes.extend ([singleton_creation_procedure_name_placeholder, pattern_info.creation_procedure_name.as_lower])
			some_changes.extend ([singleton_access_feature_name_placeholder, pattern_info.access_point_feature_name.as_lower])

			generate_code (project_directory + pattern_info.class_name.as_lower + ".e", pattern_delivery_directory + singleton_class_file_name, some_changes)
		end

	generate_singleton_access_point_class
			-- Generate singleton access point class.
		require
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		local
			some_changes: LINKED_LIST [TUPLE [STRING_32, STRING_32]]
		do
			create some_changes.make
			some_changes.extend ([singleton_class_name_placeholder, pattern_info.class_name.as_upper])
			some_changes.extend ([singleton_access_point_class_name_placeholder, pattern_info.access_point_class_name.as_upper])
			some_changes.extend ([singleton_access_feature_name_placeholder, pattern_info.access_point_feature_name.as_lower])

			generate_code (project_directory + pattern_info.access_point_class_name.as_lower + ".e", pattern_delivery_directory + singleton_access_point_class_file_name, some_changes)
		end

end
