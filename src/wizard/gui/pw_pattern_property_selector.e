note

	description:

		"Frame where the user can select the pattern properties"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class PW_PATTERN_PROPERTY_SELECTOR

inherit

	EV_FRAME
		redefine
			initialize,
			is_in_default_state
		end

	PW_INTERFACE_NAMES
		export
			{NONE} all
		undefine
			default_create, copy
		end

	PW_SUPPORT
		undefine
			default_create, copy
		end

feature {NONE} -- Initialization

	make (a_name: like pattern_name; a_file_name: like class_diagram_file_name)
			-- Set `pattern_name' to `a_name' and `class_diagram_file_name' to `a_file_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_file_name_not_void: a_file_name /= Void
			a_file_name_not_empty: not a_file_name.is_empty
			file_exists: file_exists (a_file_name)
		do
			pattern_name := a_name
			class_diagram_file_name := a_file_name
			default_create
		ensure
			pattern_name_set: pattern_name = a_name
			class_diagram_file_name_set: class_diagram_file_name = a_file_name
		end

	make_with_name_and_text (a_name: like pattern_name; a_file_name: like class_diagram_file_name; a_text: like text)
			-- Set `pattern_name' to `a_name' and `class_diagram_file_name' to `a_file_name'.
			-- Set `text' to `a_text'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_file_name_not_void: a_file_name /= Void
			a_file_name_not_empty: not a_file_name.is_empty
			file_exists: file_exists (a_file_name)
			a_text_not_void: a_text /= Void
			no_carriage_return: not a_text.has ('%R')
		do
			pattern_name := a_name
			class_diagram_file_name := a_file_name
			make_with_text (a_text)
		ensure
			pattern_name_set: pattern_name = a_name
			class_diagram_file_name_set: class_diagram_file_name = a_file_name
			text_cloned: text.is_equal (a_text) and text /= a_text
		end

	initialize
			-- Initialize GUI components and build the frame.
		do
			Precursor {EV_FRAME}
			initialize_pattern_components
			align_text_center
			create class_diagram_bar.make (pattern_name, class_diagram_file_name)
			create pattern_vbox
			build
		end

	initialize_pattern_components
			-- Initialize GUI components that are pattern-specific.
		deferred
		end

	build
			-- Build the frame.
		local
			vbox: EV_VERTICAL_BOX
		do
			create vbox
			vbox.extend (create {EV_CELL})

			class_diagram_bar.set_minimum_width ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (window_width - 4 * margin))
			class_diagram_bar.set_minimum_height ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (button_height))
			vbox.extend (class_diagram_bar)
			vbox.disable_item_expand (class_diagram_bar)

			vbox.extend (create {EV_CELL})

			pattern_vbox.set_minimum_width ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (window_width - 4 * margin))
			build_pattern_vbox
			vbox.extend (pattern_vbox)
			vbox.disable_item_expand (pattern_vbox)

			extend (vbox)
		end

	build_pattern_vbox
			-- Build `pattern_vbox'.
		deferred
		end

feature -- Access

	pattern_name: STRING_32
			-- Name of the pattern

	class_diagram_file_name: STRING_32
			-- File name of class diagram corresponding to
			-- pattern with name `pattern_name'

feature -- Status report

	is_in_default_state: BOOLEAN
			-- Is pattern selector in default state?
		do
			Result := (
						is_center_aligned and
						class_diagram_bar /= Void and
						pattern_vbox /= Void
					)
		end

feature {NONE} -- Implementation (GUI components)

	class_diagram_bar: PW_CLASS_DIAGRAM_BAR
			-- Horizontal box with the pattern name and a button giving access
			-- to the class diagram of a typical application using this pattern

	pattern_vbox: EV_VERTICAL_BOX
			-- Vertical box containing the specific GUI components for each pattern

invariant

	pattern_name_not_void: pattern_name /= Void
	pattern_name_not_empty: not pattern_name.is_empty
	class_diagram_file_name_not_void: class_diagram_file_name /= Void
	class_diagram_file_name_not_empty: not class_diagram_file_name.is_empty
	class_diagram_file_exists: file_exists (class_diagram_file_name)
	class_diagram_bar_not_void: class_diagram_bar /= Void
	pattern_vbox_not_void: pattern_vbox /= Void
	is_center_aligned: is_center_aligned

end
