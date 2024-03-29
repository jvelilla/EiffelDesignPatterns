note

	description:

		"Template method with agents pattern-specific GUI part of the Pattern Wizard window"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_TEMPLATE_METHOD_WITH_AGENTS_VERTICAL_BOX

inherit

	PW_PATTERN_VERTICAL_BOX
		redefine
			pattern_properties_frame
		end

create

	default_create

feature {NONE} -- Initialization

	initialize_pattern_components 
			-- Initialize pattern-specific GUI components and build vertical box.
		do
			create pattern_intent_frame.make_with_descriptor_and_text (template_method_with_agents_pattern_name, template_method_intent, pattern_intent_frame_text)
			create pattern_applicability_frame.make_with_descriptor_and_text (template_method_with_agents_pattern_name, template_method_applicability, pattern_applicability_frame_text)
			create project_location_selector.make_with_text (project_location_selector_text)
			create pattern_properties_frame.make_with_name_and_text (template_method_with_agents_pattern_name, pattern_delivery_directory + template_method_with_agents_class_diagram_file_name, pattern_properties_frame_text)
		end

feature {PW_INITIAL_WINDOW_IMP} -- Implementation (GUI components)

	pattern_properties_frame: PW_TEMPLATE_METHOD_WITH_AGENTS_PROPERTY_SELECTOR
			-- Frame enabling the users to select the pattern properties
			-- for the future code generation

end
