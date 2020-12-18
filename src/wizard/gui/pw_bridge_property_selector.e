note

	description:

		"Frame where the user can select the Bridge pattern properties"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class PW_BRIDGE_PROPERTY_SELECTOR

inherit

	PW_PATTERN_PROPERTY_SELECTOR
		redefine
			is_in_default_state
		end

feature {NONE} -- Initialization

	initialize_pattern_components
			-- Initialize GUI components that are pattern-specific.
		deferred
		end

	build_pattern_vbox 
			-- Build `pattern_vbox'.
		local
			hbox: EV_HORIZONTAL_BOX
			vbox: EV_VERTICAL_BOX
			c: EV_CELL
			descendant_name_list: LINKED_LIST [STRING_32]
		do
			notebook.position_tabs_top

				-- First tab: Application classes properties
			create vbox
			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			create hbox
			hbox.set_minimum_width (window_width - 4 * margin)
			hbox.extend (create {EV_CELL})
			application_frame.set_default_class_name (default_bridge_application_class_name)
			hbox.extend (application_frame)
			hbox.disable_item_expand (application_frame)
			hbox.extend (create {EV_CELL})
			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)

			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			create descendant_name_list.make
			descendant_name_list.extend (default_bridge_descendant_application_class_1_name)
			descendant_name_list.extend (default_bridge_descendant_application_class_2_name)
			descendant_application_classes_name_list.add_names (descendant_name_list)
			vbox.extend (descendant_application_classes_name_list)
			vbox.disable_item_expand (descendant_application_classes_name_list)

			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			notebook.extend (vbox)
			notebook.set_item_text (vbox, bridge_application_classes_text)

				-- Second tab: Application implementation classes properties
			create vbox
			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			create hbox
			hbox.set_minimum_width (window_width - 4 * margin)
			hbox.extend (create {EV_CELL})
			implementation_frame.set_default_class_name (default_bridge_application_implementation_class_name)
			hbox.extend (implementation_frame)
			hbox.disable_item_expand (implementation_frame)
			hbox.extend (create {EV_CELL})
			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)

			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			create descendant_name_list.make
			descendant_name_list.extend (default_bridge_descendant_application_implementation_class_1_name)
			descendant_name_list.extend (default_bridge_descendant_application_implementation_class_2_name)
			descendant_application_implementation_classes_name_list.add_names (descendant_name_list)
			vbox.extend (descendant_application_implementation_classes_name_list)
			vbox.disable_item_expand (descendant_application_implementation_classes_name_list)

			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			notebook.extend (vbox)
			notebook.set_item_text (vbox, bridge_application_implementation_classes_text)


			pattern_vbox.extend (notebook)
			pattern_vbox.disable_item_expand (notebook)
		end

feature -- Access

	application_class_name: STRING_32
			-- Chosen name for the application class
		do
			Result := application_frame.class_name_selector.name_text
		ensure
			application_class_name_not_void: Result /= Void
			definition: Result.is_equal (application_frame.class_name_selector.name_text)
		end

	descendant_application_classes_name: LINKED_LIST [STRING_32]
			-- Chosen name for the descendants of the application class
		do
			Result := descendant_application_classes_name_list.names
		end

	application_implementation_class_name: STRING_32
			-- Chosen name for the application implementation class
		do
			Result := implementation_frame.class_name_selector.name_text
		ensure
			application_implementation_class_name_not_void: Result /= Void
			definition: Result.is_equal (implementation_frame.class_name_selector.name_text)
		end

	application_implementation_feature_name: STRING_32
			-- Chosen name for the application implementation class's feature
		do
			Result := implementation_frame.feature_1_name_selector.name_text
		ensure
			application_implementation_feature_name_not_void: Result /= Void
			definition: Result.is_equal (implementation_frame.feature_1_name_selector.name_text)
		end

	descendant_application_implementation_classes_name: LINKED_LIST [STRING_32]
			-- Chosen name for the descendants of the application implementation class
		do
			Result := descendant_application_implementation_classes_name_list.names
		end

feature -- Status report

	is_in_default_state: BOOLEAN
			-- Is bridge property selector in default state?
		do
			 Result := (
						notebook /= Void and
						application_frame /= Void and
						descendant_application_classes_name_list /= Void and
						implementation_frame /= Void and
						descendant_application_implementation_classes_name_list /= Void
					)
		end

feature {NONE} -- Implementation (GUI components)

	notebook: EV_NOTEBOOK
			-- Notebook with properties of the application classes
			-- and of the implementation classes

	application_frame: PW_PATTERN_BASIC_PROPERTY_SELECTOR
			-- Frame with properties concerning the deferred application class

	descendant_application_classes_name_list: PW_NAME_LIST_SELECTOR
			-- List of descendant application classes

	implementation_frame: PW_PATTERN_BASIC_PROPERTY_SELECTOR
			-- Frame with properties concerning the implementation class

	descendant_application_implementation_classes_name_list: PW_NAME_LIST_SELECTOR
			-- List of descendant application implementation classes

invariant

	notebook_not_void: notebook /= Void
	application_frame_not_void: application_frame /= Void
	descendant_application_classes_not_void: descendant_application_classes_name_list /= Void
	implementation_frame_not_void: implementation_frame /= Void
	descendant_application_implementation_classes_name_list_not_void: descendant_application_implementation_classes_name_list /= Void

end
