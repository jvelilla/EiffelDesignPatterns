note

	description:

		"Horizontal box with text field where the user can enter a name"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_NAME_SELECTOR

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

create

	make

feature {NONE} -- Initialization

	make (a_label_name: like label_name)
			-- Set `label_name' to `a_label_name'.
		require
			a_label_name_not_void: a_label_name /= Void
			a_label_name_not_empty: not a_label_name.is_empty
		do
			label_name := a_label_name
			default_create
		end

	initialize
			-- Initialize `name_label' and `name_text_field' and build the horizontal box.
		do
			Precursor {EV_HORIZONTAL_BOX}
			create name_label.make_with_text (label_name)
			create name_text_field
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

			name_label.align_text_left
			extend (name_label)

			extend (create {EV_CELL})

			name_text_field.set_minimum_width ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (text_field_width))
			name_text_field.set_minimum_height ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (text_field_height))
			extend (name_text_field)
			disable_item_expand (name_text_field)

			create c
			c.set_minimum_width ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (margin))
			extend (c)
			disable_item_expand (c)
		end

feature -- Access

	label_name: STRING_32
			-- Name of label in front of the `label_text_field'

	name_text: STRING_32
			-- Text of `name_text_field'
		do
			Result := name_text_field.text
		ensure
			definition: Result.is_equal (name_text_field.text)
		end

feature -- Status report

	is_in_default_state: BOOLEAN
			-- Is name selector in default state?
		do
			Result := (
						name_label /= Void and
						name_text_field /= Void and
						name_label.is_left_aligned
					)
		end

feature -- Status setting

	set_default_name (a_name: STRING_32)
			-- Set `name_text_field.text' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			name_text_field.set_text (a_name)
		ensure
			name_text_not_void: name_text_field.text /= Void
			name_text_set: name_text_field.text.is_equal (a_name)
		end

feature -- Element change

	enable_name_selector_sensitive
			-- Make `name_label' and `name_text_field' sensitive to user input.
		do
			name_label.enable_sensitive
			name_text_field.enable_sensitive
		ensure
			name_label_is_sensitive: name_label.is_sensitive
			name_text_field_is_sensitive: name_text_field.is_sensitive
		end

	disable_name_selector_sensitive
			-- Make `name_label' and `name_text_field' unsensitive to user input.
		do
			name_label.disable_sensitive
			name_text_field.disable_sensitive
		ensure
			name_label_not_sensitive: not name_label.is_sensitive
			name_text_field_not_sensitive: not name_text_field.is_sensitive
		end

feature {NONE} -- Implementation (GUI components)

	name_label: EV_LABEL
			-- Label with `name'

	name_text_field: EV_TEXT_FIELD
			-- Text field where user can enter a string value

invariant

	label_name_not_void: label_name /= Void
	label_name_not_empty: not label_name.is_empty
	name_label_not_void: name_label /= Void
	name_text_field_not_void: name_text_field /= Void
	name_label_text_aligned_left: name_label.is_left_aligned

end
