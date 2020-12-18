note

	description:

		"Frame with the pattern name and a description (e.g. intent, applicability)"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_PATTERN_DESCRIPTOR

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

	make,
	make_with_descriptor_and_text

feature {NONE} -- Initialization

	make (a_name: like name; a_description: like description)
			-- Initialize descriptor and set `name' to `a_name'
			-- and `description' to `a_description'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_description_not_void: a_description /= Void
			a_description_not_empty: not a_description.is_empty
		do
			default_create
			name := a_name
			description := a_description
		ensure
			name_set: name = a_name
			description_set: description = a_description
		end

	make_with_descriptor_and_text (a_name: like name; a_description: like description; a_text: like text)
			-- Initialize descriptor and set `name' to `a_name'
			-- and `description' to `a_description' and `text' to `a_text'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_description_not_void: a_description /= Void
			a_description_not_empty: not a_description.is_empty
			a_text_not_void: a_text /= void
			no_carriage_return: not a_text.has ('%R')
		do
			name := a_name
			description := a_description
			make_with_text (a_text)
		ensure
			name_set: name = a_name
			description_set: description = a_description
			text_cloned: text.is_equal (a_text) and text /= a_text
		end

	initialize
			-- Initialize `text_field' and build frame.
		do
			Precursor {EV_FRAME}
			create text_field
			align_text_center
			build
		end

	build
			-- Build `text_field' from `name' and `description'.
		local
			vbox: EV_VERTICAL_BOX
			hbox: EV_HORIZONTAL_BOX
		do
			create vbox
			vbox.extend (create {EV_CELL})

			create hbox
			hbox.extend (create {EV_CELL})

			text_field.set_background_color (create {EV_COLOR}.make_with_8_bit_rgb (255, 255, 255))
			text_field.set_text (name + ":%N" + description)
			text_field.disable_edit
			text_field.set_minimum_width ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (window_width - 4 * margin))
			text_field.set_minimum_height ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (descriptor_text_field_height - 2 * margin))

			hbox.extend (text_field)
			hbox.disable_item_expand (text_field)
			hbox.extend (create {EV_CELL})

			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)
			vbox.extend (create {EV_CELL})
			extend (vbox)
		end

feature -- Access

	name: STRING_32
			-- Pattern name

	description: STRING_32
			-- Pattern description

feature -- Status report

	is_in_default_state: BOOLEAN
			-- Is pattern descriptor in default state?
		do
			Result := is_center_aligned
		end

feature {NONE} -- Implementation (GUI components)

	text_field: EV_TEXT
			-- Text field where the pattern's `name' and `description' appear

invariant

	name_not_void: name /= Void
	name_not_empty: not name.is_empty
	description_not_void: description /= Void
	description_not_empty: not description.is_empty
	is_center_aligned: is_center_aligned
	text_field_not_void: text_field /= Void
	text_field_not_editable: not text_field.is_editable

end
