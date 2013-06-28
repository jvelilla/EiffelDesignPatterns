indexing

	description:

		"Dialog giving some information about the Eiffel Pattern Wizard"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_ABOUT_DIALOG

inherit

	EV_DIALOG
		redefine
			initialize
		end

	PW_INTERFACE_NAMES
		export
			{NONE} all
		undefine
			default_create, copy
		end

	PW_SUPPORT
		export
			{NONE} all
		undefine
			default_create, copy
		end

create

	default_create

feature {NONE} -- Initialization

	initialize is
			-- Initialize GUI components and build the dialog.
		local
			pw_icon_pixmap: EV_PIXMAP
		do
			Precursor {EV_DIALOG}
			create pw_pixmap
			create text_label.make_with_text (about_dialog_text)
			create ok_button.make_with_text_and_action (ok_button_text, agent close_dialog)
			set_title (window_title)
			set_size (about_dialog_width, about_dialog_height)
			create pw_icon_pixmap
			pw_icon_pixmap.set_with_named_file (pattern_delivery_directory + pw_icon_pixmap_file_name)
			set_icon_pixmap (pw_icon_pixmap)
			build
		end

	build is
			-- Build dialog.
		local
			hbox: EV_HORIZONTAL_BOX
			vbox, vb: EV_VERTICAL_BOX
			c: EV_CELL
			h_separator: EV_HORIZONTAL_SEPARATOR
		do
			create white_color.make_with_8_bit_rgb (255, 255, 255)

			create vbox
			create c
			c.set_background_color (white_color)
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			create hbox
			create c
			c.set_background_color (white_color)
			c.set_minimum_width (margin)
			hbox.extend (c)
			hbox.disable_item_expand (c)

			pw_pixmap.set_with_named_file (pattern_delivery_directory + pw_pixmap_file_name)
			hbox.extend (pw_pixmap)

			create c
			c.set_background_color (white_color)
			c.set_minimum_width (margin)
			hbox.extend (c)
			hbox.disable_item_expand (c)

			text_label.align_text_left
			text_label.set_background_color (white_color)
			hbox.extend (text_label)
			hbox.disable_item_expand (text_label)
			create c
			c.set_background_color (white_color)
			c.set_minimum_width (margin)
			hbox.extend (c)
			hbox.disable_item_expand (c)
			vbox.extend (hbox)

			create c
			c.set_background_color (white_color)
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			create h_separator
			vbox.extend (h_separator)
			vbox.disable_item_expand (h_separator)
			
			create vb
			create c
			c.set_minimum_height (margin)
			vb.extend (c)
			vb.disable_item_expand (c)

			create hbox
			hbox.extend (create {EV_CELL})
			ok_button.align_text_center
			ok_button.set_minimum_width (button_width)
			ok_button.set_minimum_height (button_height)
			hbox.extend (ok_button)
			hbox.disable_item_expand (ok_button)
			create c
			c.set_minimum_width (margin)
			hbox.extend (c)
			hbox.disable_item_expand (c)
			vb.extend (hbox)
			vb.disable_item_expand (hbox)

			create c
			c.set_minimum_height (margin)
			vb.extend (c)
			vb.disable_item_expand (c)

			vbox.extend (vb)
			vbox.disable_item_expand (vb)

			extend (vbox)
		end

feature {NONE} -- Event handling

	close_dialog is
			-- Close dialog.
		do
			destroy
		end

feature -- Implementation (GUI components)

	pw_pixmap: EV_PIXMAP
			-- Pixmap on the left side of the dialog

	text_label: EV_LABEL
			-- Label with dialog message

	ok_button: EV_BUTTON
			-- Button with label "ok" enabling the user to close the dialog

	white_color: EV_COLOR
			-- White color

invariant

	pw_pixmap_not_void: pw_pixmap /= Void
	text_label_not_void: text_label /= Void
	text_not_void: text_label.text /= Void
	text_not_empty: not text_label.text.is_empty
	text_aligned_left: text_label.is_left_aligned
	ok_button_not_void: ok_button /= Void
	ok_button_text_center_aligned: ok_button.is_center_aligned

end
