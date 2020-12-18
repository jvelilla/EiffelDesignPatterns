note

	description:

		"Names used in skeleton classes and file names of skeleton classes"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_SKELETON_NAMES

create

	default_create

feature -- Placeholder names (Ace file)

	project_directory_placeholder: STRING_32 = "<PROJECT_DIRECTORY>"

feature -- Placeholder names (Singleton pattern)

	singleton_class_name_placeholder: STRING_32 = "<SINGLETON_CLASS_NAME>"
	singleton_access_point_class_name_placeholder: STRING_32 = "<SINGLETON_ACCESS_POINT_CLASS_NAME>"
	singleton_creation_procedure_name_placeholder: STRING_32 = "<SINGLETON_CREATION_PROCEDURE_NAME>"
	singleton_access_feature_name_placeholder: STRING_32 = "<SINGLETON_ACCESS_FEATURE_NAME>"

feature -- Placeholder names (Decorator pattern)

	decorator_component_class_name_placeholder: STRING_32 = "<DECORATOR_COMPONENT_CLASS_NAME>"
	decorator_feature_name_placeholder: STRING_32 = "<DECORATOR_FEATURE_NAME>"
	decorator_effective_component_class_name_placeholder: STRING_32 = "<DECORATOR_EFFECTIVE_COMPONENT_CLASS_NAME>"
	decorator_decorated_component_class_name_placeholder: STRING_32 = "<DECORATOR_DECORATED_COMPONENT_CLASS_NAME>"
	decorator_decorated_component_creation_procedure_name_placeholder: STRING_32 = "<DECORATOR_DECORATED_COMPONENT_CREATION_PROCEDURE_NAME>"
	decorator_decorated_component_with_additional_attribute_class_name_placeholder: STRING_32 = "<DECORATOR_DECORATED_COMPONENT_WITH_ADDITIONAL_ATTRIBUTE_CLASS_NAME>"
	decorator_additional_attribute_name_placeholder: STRING_32 = "<DECORATOR_ADDITIONAL_ATTRIBUTE_NAME>"
	decorator_additional_attribute_type_name_placeholder: STRING_32 = "<DECORATOR_ADDITIONAL_ATTRIBUTE_TYPE_NAME>"
	decorator_decorated_component_with_additional_behavior_class_name_placeholder: STRING_32 = "<DECORATOR_DECORATED_COMPONENT_WITH_ADDITIONAL_BEHAVIOR_CLASS_NAME>"
	decorator_additional_feature_name_placeholder: STRING_32 = "<DECORATOR_ADDITIONAL_FEATURE_NAME>"

feature -- Placeholder names (Adapter pattern)

	adapter_target_class_name_placeholder: STRING_32 = "<ADAPTER_TARGET_CLASS_NAME>"
	adapter_target_feature_name_placeholder: STRING_32 = "<ADAPTER_TARGET_FEATURE_NAME>"
	adapter_adaptee_class_name_placeholder: STRING_32 = "<ADAPTER_ADAPTEE_CLASS_NAME>"
	adapter_adaptee_feature_name_placeholder: STRING_32 = "<ADAPTER_ADAPTEE_FEATURE_NAME>"
	adapter_class_name_placeholder: STRING_32 = "<ADAPTER_CLASS_NAME>"
	adapter_creation_procedure_name_placeholder: STRING_32 = "<ADAPTER_CREATION_PROCEDURE_NAME>"

feature -- Placeholder names (Template method pattern)

	template_method_class_name_placeholder: STRING_32 = "<TEMPLATE_METHOD_APPLICATION_CLASS_NAME>"
	template_method_name_placeholder: STRING_32 = "<TEMPLATE_METHOD_NAME>"
	template_method_effective_class_name_placeholder: STRING_32 = "<TEMPLATE_METHOD_EFFECTIVE_APPLICATION_CLASS_NAME>"
	template_method_implementation_features_name_placeholder: STRING_32 = "<TEMPLATE_METHOD_IMPLEMENTATION_FEATURES_NAME>"
	template_method_implementation_features_code_placeholder: STRING_32 = "<TEMPLATE_METHOD_IMPLEMENTATION_FEATURES_CODE>"
	template_method_effective_implementation_features_code_placeholder: STRING_32 = "<TEMPLATE_METHOD_EFFECTIVE_IMPLEMENTATION_FEATURES_CODE>"
	template_method_parts_done_placeholder: STRING_32 = "<TEMPLATE_METHOD_PARTS_DONE>"
	template_method_effective_parts_done_placeholder: STRING_32 = "<TEMPLATE_METHOD_EFFECTIVE_PARTS_DONE>"

