note

	description:

		"Frame where the user can select the original Bridge pattern properties"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_ORIGINAL_BRIDGE_PROPERTY_SELECTOR

inherit

	PW_BRIDGE_PROPERTY_SELECTOR

create

	make,
	make_with_name_and_text

feature {NONE} -- Initialization

	initialize_pattern_components is
			-- Initialize GUI components that are pattern-specific.
		do
			create notebook
			create application_frame.make_with_info_and_text (creation_procedure_name_label_text + "%N(will be used in descendants)",
																feature_name_label_text,
																bridge_deferred_application_class_text)
			create descendant_application_classes_name_list.make (bridge_descendant_application_classes_label_text)
			create implementation_frame.make_with_info_and_text (feature_name_label_text, Void,
																bridge_deferred_application_implementation_class_text)
			create descendant_application_implementation_classes_name_list.make (bridge_descendant_application_implementation_classes_label_text)
			application_frame.set_default_feature_1_name (default_creation_procedure_name)
			application_frame.set_default_feature_2_name (default_feature_name)
			implementation_frame.set_default_feature_1_name (default_feature_name)
		end

feature -- Access

	application_creation_procedure_name: STRING is
			-- Chosen name for the creation procedure of the application class
		do
			Result := application_frame.feature_1_name_selector.name_text
		ensure
			application_creation_procedure_name_not_void: Result /= Void
			definition: Result.is_equal (application_frame.feature_1_name_selector.name_text)
		end

	application_feature_name: STRING is
			-- Chosen name for the application class's feature
		do
			Result := application_frame.feature_2_name_selector.name_text
		ensure
			application_feature_name_not_void: Result /= Void
			definition: Result.is_equal (application_frame.feature_2_name_selector.name_text)
		end

end
