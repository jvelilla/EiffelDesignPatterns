note

	description:

		"Frame enabling user to select the project directory"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_PROJECT_DIRECTORY_SELECTOR

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

create

	default_create,
	make_with_text

feature {NONE} -- Initialization

	initialize
			-- Initialize GUI components and build frame.
		do
			Precursor {EV_FRAME}
			create directory_selector
			create description_label.make_with_text (project_location_selector_description)
			align_text_center
			build
		end

	build
			-- Build frame.
		local
			vbox: EV_VERTICAL_BOX
			hbox: EV_HORIZONTAL_BOX
			c: EV_CELL
		do
			create vbox
			vbox.extend (create {EV_CELL})

			if not (create {DIRECTORY}.make (project_default_location)).exists then
				(create {DIRECTORY}.make (project_default_location)).create_dir
			end
			directory_selector.set_default_location (project_default_location)
			directory_selector.set_minimum_width ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (window_width - 3 * margin))
			directory_selector.set_minimum_height ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (project_location_selector_height - location_description_height - 2 * margin))
			vbox.extend (directory_selector)
			vbox.disable_item_expand (directory_selector)

			create hbox
			create c
			c.set_minimum_width ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (margin))
			hbox.extend (c)
			hbox.disable_item_expand (c)
			description_label.align_text_left
			description_label.set_minimum_width ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (window_width - button_width - 5 * margin))
			description_label.set_minimum_height ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (location_description_height))
			hbox.extend (description_label)
			hbox.disable_item_expand (description_label)
			create c
			c.set_minimum_width ((margin))
			hbox.extend (c)
			hbox.disable_item_expand (c)
			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)

			vbox.extend (create {EV_CELL})
			extend (vbox)
		end

feature -- Access

	project_directory: STRING_32
			-- Path of chosen project directory
		do
			Result := directory_selector.location_text_field.text
		ensure
			project_directory_path_not_void: Result /= Void
			definition: Result.is_equal (directory_selector.location_text_field.text)
		end

feature -- Status report

	is_in_default_state: BOOLEAN is
			-- Is project directory selector in default state?
		do
			Result := (
						is_center_aligned and
						directory_selector /= Void and
						description_label /= Void and
						description_label.is_left_aligned
					)
		end

feature -- Element change

	remove_location_text is
			-- Remove text of text field of `directory_selector'.
		do
			directory_selector.remove_location_text
		ensure
			project_directory_path_not_void: directory_selector.location_text_field.text /= Void
			project_directory_path_is_empty: directory_selector.location_text_field.text.is_empty
		end

feature {NONE} -- Implementation (GUI components)

	directory_selector: PW_DIRECTORY_SELECTOR
			-- Box with text field and browse button enabling the user
			-- to select a directory path

	description_label: EV_LABEL
			-- Label describing what the project directory is for

invariant

	is_center_aligned: is_center_aligned
	directory_selector_not_void: directory_selector /= Void
	description_label: description_label /= Void
	description_label_text_left_aligned: description_label.is_left_aligned

end