feature -- Placeholder names (Template method with agents)

	template_method_creation_procedure_name_placeholder: STRING_32 = "<TEMPLATE_METHOD_CREATION_PROCEDURE_NAME>"
	template_method_client_class_name_placeholder: STRING_32 = "<TEMPLATE_METHOD_CLIENT_CLASS_NAME>"

feature -- Placeholder names (Bridge with deferred classes)

	bridge_class_name_placeholder: STRING_32 = "<BRIDGE_CLASS_NAME>"
	bridge_creation_procedure_name_placeholder: STRING_32 = "<BRIDGE_CREATION_PROCEDURE_NAME>"
	bridge_feature_name_placeholder: STRING_32 = "<BRIDGE_FEATURE_NAME>"
	bridge_descendant_class_name_placeholder: STRING_32 = "<BRIDGE_DESCENDANT_CLASS_NAME>"
	bridge_implementation_class_name_placeholder: STRING_32 = "<BRIDGE_IMPLEMENTATION_CLASS_NAME>"
	bridge_implementation_feature_name_placeholder: STRING_32 = "<BRIDGE_IMPLEMENTATION_FEATURE_NAME>"
	bridge_descendant_implementation_class_name_placeholder: STRING_32 = "<BRIDGE_DESCENDANT_IMPLEMENTATION_CLASS_NAME>"
	bridge_client_local_variables_placeholder: STRING_32 = "<BRIDGE_CLIENT_LOCAL_VARIABLES>"
	bridge_client_code_placeholder: STRING_32 = "<BRIDGE_CLIENT_CODE>"

feature -- File names (Singleton pattern)

	singleton_ace_file_name: STRING_32 = "\src\wizard\skeletons\singleton\singleton_skeleton.ace"
	singleton_root_class_file_name: STRING_32 = "\src\wizard\skeletons\singleton\application_skeleton.e"
	singleton_class_file_name: STRING_32 = "\src\wizard\skeletons\singleton\singleton_skeleton.e"
	singleton_access_point_class_file_name: STRING_32 = "\src\wizard\skeletons\singleton\singleton_access_point_skeleton.e"

feature -- File names (Decorator pattern)

	decorator_ace_file_name: STRING_32 = "\src\wizard\skeletons\decorator\decorator_skeleton.ace"
	decorator_root_class_file_name: STRING_32 = "\src\wizard\skeletons\decorator\application_skeleton.e"
	decorator_component_class_file_name: STRING_32 = "\src\wizard\skeletons\decorator\component_skeleton.e"
	decorator_effective_component_class_file_name: STRING_32 = "\src\wizard\skeletons\decorator\effective_component_skeleton.e"
	decorator_decorated_component_class_file_name: STRING_32 = "\src\wizard\skeletons\decorator\decorated_component_skeleton.e"
	decorator_decorated_component_with_additional_attribute_class_file_name: STRING_32 = "\src\wizard\skeletons\decorator\decorated_component_with_additional_attribute_skeleton.e"
	decorator_additional_attribute_type_file_name: STRING_32 = "\src\wizard\skeletons\decorator\additional_attribute_type_skeleton.e"
	decorator_decorated_component_with_additional_behavior_class_file_name: STRING_32 = "\src\wizard\skeletons\decorator\decorated_component_with_additional_behavior_skeleton.e"

feature -- File names (Adapter pattern)

	class_adapter_ace_file_name: STRING_32 = "\src\wizard\skeletons\adapter\class_adapter\class_adapter_skeleton.ace"
	class_adapter_root_class_file_name: STRING_32 = "\src\wizard\skeletons\adapter\class_adapter\application_skeleton.e"
	class_adapter_class_file_name: STRING_32 = "\src\wizard\skeletons\adapter\class_adapter\adapter_skeleton.e"
	class_adapter_adaptee_class_file_name: STRING_32 = "\src\wizard\skeletons\adapter\class_adapter\adaptee_skeleton.e"
	class_adapter_target_class_file_name: STRING_32 = "\src\wizard\skeletons\adapter\class_adapter\target_skeleton.e"

	object_adapter_ace_file_name: STRING_32 = "\src\wizard\skeletons\adapter\object_adapter\object_adapter_skeleton.ace"
	object_adapter_root_class_file_name: STRING_32 = "\src\wizard\skeletons\adapter\object_adapter\application_skeleton.e"
	object_adapter_class_file_name: STRING_32 = "\src\wizard\skeletons\adapter\object_adapter\adapter_skeleton.e"
	object_adapter_adaptee_class_file_name: STRING_32 = "\src\wizard\skeletons\adapter\object_adapter\adaptee_skeleton.e"
	object_adapter_target_class_file_name: STRING_32 = "\src\wizard\skeletons\adapter\object_adapter\target_skeleton.e"

