indexing

	description:

		"Frame where the user can select the Template Method pattern properties"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_TEMPLATE_METHOD_PROPERTY_SELECTOR

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
			create deferred_application_class_frame.make_with_info_and_text (template_method_name_label_text,
																			template_method_implementation_feature_names_label_text,
																			template_method_deferred_application_class_text)
			create effective_application_class_frame.make_with_info_and_text (Void, Void, template_method_effective_application_class_text)
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

				-- First tab: Deferred application class properties
			create vbox
			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			create hbox
			hbox.set_minimum_width (window_width - 4 * margin)
			hbox.extend (create {EV_CELL})
			deferred_application_class_frame.set_default_class_name (default_template_method_application_class_name)
			deferred_application_class_frame.set_default_feature_name (default_template_method_feature_name)
			create feature_name_list.make
			feature_name_list.extend (default_template_method_feature_1_name)
			feature_name_list.extend (default_template_method_feature_2_name)
			deferred_application_class_frame.set_default_feature_names (feature_name_list)
			hbox.extend (deferred_application_class_frame)
			hbox.disable_item_expand (deferred_application_class_frame)
			hbox.extend (create {EV_CELL})
			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)

			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			notebook.extend (vbox)
			notebook.set_item_text (vbox, template_method_deferred_application_text)

				-- Second tab: Effective application class properties
			create vbox
			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			create hbox
			hbox.set_minimum_width (window_width - 4 * margin)
			hbox.extend (create {EV_CELL})
			effective_application_class_frame.set_default_class_name (default_template_method_effective_application_class_name)
			hbox.extend (effective_application_class_frame)
			hbox.disable_item_expand (effective_application_class_frame)
			hbox.extend (create {EV_CELL})
			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)

			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			notebook.extend (vbox)
			notebook.set_item_text (vbox, template_method_effective_application_text)


			pattern_vbox.extend (notebook)
			pattern_vbox.disable_item_expand (notebook)
		end

feature -- Access

	application_class_name: STRING is
			-- Chosen name for the application class
		do
			Result := deferred_application_class_frame.class_name_selector.name_text
		ensure
			application_class_name_not_void: Result /= Void
			definition: Result.is_equal (deferred_application_class_frame.class_name_selector.name_text)
		end

	template_method_name: STRING is
			-- Chosen name for the template method
		do
			Result := deferred_application_class_frame.feature_name_selector.name_text
		ensure
			template_method_name_not_void: Result /= Void
			definition: Result.is_equal (deferred_application_class_frame.feature_name_selector.name_text)
		end

	implementation_features_name: LINKED_LIST [STRING] is
			-- Chosen name for the implementation features of the template method
		do
			Result := deferred_application_class_frame.name_list_selector.names
		end

	effective_class_name: STRING is
			-- Chosen name for the effective application class
		do
			Result := effective_application_class_frame.class_name_selector.name_text
		ensure
			effective_class_name_not_void: Result /= Void
			definition: Result.is_equal (effective_application_class_frame.class_name_selector.name_text)
		end

feature -- Status report

	is_in_default_state: BOOLEAN is
			-- Is template method property selector in default state?
		do
			 Result := (
						notebook /= Void and
						deferred_application_class_frame /= Void and
						effective_application_class_frame /= Void
					)
		end

feature {NONE} -- Implementation (GUI components)

	notebook: EV_NOTEBOOK
			-- Notebook with properties of the application class
			-- and of the client class (root class)

	deferred_application_class_frame: PW_PATTERN_PROPERTY_LIST_SELECTOR
			-- Frame with properties concerning the deferred application class
			-- (defining the template method)

	effective_application_class_frame: PW_PATTERN_BASIC_PROPERTY_SELECTOR
			-- Frame with properties concerning the effective application class
			-- (implementing the deferred parts of the algorithm defined in the
			-- template method)

invariant

	notebook_not_void: notebook /= Void
	deferred_application_class_frame_not_void: deferred_application_class_frame /= Void
	effective_application_class_frame_not_void: effective_application_class_frame /= Void

end
