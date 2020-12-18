note

	description:

		"Pattern-specific GUI part of the Pattern Wizard window"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class PW_PATTERN_VERTICAL_BOX

inherit

	EV_VERTICAL_BOX
		redefine
			initialize,
			is_in_default_state
		end

	PW_INTERFACE_NAMES
		export
			{NONE} all
		undefine
			is_equal, default_create, copy
		end

	PW_SUPPORT
		undefine
			is_equal, default_create, copy
		end

feature {NONE} -- Initialization

	initialize
			-- Initialize GUI components and build vertical box.
		do
			Precursor {EV_VERTICAL_BOX}
			initialize_pattern_components
			build
		end

	initialize_pattern_components
			-- Initialize pattern-specific GUI components and build vertical box.
		deferred
		end

	build is
			-- Build frame.
		local
			hbox: EV_HORIZONTAL_BOX
		do
			create hbox
			hbox.extend (create {EV_CELL})
			pattern_intent_frame.set_minimum_width ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (window_width - 2 * margin))
			pattern_intent_frame.set_minimum_height ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (descriptor_text_field_height))
			hbox.extend (pattern_intent_frame)
			hbox.disable_item_expand (pattern_intent_frame)
			hbox.extend (create {EV_CELL})
			extend (hbox)
			disable_item_expand (hbox)

			create hbox
			hbox.extend (create {EV_CELL})
			pattern_applicability_frame.set_minimum_width ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (window_width - 2 * margin))
			pattern_applicability_frame.set_minimum_height ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (descriptor_text_field_height))
			hbox.extend (pattern_applicability_frame)
			hbox.disable_item_expand (pattern_applicability_frame)
			hbox.extend (create {EV_CELL})
			extend (hbox)
			disable_item_expand (hbox)

			create hbox
			hbox.extend (create {EV_CELL})
			project_location_selector.set_minimum_width ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (window_width - 2 * margin))
			project_location_selector.set_minimum_height ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (project_location_selector_height))
			hbox.extend (project_location_selector)
			hbox.disable_item_expand (project_location_selector)
			hbox.extend (create {EV_CELL})
			extend (hbox)
			disable_item_expand (hbox)

			create hbox
			hbox.extend (create {EV_CELL})
			pattern_properties_frame.set_minimum_width ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (window_width - 2 * margin))
			hbox.extend (pattern_properties_frame)
			hbox.disable_item_expand (pattern_properties_frame)
			hbox.extend (create {EV_CELL})
			extend (hbox)
			disable_item_expand (hbox)
		end

feature -- Status report

	is_in_default_state: BOOLEAN 
			-- Is name list selector in default state?
		do
			Result := (
						pattern_intent_frame /= Void and
						pattern_applicability_frame /= Void and
						project_location_selector /= Void and
						pattern_properties_frame /= Void
					)
		end

feature {PW_INITIAL_WINDOW} -- Access (GUI components)

	pattern_intent_frame: PW_PATTERN_DESCRIPTOR
			-- Frame showing the intent of the chosen pattern

	pattern_applicability_frame: PW_PATTERN_DESCRIPTOR
			-- Frame showing the applicability of the chosen pattern

	project_location_selector: PW_PROJECT_DIRECTORY_SELECTOR
			-- Frame enabling to choose the project location

	pattern_properties_frame: PW_PATTERN_PROPERTY_SELECTOR
			-- Frame enabling the users to select the pattern properties
			-- for the future code generation

invariant

	pattern_intent_frame_not_void: pattern_intent_frame /= Void
	pattern_applicability_frame_not_void: pattern_applicability_frame /= Void
	project_location_selector_not_void: project_location_selector /= Void
	pattern_properties_frame_not_void: pattern_properties_frame /= Void

end