feature -- File names (Template method pattern)

	template_method_ace_file_name: STRING_32 = "\src\wizard\skeletons\template_method\pattern\template_method_pattern_skeleton.ace"
	template_method_root_class_file_name: STRING_32 = "\src\wizard\skeletons\template_method\pattern\client_skeleton.e"
	template_method_class_file_name: STRING_32 = "\src\wizard\skeletons\template_method\pattern\application_skeleton.e"
	template_method_effective_class_file_name: STRING_32 = "\src\wizard\skeletons\template_method\pattern\effective_application_skeleton.e"

feature -- File names (Template method with agents pattern)

	template_method_with_agents_ace_file_name: STRING_32 = "\src\wizard\skeletons\template_method\agents\template_method_with_agents_skeleton.ace"
	template_method_with_agents_root_class_file_name: STRING_32 = "\src\wizard\skeletons\template_method\agents\client_skeleton.e"
	template_method_with_agents_class_file_name: STRING_32 = "\src\wizard\skeletons\template_method\agents\application_skeleton.e"

feature -- File names (Bridge with deferred classes)

	bridge_ace_file_name: STRING_32 = "\src\wizard\skeletons\bridge\deferred_classes\bridge_with_deferred_classes_skeleton.ace"
	bridge_root_class_file_name: STRING_32 = "\src\wizard\skeletons\bridge\deferred_classes\client_skeleton.e"
	bridge_class_file_name: STRING_32 = "\src\wizard\skeletons\bridge\deferred_classes\application_skeleton.e"
	bridge_descendant_class_file_name: STRING_32 = "\src\wizard\skeletons\bridge\deferred_classes\descendant_application_skeleton.e"
	bridge_implementation_class_file_name: STRING_32 = "\src\wizard\skeletons\bridge\deferred_classes\application_implementation_skeleton.e"
	bridge_descendant_implementation_class_file_name: STRING_32 = "\src\wizard\skeletons\bridge\deferred_classes\descendant_application_implementation_skeleton.e"

feature -- File names (Bridge with effective classes)

	bridge_with_effective_classes_ace_file_name: STRING_32 = "\src\wizard\skeletons\bridge\effective_classes\bridge_with_effective_classes_skeleton.ace"
	bridge_with_effective_classes_root_class_file_name: STRING_32 = "\src\wizard\skeletons\bridge\effective_classes\client_skeleton.e"
	bridge_with_effective_classes_class_file_name: STRING_32 = "\src\wizard\skeletons\bridge\effective_classes\application_skeleton.e"
	bridge_with_effective_classes_descendant_class_file_name: STRING_32 = "\src\wizard\skeletons\bridge\effective_classes\descendant_application_skeleton.e"
	bridge_with_effective_classes_implementation_class_file_name: STRING_32 = "\src\wizard\skeletons\bridge\effective_classes\application_implementation_skeleton.e"
	bridge_with_effective_classes_descendant_implementation_class_file_name: STRING_32 = "\src\wizard\skeletons\bridge\effective_classes\descendant_application_implementation_skeleton.e"

feature -- File names (Bridge with inheritance)

	bridge_with_inheritance_ace_file_name: STRING_32 = "\src\wizard\skeletons\bridge\inheritance\bridge_with_inheritance_skeleton.ace"
	bridge_with_inheritance_root_class_file_name: STRING_32 = "\src\wizard\skeletons\bridge\inheritance\client_skeleton.e"
	bridge_with_inheritance_class_file_name: STRING_32 = "\src\wizard\skeletons\bridge\inheritance\application_skeleton.e"
	bridge_with_inheritance_descendant_class_file_name: STRING_32 = "\src\wizard\skeletons\bridge\inheritance\descendant_application_skeleton.e"
	bridge_with_inheritance_implementation_class_file_name: STRING_32 = "\src\wizard\skeletons\bridge\inheritance\application_implementation_skeleton.e"
	bridge_with_inheritance_descendant_implementation_class_file_name: STRING_32 = "\src\wizard\skeletons\bridge\inheritance\descendant_application_implementation_skeleton.e"

