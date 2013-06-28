indexing

	description:

		"Frame where the user can select the Object Adapter pattern properties"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_OBJECT_ADAPTER_PROPERTY_SELECTOR

inherit

	PW_ADAPTER_PROPERTY_SELECTOR
		redefine
			initialize_pattern_components
		end

create

	make,
	make_with_name_and_text
	   
feature {NONE} -- Initialization

	initialize_pattern_components is
			-- Initialize GUI components that are pattern-specific.
		do
			Precursor {PW_ADAPTER_PROPERTY_SELECTOR}
			create adapter_frame.make_with_info_and_text (creation_procedure_name_label_text, Void, adapter_class_text)
			adapter_frame.set_default_feature_1_name (default_creation_procedure_name)
		end

feature -- Access

	adapter_creation_procedure_name: STRING is
			-- Chosen name for the adapter's creation procedure
		do
			Result := adapter_frame.feature_1_name_selector.name_text
		ensure
			adapter_creation_procedure_name_not_void: Result /= Void
			definition: Result.is_equal (adapter_frame.feature_1_name_selector.name_text)
		end

end
