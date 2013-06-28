indexing

	description:

		"Frame where the user can select the Class Adapter pattern properties"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_CLASS_ADAPTER_PROPERTY_SELECTOR

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
			create adapter_frame.make_with_info_and_text (Void, Void, adapter_class_text)
		end

end
