note

	description:
		"[
			Frame where the user can select the properties of the
			Bridge pattern implemented with non-conforming inheritance
		]"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_BRIDGE_WITH_INHERITANCE_PROPERTY_SELECTOR

inherit

	PW_BRIDGE_PROPERTY_SELECTOR

create

	make,
	make_with_name_and_text

feature {NONE} -- Initialization

	initialize_pattern_components 
			-- Initialize GUI components that are pattern-specific.
		do
			create notebook
			create application_frame.make_with_info_and_text (feature_name_label_text, Void,
																bridge_application_class_text)
			create descendant_application_classes_name_list.make (bridge_descendant_application_classes_label_text)
			create implementation_frame.make_with_info_and_text (feature_name_label_text, Void,
																bridge_application_implementation_class_text)
			create descendant_application_implementation_classes_name_list.make (bridge_descendant_application_implementation_classes_label_text)
			application_frame.set_default_feature_1_name (default_feature_name)
			implementation_frame.set_default_feature_1_name (default_bridge_with_inheritance_implementation_feature_name)
		end

feature -- Access

	application_feature_name: STRING_32
			-- Chosen name for the application class's feature
		do
			Result := application_frame.feature_1_name_selector.name_text
		ensure
			application_feature_name_not_void: Result /= Void
			definition: Result.is_equal (application_frame.feature_1_name_selector.name_text)
		end


end
