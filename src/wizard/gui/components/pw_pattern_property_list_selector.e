note

	description:
		"[
			Frame where the user can select some pattern properties:
			a class name, a class location, possibly one or two feature
			names, and a list of implementation features
		]"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_PATTERN_PROPERTY_LIST_SELECTOR

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
	make_with_info_and_text

feature {NONE} -- Initialization

	make (label_1: like feature_label_text; label_2: like feature_list_label_text) is
			-- Set `feature_label_text' to `label_1' and `feature_list_label_text' to `label_2'.
		require
			label_1_not_empty_if_not_void: label_1 /= Void implies not label_1.is_empty
			label_2_not_void: label_2 /= Void
			label_2_not_empty: not label_2.is_empty
		do
			feature_label_text := label_1
			feature_list_label_text := label_2
			default_create
		ensure
			feature_label_text_set: feature_label_text = label_1
			feature_list_label_text_set: feature_list_label_text = label_2
		end

	make_with_info_and_text (label_1: like feature_label_text; label_2: like feature_list_label_text; a_text: like text) is
			-- Set `feature_label_text' to `label_1' and `feature_list_label_text' to `label_2'.
			-- Set `text' to `a_text'.
		require
			label_1_not_empty_if_not_void: label_1 /= Void implies not label_1.is_empty
			label_2_not_void: label_2 /= Void
			label_2_not_empty: not label_2.is_empty
			a_text_not_void: a_text /= Void
			no_carriage_return: not a_text.has ('%R')
		do
			feature_label_text := label_1
			feature_list_label_text := label_2
			make_with_text (a_text)
		ensure
			feature_label_text_set: feature_label_text = label_1
			feature_list_label_text_set: feature_list_label_text = label_2
			text_cloned: text.is_equal (a_text) and text /= a_text
		end

	initialize is
			-- Initialize GUI components and build the frame.
		do
			Precursor {EV_FRAME}
			create class_name_selector.make (class_name_label_text)
			if feature_label_text /= Void then
				create feature_name_selector.make (feature_label_text)
			end
			create name_list_selector.make (feature_list_label_text)
			align_text_center
			build
		end

	build is
			-- Build the frame.
		local
			vbox: EV_VERTICAL_BOX
			c: EV_CELL
		do
			set_minimum_width (window_width - 4 * margin)
			create vbox

				-- Class name selector
			class_name_selector.set_minimum_width (window_width - 6 * margin)
			vbox.extend (class_name_selector)
			vbox.disable_item_expand (class_name_selector)
			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

				-- Selector of feature's name (if any feature)
			if feature_label_text /= Void then
				vbox.extend (feature_name_selector)
				vbox.disable_item_expand (feature_name_selector)
				create c
				c.set_minimum_height (margin)
				vbox.extend (c)
				vbox.disable_item_expand (c)
			end

				-- Selector of implementation features' name
			name_list_selector.set_minimum_width (window_width - 6 * margin)
			vbox.extend (name_list_selector)
			vbox.disable_item_expand (name_list_selector)
			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			extend (vbox)
		end

feature -- Access

	feature_label_text: STRING
			-- Text of label appearing in the feature name selector

	feature_list_label_text: STRING
			-- Text of label appearing above the name list selector

feature -- Status report

	is_in_default_state: BOOLEAN is
			-- Is basic pattern property selector in default state?
		do
			Result := (
						is_center_aligned and
						class_name_selector /= Void and
						name_list_selector /= Void
					)
		end

feature -- Status setting

	set_default_class_name (a_name: STRING) is
			-- Set default class name of `class_name_selector' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			class_name_selector.set_default_name (a_name)
		end

	set_default_feature_name (a_name: STRING) is
			-- Set default name of `feature_name_selector' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			feature_name_selector.set_default_name (a_name)
		end

	set_default_feature_names (a_list: LINKED_LIST [STRING]) is
			-- Add `a_list' of names to `name_list_selector'.
		require
			a_list_not_void: a_list /= Void
			no_void_name: not a_list.has (Void)
		do
			name_list_selector.add_names (a_list)
		end

feature {PW_PATTERN_PROPERTY_SELECTOR} -- Implementation (GUI components)

	class_name_selector: PW_NAME_SELECTOR
			-- Label and text field enabling the user to select
			-- a class name

	feature_name_selector: PW_NAME_SELECTOR
			-- Label and text field enabling the user to select the
			-- name of a feature

	name_list_selector: PW_NAME_LIST_SELECTOR
			-- Text field and associated list of selected names enabling
			-- the user to add/remove implementation feature names

invariant

	is_center_aligned: is_center_aligned
	class_name_selector_not_void: class_name_selector /= Void
	feature_name_selector_not_void_if_label_not_void: feature_label_text /= Void implies feature_name_selector /= Void
	name_list_selector_not_void: name_list_selector /= Void

end
