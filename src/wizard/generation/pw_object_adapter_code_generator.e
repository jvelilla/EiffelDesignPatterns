indexing

	description:

		"Object adapter pattern code generator"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_OBJECT_ADAPTER_CODE_GENERATOR

inherit

	PW_ADAPTER_CODE_GENERATOR
		redefine
			pattern_info
		end

create

	default_create

feature -- Access

	pattern_info: PW_OBJECT_ADAPTER_INFORMATION
			-- Pattern information needed for the code generation
			-- (name of classes, name of features, etc.)

feature {NONE} -- Implementation (Code generation)

	generate_ace_file is
			-- Generate Ace file.
		local
			some_changes: LINKED_LIST [TUPLE [STRING, STRING]]
		do
			create some_changes.make
			some_changes.extend ([project_directory_placeholder, project_directory])
			generate_code (project_directory + object_adapter_ace_name + ".ace" , pattern_delivery_directory + object_adapter_ace_file_name, some_changes)
		end

	generate_root_class is
			-- Generate root class.
		local
			some_changes: LINKED_LIST [TUPLE [STRING, STRING]]
		do
			create some_changes.make
			some_changes.extend ([adapter_target_class_name_placeholder, pattern_info.target_class_name.as_upper])
			some_changes.extend ([adapter_target_feature_name_placeholder, pattern_info.target_feature_name.as_lower])
			some_changes.extend ([adapter_adaptee_class_name_placeholder, pattern_info.adaptee_class_name.as_upper])
			some_changes.extend ([adapter_class_name_placeholder, pattern_info.adapter_class_name.as_upper])
			some_changes.extend ([adapter_creation_procedure_name_placeholder, pattern_info.adapter_creation_procedure_name.as_lower])

			generate_code (project_directory + default_root_class_name.as_lower + ".e", pattern_delivery_directory + object_adapter_root_class_file_name, some_changes)
		end

	generate_target_class is
			-- Generate target class.
		local
			some_changes: LINKED_LIST [TUPLE [STRING, STRING]]
		do
			create some_changes.make
			some_changes.extend ([adapter_target_class_name_placeholder, pattern_info.target_class_name.as_upper])
			some_changes.extend ([adapter_target_feature_name_placeholder, pattern_info.target_feature_name.as_lower])

			generate_code (project_directory + pattern_info.target_class_name.as_lower + ".e", pattern_delivery_directory + object_adapter_target_class_file_name, some_changes)
		end

	generate_adaptee_class is
			-- Generate adaptee class.
		local
			some_changes: LINKED_LIST [TUPLE [STRING, STRING]]
		do
			create some_changes.make
			some_changes.extend ([adapter_adaptee_class_name_placeholder, pattern_info.adaptee_class_name.as_upper])
			some_changes.extend ([adapter_adaptee_feature_name_placeholder, pattern_info.adaptee_feature_name.as_lower])

			generate_code (project_directory + pattern_info.adaptee_class_name.as_lower + ".e", pattern_delivery_directory + object_adapter_adaptee_class_file_name, some_changes)
		end

	generate_adapter_class is
			-- Generate adapter class.
		local
			some_changes: LINKED_LIST [TUPLE [STRING, STRING]]
		do
			create some_changes.make
			some_changes.extend ([adapter_class_name_placeholder, pattern_info.adapter_class_name.as_upper])
			some_changes.extend ([adapter_target_class_name_placeholder, pattern_info.target_class_name.as_upper])
			some_changes.extend ([adapter_target_feature_name_placeholder, pattern_info.target_feature_name.as_lower])
			some_changes.extend ([adapter_creation_procedure_name_placeholder, pattern_info.adapter_creation_procedure_name.as_lower])
			some_changes.extend ([adapter_adaptee_class_name_placeholder, pattern_info.adaptee_class_name.as_upper])
			some_changes.extend ([adapter_adaptee_feature_name_placeholder, pattern_info.adaptee_feature_name.as_lower])

			generate_code (project_directory + pattern_info.adapter_class_name.as_lower + ".e", pattern_delivery_directory + object_adapter_class_file_name, some_changes)
		end

end
