indexing

	description:

		"Implementation features of the Eiffel Pattern Wizard's initial window"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class PW_INITIAL_WINDOW_IMP

feature {NONE} -- Implementation (Pattern-specific GUI components)

	singleton_pattern_vbox: PW_SINGLETON_VERTICAL_BOX
			-- `pattern_vbox' if chosen pattern is the Singleton pattern

	decorator_pattern_vbox: PW_DECORATOR_VERTICAL_BOX
			-- `pattern_vbox' if chosen pattern is the Decorator pattern

	class_adapter_pattern_vbox: PW_CLASS_ADAPTER_VERTICAL_BOX
			-- `pattern_vbox' if chosen pattern is the Class Adapter pattern

	object_adapter_pattern_vbox: PW_OBJECT_ADAPTER_VERTICAL_BOX
			-- `pattern_vbox' if chosen pattern is the Object Adapter pattern

	template_method_pattern_vbox: PW_TEMPLATE_METHOD_VERTICAL_BOX
			-- `pattern_vbox' if chosen pattern is the Template method pattern

	template_method_with_agents_pattern_vbox: PW_TEMPLATE_METHOD_WITH_AGENTS_VERTICAL_BOX
			-- `pattern_vbox' if chosen pattern is the Template method with agents pattern

	bridge_pattern_vbox: PW_BRIDGE_VERTICAL_BOX
			-- `pattern_vbox' if chosen pattern is the Bridge pattern

	bridge_with_effective_classes_pattern_vbox: PW_BRIDGE_WITH_EFFECTIVE_CLASSES_VERTICAL_BOX
			-- `pattern_vbox' if chosen pattern is the Bridge pattern 
			-- implemented with effective classes only

	bridge_with_inheritance_pattern_vbox: PW_BRIDGE_WITH_INHERITANCE_VERTICAL_BOX
			-- `pattern_vbox' if chosen pattern is the Bridge pattern
			-- implemented with non-conforming inheritance

feature {NONE} -- Implementation (Pattern information)

	singleton_info: PW_SINGLETON_INFORMATION is
			-- Selected information about the chosen pattern
		require
			singleton_pattern_vbox_not_void: singleton_pattern_vbox /= Void
		local
			frame: PW_SINGLETON_PROPERTY_SELECTOR
		do
			create Result
			frame := singleton_pattern_vbox.pattern_properties_frame
			Result.set_class_name (frame.singleton_class_name)
			Result.set_access_point_class_name (frame.access_point_class_name)
			Result.set_creation_procedure_name (frame.singleton_creation_procedure_name)
			Result.set_access_point_feature_name (frame.access_point_feature_name)
		ensure
			singleton_info_not_void: Result /= Void
		end

	decorator_info: PW_DECORATOR_INFORMATION is
			-- Selected information about the chosen pattern
		require
			decorator_pattern_vbox_not_void: decorator_pattern_vbox /= Void
		local
			frame: PW_DECORATOR_PROPERTY_SELECTOR
		do
			create Result
			frame := decorator_pattern_vbox.pattern_properties_frame
			Result.set_component_class_name (frame.component_class_name)
			Result.set_feature_name (frame.component_feature_name)
			Result.set_effective_component_class_name (frame.effective_component_class_name)
			Result.set_decorated_component_class_name (frame.decorated_component_class_name)
			Result.set_decorated_component_creation_procedure_name (frame.decorated_component_creation_procedure_name)
			if frame.is_component_with_additional_attribute_generation then
				Result.set_component_with_additional_attribute_generation (True)
				Result.set_additional_attribute_name (frame.additional_attribute_name)
				Result.set_additional_attribute_type_name (frame.additional_attribute_type_name)
			end
			if frame.is_component_with_additional_behavior_generation then
				Result.set_component_with_additional_behavior_generation (True)
				Result.set_additional_feature_name (frame.additional_feature_name)
			end
		ensure
			decorator_info_not_void: Result /= Void
		end

	class_adapter_info: PW_CLASS_ADAPTER_INFORMATION is
			-- Selected information about the chosen pattern
		require
			class_adapter_pattern_vbox_not_void: class_adapter_pattern_vbox /= Void
		local
			frame: PW_CLASS_ADAPTER_PROPERTY_SELECTOR
		do
			create Result
			frame := class_adapter_pattern_vbox.pattern_properties_frame
			Result.set_target_class_name (frame.target_class_name)
			Result.set_target_feature_name (frame.target_feature_name)
			Result.set_adaptee_class_name (frame.adaptee_class_name)
			Result.set_adaptee_feature_name (frame.adaptee_feature_name)
			Result.set_adapter_class_name (frame.adapter_class_name)
		ensure
			class_adapter_info_not_void: Result /= Void
		end

	object_adapter_info: PW_OBJECT_ADAPTER_INFORMATION is
			-- Selected information about the chosen pattern
		require
			object_adapter_pattern_vbox_not_void: object_adapter_pattern_vbox /= Void
		local
			frame: PW_OBJECT_ADAPTER_PROPERTY_SELECTOR
		do
			create Result
			frame := object_adapter_pattern_vbox.pattern_properties_frame
			Result.set_target_class_name (frame.target_class_name)
			Result.set_target_feature_name (frame.target_feature_name)
			Result.set_adaptee_class_name (frame.adaptee_class_name)
			Result.set_adaptee_feature_name (frame.adaptee_feature_name)
			Result.set_adapter_class_name (frame.adapter_class_name)
			Result.set_adapter_creation_procedure_name (frame.adapter_creation_procedure_name)
		ensure
			object_adapter_info_not_void: Result /= Void
		end

	template_method_info: PW_ORIGINAL_TEMPLATE_METHOD_INFORMATION is
			-- Selected information about the chosen pattern
		require
			template_method_pattern_vbox_not_void: template_method_pattern_vbox /= Void
		local
			frame: PW_TEMPLATE_METHOD_PROPERTY_SELECTOR
		do
			create Result
			frame := template_method_pattern_vbox.pattern_properties_frame
			Result.set_class_name (frame.application_class_name)
			Result.set_template_method_name (frame.template_method_name)
			Result.set_implementation_features_name (frame.implementation_features_name)
			Result.set_effective_class_name (frame.effective_class_name)
		ensure
			template_method_info_not_void: Result /= Void
		end

	template_method_with_agents_info: PW_TEMPLATE_METHOD_WITH_AGENTS_INFORMATION is
			-- Selected information about the chosen pattern
		require
			template_method_with_agents_pattern_vbox_not_void: template_method_with_agents_pattern_vbox /= Void
		local
			frame: PW_TEMPLATE_METHOD_WITH_AGENTS_PROPERTY_SELECTOR
		do
			create Result
			frame := template_method_with_agents_pattern_vbox.pattern_properties_frame
			Result.set_class_name (frame.application_class_name)
			Result.set_template_method_name (frame.template_method_name)
			Result.set_implementation_features_name (frame.implementation_features_name)
			Result.set_creation_procedure_name (frame.creation_procedure_name)
			Result.set_client_class_name (frame.client_class_name)
		ensure
			template_method_with_agents_info_not_void: Result /= Void
		end

	bridge_info: PW_ORIGINAL_BRIDGE_INFORMATION is
			-- Selected information about the chosen pattern
		require
			bridge_pattern_vbox_not_void: bridge_pattern_vbox /= Void
		local
			frame: PW_ORIGINAL_BRIDGE_PROPERTY_SELECTOR
		do
			create Result
			frame := bridge_pattern_vbox.pattern_properties_frame
			Result.set_application_class_name (frame.application_class_name)
			Result.set_application_creation_procedure_name (frame.application_creation_procedure_name)
			Result.set_application_feature_name (frame.application_feature_name)
			Result.set_descendant_application_classes_name (frame.descendant_application_classes_name)
			Result.set_application_implementation_class_name (frame.application_implementation_class_name)
			Result.set_application_implementation_feature_name (frame.application_implementation_feature_name)
			Result.set_descendant_application_implementation_classes_name (frame.descendant_application_implementation_classes_name)
		ensure
			bridge_info_not_void: Result /= Void
		end

	bridge_with_effective_classes_info: PW_BRIDGE_WITH_EFFECTIVE_CLASSES_INFORMATION is
			-- Selected information about the chosen pattern
		require
			bridge_with_effective_classes_pattern_vbox_not_void: bridge_with_effective_classes_pattern_vbox /= Void
		local
			frame: PW_BRIDGE_WITH_EFFECTIVE_CLASSES_PROPERTY_SELECTOR
		do
			create Result
			frame := bridge_with_effective_classes_pattern_vbox.pattern_properties_frame
			Result.set_application_class_name (frame.application_class_name)
			Result.set_application_creation_procedure_name (frame.application_creation_procedure_name)
			Result.set_application_feature_name (frame.application_feature_name)
			Result.set_descendant_application_classes_name (frame.descendant_application_classes_name)
			Result.set_application_implementation_class_name (frame.application_implementation_class_name)
			Result.set_application_implementation_feature_name (frame.application_implementation_feature_name)
			Result.set_descendant_application_implementation_classes_name (frame.descendant_application_implementation_classes_name)
		ensure
			bridge_with_effective_classes_info_not_void: Result /= Void
		end

	bridge_with_inheritance_info: PW_BRIDGE_WITH_INHERITANCE_INFORMATION is
			-- Selected information about the chosen pattern
		require
			bridge_with_inheritance_pattern_vbox_not_void: bridge_with_inheritance_pattern_vbox /= Void
		local
			frame: PW_BRIDGE_WITH_INHERITANCE_PROPERTY_SELECTOR
		do
			create Result
			frame := bridge_with_inheritance_pattern_vbox.pattern_properties_frame
			Result.set_application_class_name (frame.application_class_name)
			Result.set_application_feature_name (frame.application_feature_name)
			Result.set_descendant_application_classes_name (frame.descendant_application_classes_name)
			Result.set_application_implementation_class_name (frame.application_implementation_class_name)
			Result.set_application_implementation_feature_name (frame.application_implementation_feature_name)
			Result.set_descendant_application_implementation_classes_name (frame.descendant_application_implementation_classes_name)
		ensure
			bridge_with_inheritance_info_not_void: Result /= Void
		end

end
