indexing

	description:
		"[
			Dialog showing the class diagram of a typical application
			using a certain design pattern
		]"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_CLASS_DIAGRAM_DIALOG

inherit

	EV_DIALOG
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
		export
			{NONE} all
		undefine
			default_create, copy
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like pattern_name; a_file_name: like class_diagram_file_name) is
			-- Set `pattern_name' to `a_name' and 
			-- `class_diagram_file_name' to `a_file_name'.
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

	initialize is
			-- Initialize GUI components.
		local
			pw_icon_pixmap: EV_PIXMAP
			application: PATTERN_WIZARD
		do
			Precursor {EV_DIALOG}
			create class_diagram_pixmap
			create ok_button.make_with_text_and_action (ok_button_text, agent close_window)

			set_title (class_diagram_dialog_title + pattern_name)
			create pw_icon_pixmap
			pw_icon_pixmap.set_with_named_file (pattern_delivery_directory + pw_icon_pixmap_file_name)
			set_icon_pixmap (pw_icon_pixmap)
		   
			build
			set_size (class_diagram_pixmap.width + 2 * margin, class_diagram_pixmap.height + button_height + 8 * margin)
			set_default_push_button (ok_button)
			set_default_cancel_button (ok_button)
			close_request_actions.extend (agent close_window)

			application ?= (create {EV_ENVIRONMENT}).application
			if application /= Void then
				show_modal_to_window (application.initial_window)
			end
		end

	build is
			-- Build interface.
		local
			vbox: EV_VERTICAL_BOX
			h_separator: EV_HORIZONTAL_SEPARATOR
			hbox: EV_HORIZONTAL_BOX
			c: EV_CELL
		do
			create vbox
			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)
			class_diagram_pixmap.set_with_named_file (class_diagram_file_name)
			vbox.extend (class_diagram_pixmap)
			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)
			create h_separator
			vbox.extend (h_separator)
			vbox.disable_item_expand (h_separator)
			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)
			create hbox
			hbox.extend (create {EV_CELL})
			ok_button.align_text_center
			ok_button.set_minimum_width (button_width)
			ok_button.set_minimum_height (button_height)
			hbox.extend (ok_button)
			hbox.disable_item_expand (ok_button)
			hbox.extend (create {EV_CELL})
			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)
			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)
			extend (vbox)
		end

feature -- Status report

	is_in_default_state: BOOLEAN is
			-- Is the window in its default state
			-- (as stated in `initialize')
		do
			Result := (
						ok_button /= Void and
						ok_button.is_center_aligned and
						class_diagram_pixmap /= Void
					)
		end

feature -- Access

	pattern_name: STRING
			-- Name of the pattern corresponding to the class diagram to display

	class_diagram_file_name: STRING
			-- File name of the pixmap corresponding to the class diagram to display

feature -- Event handling

	close_window is
			-- Close window.
			-- (Action performed when the user clicks on the cross in the title bar.)
		do
			destroy
		end

feature {NONE} -- Implementation

	class_diagram_pixmap: EV_PIXMAP
			-- Pixmap with class diagram corresponding to pattern with name
			-- `pattern_name' and located at `class_diagram_file_name'

	ok_button: EV_BUTTON
			-- Button enabling the user to close the dialog

invariant

	pattern_name_not_void: pattern_name /= Void
	pattern_name_not_empty: not pattern_name.is_empty
	class_diagram_file_name_not_void: class_diagram_file_name /= Void
	class_diagram_file_name_not_empty: not class_diagram_file_name.is_empty
	class_diagram_file_exists: file_exists (class_diagram_file_name)
	ok_button_not_void: ok_button /= Void
	ok_button_text_center_aligned: ok_button.is_center_aligned
	class_diagram_pixmap_not_void: class_diagram_pixmap /= Void

end
