indexing

	description:
		"[
			Horizontal box with text field and 'Browse...' button
			enabling the user to select a directory
		]"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_DIRECTORY_SELECTOR

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
		undefine
			is_equal, default_create, copy
		end
   
create

	default_create

feature {NONE} -- Initialization

	initialize is
			-- Initialize GUI components and build horizontal box.
		do 
			Precursor {EV_HORIZONTAL_BOX}
			create location_text_field
			create browse_button.make_with_text (browse_button_text)
			build
			browse_button.select_actions.extend (agent open_file_dialog)
		end

	build is
			-- Build frame.
		local
			c: EV_CELL
		do
			create c
			c.set_minimum_width (margin)
			extend (c)
			disable_item_expand (c)

			location_text_field.set_background_color (create {EV_COLOR}.make_with_8_bit_rgb (255, 255, 255))
			extend (location_text_field)

			create c
			c.set_minimum_width (margin)
			extend (c)
			disable_item_expand (c)

			browse_button.align_text_center
			browse_button.set_minimum_width (button_width)
			browse_button.set_minimum_height (button_height)
			extend (browse_button)
			disable_item_expand (browse_button)

			create c
			c.set_minimum_width (margin)
			extend (c)
			disable_item_expand (c)
		end

feature -- Status report

	is_in_default_state: BOOLEAN is
			-- Is directory selector in default state?
		do
			Result := (
						location_text_field /= Void and
						browse_button /= Void and
						browse_button.is_center_aligned
					)
		end

feature -- Status setting

	set_default_location (a_path: STRING) is
			-- Set `location_text_field.text' to `a_path'.
		require
			a_path_not_void: a_path /= Void
			a_path_not_empty: not a_path.is_empty
			a_path_exists: directory_exists (a_path)
		do
			location_text_field.set_text (a_path)
		ensure
			location_text_not_void: location_text_field.text /= Void
			location_text_set: location_text_field.text.is_equal (a_path)
		end

feature -- Element change

	remove_location_text is
			-- Remove text of `location_text_field'.
		do
			location_text_field.remove_text
		ensure
			location_text_not_void: location_text_field.text /= Void
			location_text_is_empty: location_text_field.text.is_empty
		end

feature -- Event handling

	open_file_dialog is
			-- Open dialog to choose a directory.
		local
			application: PATTERN_WIZARD
		do
			create directory_dialog.make_with_title (directory_dialog_text)
			if location_text_field.text /= Void then
				directory_dialog.set_start_directory (location_text_field.text)
			end
			directory_dialog.ok_actions.extend (agent set_directory_path)

			application ?= (create {EV_ENVIRONMENT}).application
			if application /= Void then
				directory_dialog.show_modal_to_window (application.initial_window)
			end
		end

	set_directory_path is
			-- Set `location_text_field.text' to the directory chosen by the user.
		do
			location_text_field.set_text (clone (directory_dialog.directory))
		ensure
			location_text_not_void: location_text_field.text /= Void
			location_text_set: location_text_field.text.is_equal (directory_dialog.directory)
		end

feature {PW_PROJECT_DIRECTORY_SELECTOR} -- Implementation (GUI components)

	location_text_field: EV_TEXT_FIELD
			-- Field with the chosen location path

	browse_button: EV_BUTTON
			-- Button to open an open file dialog (to select a location path)

	directory_dialog: EV_DIRECTORY_DIALOG
			-- Dialog enabling the user to choose a directory

invariant

	location_text_field_not_void: location_text_field /= Void
	browse_button_not_void: browse_button /= Void
	browse_button_text_center_aligned: browse_button.is_center_aligned

end