feature -- Code (Template method pattern)

	feature_number_placeholder: STRING_32 = "<FEATURE_NUMBER>"
	implementation_feature_name_placeholder: STRING_32 = "<IMPLEMENTATION_FEATURE_NAME>"
	part_done_code_skeleton: STRING_32 = "part_<FEATURE_NUMBER>_done: BOOLEAN is%N%T%T%T-- Has `<IMPLEMENTATION_FEATURE_NAME>' done its job?%N%T%Tdeferred%N%T%Tend"
	implementation_feature_code_skeleton_header: STRING_32 = "is%N%T%T%T-- Do something.%N%T%Trequire%N%T%T%T"
	implementation_feature_first_precondition: STRING_32 = "ready: ready"
	implementation_feature_body: STRING_32 = "%N%T%Tdeferred%N%T%Tensure%N%T%T%T"
	implementation_feature_assertion_skeleton: STRING_32 = "part_<FEATURE_NUMBER>_done: part_<FEATURE_NUMBER>_done"
	implementation_feature_end: STRING_32 = "%N%T%Tend"
	implementation_feature_last_postcondition: STRING_32 = "done: done"
	effective_part_done_skeleton: STRING_32 = "part_<FEATURE_NUMBER>_done: BOOLEAN%N%T%T%T-- Has `<IMPLEMENTATION_FEATURE_NAME>' done its job?"
	effective_implementation_feature_code_skeleton_first: STRING_32 = " is%N%T%T%T-- Do something.%N%T%Tdo%N%T%T%Tdebug%N%T%T%T%Tio.put_string (%"Do something -- part <FEATURE_NUMBER> -- in %")%N%T%T%T%Tio.put_string (generating_type)%N%T%T%T%Tio.put_string (%".%%N%")%N%T%T%Tend%N%T%T%T-- Do something.%N%T%T%T"
	effective_implementation_feature_assignment_target_skeleton: STRING_32 = "part_<FEATURE_NUMBER>_done"
	effective_implementation_feature_assignment_target_end: STRING_32 = "done"
	effective_implementation_feature_code_skeleton_end: STRING_32 = " := True%N%T%Tend"

feature -- Code (Template method with agents pattern)

	implementation_feature_code_skeleton: STRING_32 = " is%N%T%T%T-- Do something.%N%T%Tdo%N%T%T%Tdebug%N%T%T%T%Tio.put_string (%"Do something -- part <FEATURE_NUMBER>.%%N%")%N%T%T%Tend%N%T%T%T-- Do something.%N%T%Tend"
	implementation_feature_name_skeleton: STRING_32 = "an_application.extend (agent <IMPLEMENTATION_FEATURE_NAME>)"

feature -- Code (Bridge pattern)

	descendant_class_name_placeholder: STRING_32 = "<DESCENDANT_CLASS_NAME>"
	descendant_class_number_placeholder: STRING_32 = "<DESCENDANT_CLASS_NUMBER>"
	descendant_implementation_class_name_placeholder: STRING_32 = "<DESCENDANT_IMPLEMENTATION_CLASS_NAME>"
	bridge_local_variable_code_skeleton: STRING_32 = "application_<DESCENDANT_CLASS_NUMBER>: <DESCENDANT_CLASS_NAME>"
	bridge_client_code_skeleton: STRING_32 = "create application_<DESCENDANT_CLASS_NUMBER>.<BRIDGE_CREATION_PROCEDURE_NAME> (create {<DESCENDANT_IMPLEMENTATION_CLASS_NAME>})%N%T%T%Tapplication_<DESCENDANT_CLASS_NUMBER>.<BRIDGE_FEATURE_NAME>"
	bridge_with_inheritance_client_code_skeleton: STRING_32 = "create application_<DESCENDANT_CLASS_NUMBER>%N%T%T%Tapplication_<DESCENDANT_CLASS_NUMBER>.<BRIDGE_FEATURE_NAME>"

feature -- Patterns' name to be used as Ace file name

	singleton_ace_name: STRING_32 = "singleton"
	decorator_ace_name: STRING_32 = "decorator"
	class_adapter_ace_name: STRING_32 = "class_adapter"
	object_adapter_ace_name: STRING_32 = "object_adapter"
	template_method_pattern_ace_name: STRING_32 = "template_method_pattern"
	template_method_with_agents_ace_name: STRING_32 = "template_method_with_agents"
	bridge_with_deferred_classes_ace_name: STRING_32 = "bridge_with_deferred_classes"
	bridge_with_effective_classes_ace_name: STRING_32 = "bridge_with_effective_classes"
	bridge_with_inheritance_ace_name: STRING_32 = "bridge_with_non_conforming_inheritance"

end
