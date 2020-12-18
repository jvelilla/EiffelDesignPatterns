note

	description:
		"[
			Frame where the user can select the properties of 
			the Template Method pattern implemented with agents
		]"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_TEMPLATE_METHOD_WITH_AGENTS_PROPERTY_SELECTOR

inherit

	PW_PATTERN_PROPERTY_SELECTOR
		redefine
			is_in_default_state
		end

create

	make,
	make_with_name_and_text

feature {NONE} -- Initialization

	initialize_pattern_components is
			-- Initialize GUI components that are pattern-specific.
		do
			create notebook
			create application_class_frame.make_with_info_and_text (creation_procedure_name_label_text,
																	template_method_name_label_text,
																	template_method_application_class_text)
			create client_class_frame.make_with_info_and_text (Void,
																template_method_implementation_feature_names_label_text,
																template_method_client_class_text)
		end

	build_pattern_vbox is
			-- Build `pattern_vbox'.
		local
			hbox: EV_HORIZONTAL_BOX
			vbox: EV_VERTICAL_BOX
			c: EV_CELL
			feature_name_list: LINKED_LIST [STRING]
		do
			notebook.position_tabs_top

				-- First tab: Application class properties
			create vbox
			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			create hbox
			hbox.set_minimum_width (window_width - 4 * margin)
			hbox.extend (create {EV_CELL})
			application_class_frame.set_default_class_name (default_template_method_application_class_name)
			application_class_frame.set_default_feature_1_name (default_creation_procedure_name)
			application_class_frame.set_default_feature_2_name (default_template_method_feature_name)
			hbox.extend (application_class_frame)
			hbox.disable_item_expand (application_class_frame)
			hbox.extend (create {EV_CELL})
			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)

			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			notebook.extend (vbox)
			notebook.set_item_text (vbox, template_method_application_text)

				-- Second tab: Client class properties
			create vbox
			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			create hbox
			hbox.set_minimum_width (window_width - 4 * margin)
			hbox.extend (create {EV_CELL})
			client_class_frame.set_default_class_name (default_template_method_client_class_name)
			create feature_name_list.make
			feature_name_list.extend (default_template_method_feature_1_name)
			feature_name_list.extend (default_template_method_feature_2_name)
			client_class_frame.set_default_feature_names (feature_name_list)
			hbox.extend (client_class_frame)
			hbox.disable_item_expand (client_class_frame)
			hbox.extend (create {EV_CELL})
			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)

			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			notebook.extend (vbox)
			notebook.set_item_text (vbox, template_method_client_text)


			pattern_vbox.extend (notebook)
			pattern_vbox.disable_item_expand (notebook)
		end

feature -- Access

	application_class_name: STRING is
			-- Chosen name for the application class
		do
			Result := application_class_frame.class_name_selector.name_text
		ensure
			application_class_name_not_void: Result /= Void
			definition: Result.is_equal (application_class_frame.class_name_selector.name_text)
		end

	creation_procedure_name: STRING is
			-- Chosen name for the application's creation procedure
		do
			Result := application_class_frame.feature_1_name_selector.name_text
		ensure
			creation_procedure_name_not_void: Result /= Void
			definition: Result.is_equal (application_class_frame.feature_1_name_selector.name_text)
		end

	template_method_name: STRING is
			-- Chosen name for the template method
		do
			Result := application_class_frame.feature_2_name_selector.name_text
		ensure
			template_method_name_not_void: Result /= Void
			definition: Result.is_equal (application_class_frame.feature_2_name_selector.name_text)
		end

	client_class_name: STRING is
			-- Chosen name for the client class
		do
			Result := client_class_frame.class_name_selector.name_text
		ensure
			client_class_name_not_void: Result /= Void
			definition: Result.is_equal (client_class_frame.class_name_selector.name_text)
		end

	implementation_features_name: LINKED_LIST [STRING_32] is
			-- Chosen name for the implementation features of the template method
		do
			Result := client_class_frame.name_list_selector.names
		end

feature -- Status report

	is_in_default_state: BOOLEAN is
			-- Is template method property selector in default state?
		do
			 Result := (
						notebook /= Void and
						application_class_frame /= Void and
						client_class_frame /= Void
					)
		end

feature {NONE} -- Implementation (GUI components)

	notebook: EV_NOTEBOOK
			-- Notebook with properties of the application class
			-- and of the client class (root class)

	application_class_frame: PW_PATTERN_BASIC_PROPERTY_SELECTOR
			-- Frame with properties concerning the application class
			-- (containing the template method)

	client_class_frame: PW_PATTERN_PROPERTY_LIST_SELECTOR
			-- Frame with properties concerning the client (root) class

invariant

	notebook_not_void: notebook /= Void
	application_class_frame_not_void: application_class_frame /= Void
	client_class_frame_not_void: client_class_frame /= Void

end
