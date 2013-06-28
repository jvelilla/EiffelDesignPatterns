indexing

	description:

		"Vertical box enabling the user to enter a list of names"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_NAME_LIST_SELECTOR

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
		
create

	make

feature {NONE} -- Initialization

	make (a_label_text: like label_text) is
			-- Set `label_text' to `a_label_text'.
		require
			a_label_text_not_void: a_label_text /= Void
			a_label_text_not_empty: not a_label_text.is_empty
		do
			label_text := a_label_text
			default_create
		ensure
			label_text_set: label_text = a_label_text
		end

	initialize is
			-- Initialize GUI components and build vertical box.
		do 
			Precursor {EV_VERTICAL_BOX}
			create label.make_with_text (label_text)
			create input_text_field
			create add_button.make_with_text_and_action (add_button_text, agent add_name)
			create remove_button.make_with_text_and_action (remove_button_text, agent remove_name)
			create name_list
			build
		end

	build is
			-- Build frame.
		local
			hbox: EV_HORIZONTAL_BOX
			c: EV_CELL
		do
			create hbox
			create c
			c.set_minimum_width (margin)
			hbox.extend (c)
			hbox.disable_item_expand (c)
			label.align_text_left
			label.set_minimum_height (text_field_height)
			hbox.extend (label)
			hbox.disable_item_expand (label)
			extend (hbox)
			disable_item_expand (hbox)

			create hbox
			create c
			c.set_minimum_width (margin)
			hbox.extend (c)
			hbox.disable_item_expand (c)
			input_text_field.set_minimum_height (text_field_height)
			hbox.extend (input_text_field)
			create c
			c.set_minimum_width (margin)
			hbox.extend (c)
			hbox.disable_item_expand (c)
			add_button.align_text_center
			add_button.set_minimum_width (button_width)
			add_button.set_minimum_height (button_height)
			hbox.extend (add_button)
			hbox.disable_item_expand (add_button)
			create c
			c.set_minimum_width (margin)
			hbox.extend (c)
			hbox.disable_item_expand (c)
			remove_button.align_text_center
			remove_button.set_minimum_width (button_width)
			remove_button.set_minimum_height (button_height)
			hbox.extend (remove_button)
			hbox.disable_item_expand (remove_button)
			create c
			c.set_minimum_width (margin)
			hbox.extend (c)
			hbox.disable_item_expand (c)
			extend (hbox)
			disable_item_expand (hbox)

			create c
			c.set_minimum_height (margin)
			extend (c)
			disable_item_expand (c)

			create hbox
			create c
			c.set_minimum_width (margin)
			hbox.extend (c)
			hbox.disable_item_expand (c)
			name_list.set_minimum_height (name_list_height)
			name_list.disable_multiple_selection
			hbox.extend (name_list)
			create c
			c.set_minimum_width (margin)
			hbox.extend (c)
			hbox.disable_item_expand (c)

			extend (hbox)
			disable_item_expand (hbox)
		end

feature -- Access

	label_text: STRING
			-- Text on `label'

	input_text: STRING is
			-- Text of `input_text_field'
		do
			Result := input_text_field.text
		end

	names: LINKED_LIST [STRING] is
			-- Names in the list
		do
			Result := name_list.strings
		end

feature -- Status report

	is_in_default_state: BOOLEAN is
			-- Is name list selector in default state?
		do
			Result := (
						label /= Void and
						label.is_left_aligned and
						input_text_field /= Void and
						add_button /= Void and
						add_button.is_center_aligned and
						remove_button /= Void and
						remove_button.is_center_aligned and
						name_list /= Void
					)
		end

	name_in_list (a_name: STRING): BOOLEAN is
			-- Is `a_name' in `name_list'?
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		local
			strings: LINKED_LIST [STRING]
		do
			strings := name_list.strings
			from strings.start until Result or strings.after loop
				Result := strings.item.as_lower.is_equal (a_name.as_lower)
				strings.forth
			end
		end

	selected_item: EV_LIST_ITEM is
			-- Selected items in `name_list' if any.
		do
			Result := name_list.selected_item
		end
		
feature -- Element change

	add_names (a_list: LINKED_LIST [STRING]) is
			-- Add `a_list' of names to `name_list'.
		require
			a_list_not_void: a_list /= Void
			no_void_name: not a_list.has (Void)
		do
			from a_list.start until a_list.after loop
				name_list.extend (create {EV_LIST_ITEM}.make_with_text (a_list.item))
				a_list.forth
			end
		ensure
			names_added: name_list.count = old name_list.count + a_list.count
		end

feature -- Event handling

	add_name is
			-- Add `input_text_field.text' to `name_list'.
		require
			input_text_not_void: input_text /= Void
			input_text_not_empty: not input_text.is_empty
		local
			warning_dialog: EV_WARNING_DIALOG
			pw_icon_pixmap: EV_PIXMAP
			application: PATTERN_WIZARD
		do
			if not name_in_list (input_text) then
				name_list.extend (create {EV_LIST_ITEM}.make_with_text (input_text))
				input_text_field.remove_text
			else
				create warning_dialog.make_with_text (name_already_in_list_warning_text)
				create pw_icon_pixmap
				pw_icon_pixmap.set_with_named_file (pattern_delivery_directory + pw_icon_pixmap_file_name)
				warning_dialog.set_icon_pixmap (pw_icon_pixmap)
				application ?= (create {EV_ENVIRONMENT}).application
				if application /= Void then
					warning_dialog.show_modal_to_window (application.initial_window)
				end
				input_text_field.remove_text
			end
		end

	remove_name is
			-- Remove `input_text_field.text' from `name_list'.
		require
			something_to_remove: (input_text /= Void and then not input_text.is_empty) or else selected_item /= Void
		do
			if input_text /= Void and then not input_text.is_empty then
				search_name (input_text)
				check
					name_list_not_off: name_list_index /= name_list.count
				end
				name_list.go_i_th (name_list_index)
				name_list.remove
				input_text_field.remove_text
			elseif selected_item /= Void then
				name_list.prune (selected_item)
			end
		ensure
			name_removed: name_list.count = old name_list.count - 1
		end

feature {NONE} -- Implementation (GUI components)

	label: EV_LABEL
			-- Label with `label_text'
			
	input_text_field: EV_TEXT_FIELD
			-- Field to enter a name

	add_button: EV_BUTTON
			-- Button to add typed name into the `name_list'

	remove_button: EV_BUTTON
			-- Button to remove name from the `name_list'

	name_list: EV_LIST
			-- List of registered names

feature {NONE} -- Implementation

	search_name (a_name: STRING) is
			-- Search `a_name' in `name_list'.
			-- If found: stay at found position; otherwise `name_list' is `off'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		local
			strings: LINKED_LIST [STRING]
		do
			strings := name_list.strings
			from strings.start until strings.item.as_lower.is_equal (a_name.as_lower) or strings.after loop
				strings.forth
			end
			name_list_index := strings.index
		end

	name_list_index: INTEGER
			-- Index of `name_list' after calling `search_name'
			-- (i.e. index of found element or off)

invariant

	label_text_not_void: label_text /= Void
	label_text_not_empty: not label_text.is_empty
	label_not_void: label /= Void
	label_text_left_aligned: label.is_left_aligned
	input_text_field_not_void: input_text_field /= Void
	add_button_not_void: add_button /= Void
	add_button_text_center_aligned: add_button.is_center_aligned
	remove_button_not_void: remove_button /= Void
	remove_button_text_center_aligned: remove_button.is_center_aligned
	name_list_not_void: name_list /= Void

end
