note

	description:

		"Frame where the user can select the Adapter pattern properties"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class PW_ADAPTER_PROPERTY_SELECTOR

inherit

	PW_PATTERN_PROPERTY_SELECTOR
		redefine
			is_in_default_state
		end

feature {NONE} -- Initialization

	initialize_pattern_components is
			-- Initialize GUI components that are pattern-specific.
		do
			create notebook
			create target_frame.make_with_info_and_text (feature_name_label_text, Void, adapter_target_class_text)
			create adaptee_frame.make_with_info_and_text (feature_name_label_text, Void, adapter_adaptee_class_text)
		end

	build_pattern_vbox is
			-- Build `pattern_vbox'.
		local
			hbox: EV_HORIZONTAL_BOX
			vbox: EV_VERTICAL_BOX
			c: EV_CELL
		do
			notebook.position_tabs_top

				-- First tab: Target class properties
			create vbox
			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			create hbox
			hbox.set_minimum_width (window_width - 4 * margin)
			hbox.extend (create {EV_CELL})
			target_frame.set_default_class_name (default_adapter_target_class_name)
			target_frame.set_default_feature_1_name (default_adapter_target_feature_name)
			hbox.extend (target_frame)
			hbox.disable_item_expand (target_frame)
			hbox.extend (create {EV_CELL})
			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)

			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			notebook.extend (vbox)
			notebook.set_item_text (vbox, adapter_target_text)

				-- Second tab: Adaptee class properties
			create vbox
			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			create hbox
			hbox.set_minimum_width (window_width - 4 * margin)
			hbox.extend (create {EV_CELL})
			adaptee_frame.set_default_class_name (default_adapter_adaptee_class_name)
			adaptee_frame.set_default_feature_1_name (default_adapter_adaptee_feature_name)
			hbox.extend (adaptee_frame)
			hbox.disable_item_expand (adaptee_frame)
			hbox.extend (create {EV_CELL})
			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)

			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			notebook.extend (vbox)
			notebook.set_item_text (vbox, adapter_adaptee_text)

				-- Third tab: Adapter class properties
			create vbox
			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			create hbox
			hbox.set_minimum_width (window_width - 4 * margin)
			hbox.extend (create {EV_CELL})
			adapter_frame.set_default_class_name (default_adapter_class_name)
			hbox.extend (adapter_frame)
			hbox.disable_item_expand (adapter_frame)
			hbox.extend (create {EV_CELL})
			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)

			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			notebook.extend (vbox)
			notebook.set_item_text (vbox, adapter_text)


			pattern_vbox.extend (notebook)
			pattern_vbox.disable_item_expand (notebook)
		end

feature -- Access

	target_class_name: STRING is
			-- Chosen class name for the target class
		do
			Result := target_frame.class_name_selector.name_text
		ensure
			target_class_name_not_void: Result /= Void
			definition: Result.is_equal (target_frame.class_name_selector.name_text)
		end

	target_feature_name: STRING is
			-- Chosen name for the target's feature
		do
			Result := target_frame.feature_1_name_selector.name_text
		ensure
			target_feature_name_not_void: Result /= Void
			definition: Result.is_equal (target_frame.feature_1_name_selector.name_text)
		end

	adaptee_class_name: STRING is
			-- Chosen class name for the adaptee class
		do
			Result := adaptee_frame.class_name_selector.name_text
		ensure
			adaptee_class_name_not_void: Result /= Void
			definition: Result.is_equal (adaptee_frame.class_name_selector.name_text)
		end

	adaptee_feature_name: STRING is
			-- Chosen name for the adaptee's feature
		do
			Result := adaptee_frame.feature_1_name_selector.name_text
		ensure
			adaptee_feature_name_not_void: Result /= Void
			definition: Result.is_equal (adaptee_frame.feature_1_name_selector.name_text)
		end

	adapter_class_name: STRING is
			-- Chosen class name for the adapter class
		do
			Result := adapter_frame.class_name_selector.name_text
		ensure
			adapter_class_name_not_void: Result /= Void
			definition: Result.is_equal (adapter_frame.class_name_selector.name_text)
		end

feature -- Status report

	is_in_default_state: BOOLEAN is
			-- Is adapter property selector in default state?
		do
			 Result := (
						notebook /= Void and
						target_frame /= Void and
						adaptee_frame /= Void and
						adapter_frame /= Void
					)
		end

feature {NONE} -- Implementation (GUI components)

	notebook: EV_NOTEBOOK
			-- Notebook with properties of the target class,
			-- the adaptee and the adapter

	target_frame: PW_PATTERN_BASIC_PROPERTY_SELECTOR
			-- Frame with properties concerning the target class

	adaptee_frame: PW_PATTERN_BASIC_PROPERTY_SELECTOR
			-- Frame with properties concerning the adaptee class

	adapter_frame: PW_PATTERN_BASIC_PROPERTY_SELECTOR
			-- Frame with properties concerning the adapter class

invariant

	notebook_not_void: notebook /= Void
	target_frame_not_void: target_frame /= Void
	adaptee_frame_not_void: adaptee_frame /= Void
	adapter_frame_not_void: adapter_frame /= Void

end
