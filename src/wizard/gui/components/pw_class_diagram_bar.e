note

	description:
		"[
			Horizontal box with the pattern name and a button giving access to 
			the class diagram of a typical application using this pattern
		]"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_CLASS_DIAGRAM_BAR

inherit

	EV_HORIZONTAL_BOX
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
		export
			{NONE} all
		undefine
			is_equal, default_create, copy
		end

create

	make

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
			class_diagram_file_name: class_diagram_file_name = a_file_name
		end

	initialize
			-- Initialize `pattern_name_label' and `class_diagram_button'
			-- and build horizontal box.
		do
			Precursor {EV_HORIZONTAL_BOX}
			create pattern_name_label.make_with_text ("Pattern: " + pattern_name)
			create class_diagram_button.make_with_text_and_action (class_diagram_button_text, agent show_class_diagram)
			build
		end

	build
			-- Build horizontal box.
		local
			c: EV_CELL
		do
			create c
			c.set_minimum_width ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (margin))
			extend (c)
			disable_item_expand (c)

			pattern_name_label.align_text_left
			extend (pattern_name_label)
			disable_item_expand (pattern_name_label)

			extend (create {EV_CELL})

			class_diagram_button.align_text_center
			class_diagram_button.set_minimum_width ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (button_width))
			class_diagram_button.set_minimum_height ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (button_height))
			extend (class_diagram_button)
			disable_item_expand (class_diagram_button)

			create c
			c.set_minimum_width ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (margin))
			extend (c)
			disable_item_expand (c)
		end

feature -- Access

	pattern_name: STRING
			-- Pattern name

	class_diagram_file_name: STRING
			-- File name of class diagram corresponding to
			-- pattern with name `pattern_name'

feature -- Status report

	is_in_default_state: BOOLEAN
			-- Is pattern descriptor in default state?
		do
			Result := (
						pattern_name_label /= Void and
						pattern_name_label.is_left_aligned and
						class_diagram_button /= Void and
						class_diagram_button.is_center_aligned
					)
		end

feature -- Event handling

	show_class_diagram
			-- Show the class diagram of a typical application
			-- using the design pattern.
			-- (Action performed when the user clicks `class_diagram_button')
		local
			class_diagram_dialog: PW_CLASS_DIAGRAM_DIALOG
		do
			create class_diagram_dialog.make (pattern_name, class_diagram_file_name)
		end

feature {NONE} -- Implementation (GUI components)

	pattern_name_label: EV_LABEL
			-- Label with pattern name

	class_diagram_button: EV_BUTTON
			-- Button giving access to the class diagram of
			-- a typical application using this pattern

invariant

	pattern_name_not_void: pattern_name /= Void
	pattern_name_not_empty: not pattern_name.is_empty
	class_diagram_file_name_not_void: class_diagram_file_name /= Void
	class_diagram_file_name_not_empty: not class_diagram_file_name.is_empty
	class_diagram_file_exists: file_exists (class_diagram_file_name)
	pattern_name_label_not_void: pattern_name_label /= Void
	pattern_name_label_text_left_aligned: pattern_name_label.is_left_aligned
	class_diagram_button_not_void: class_diagram_button /= Void
	class_button_text_center_aligned: class_diagram_button.is_center_aligned

end
