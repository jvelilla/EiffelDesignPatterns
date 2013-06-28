indexing

	description:

		"Frame where the user can select the Decorator pattern properties"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_DECORATOR_PROPERTY_SELECTOR

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
			create original_component_vbox
			create deferred_component_class_frame.make_with_info_and_text (feature_name_label_text, Void, decorator_deferred_component_class_text)
			create effective_component_class_frame.make_with_info_and_text (Void, Void, decorator_effective_component_class_text) 
			create decorated_component_vbox
			create deferred_decorated_component_class_frame.make_with_info_and_text (creation_procedure_name_label_text + "%N(will be used in descendants)", Void, decorator_deferred_decorated_component_class_text)
			create effective_decorated_component_class_frame.make_with_text (decorator_effective_decorated_component_class_text) 
			create additional_attribute_name_selector.make (attribute_name_label_text)
			create additional_attribute_type_name_selector.make (attribute_type_name_label_text)
			create additional_behavior_name_selector.make (feature_name_label_text)
			create check_additional_attribute_button.make_with_text (check_additional_attribute_button_text)
			create check_additional_behavior_button.make_with_text (check_additional_behavior_button_text)

			check_additional_attribute_button.select_actions.extend (agent check_additional_attribute)
			check_additional_behavior_button.select_actions.extend (agent check_additional_behavior)
		end

	build_pattern_vbox is
			-- Build `pattern_vbox'.
		local
			hbox, hb: EV_HORIZONTAL_BOX
			vbox: EV_VERTICAL_BOX
			c: EV_CELL
		do
			notebook.position_tabs_top

				-- First tab: Original component properties

				-- Deferred component class frame
			create hbox
			hbox.set_minimum_width (window_width - 4 * margin)
			hbox.extend (create {EV_CELL})

			deferred_component_class_frame.set_default_class_name (default_decorator_deferred_component_class_name)
			deferred_component_class_frame.set_default_feature_1_name (default_feature_name)

			hbox.extend (deferred_component_class_frame)
			hbox.disable_item_expand (deferred_component_class_frame)
			hbox.extend (create {EV_CELL})
			original_component_vbox.extend (hbox)
			original_component_vbox.disable_item_expand (hbox)

			create c
			c.set_minimum_height (margin)
			original_component_vbox.extend (c)
			original_component_vbox.disable_item_expand (c)

				-- Concrete component class frame
			create hbox
			hbox.set_minimum_width (window_width - 4 * margin)
			hbox.extend (create {EV_CELL})

			effective_component_class_frame.set_default_class_name (default_decorator_effective_component_class_name)

			hbox.extend (effective_component_class_frame)
			hbox.disable_item_expand (effective_component_class_frame)
			hbox.extend (create {EV_CELL})
			original_component_vbox.extend (hbox)
			original_component_vbox.disable_item_expand (hbox)

			create c
			c.set_minimum_height (margin)
			original_component_vbox.extend (c)
			original_component_vbox.disable_item_expand (c)

			notebook.extend (original_component_vbox)
			notebook.set_item_text (original_component_vbox, decorator_original_component_tab_text)

				-- Second tab: Decorated component properties

				-- Deferred decorated component class frame
			create hbox
			hbox.set_minimum_width (window_width - 4 * margin)
			hbox.extend (create {EV_CELL})

			deferred_decorated_component_class_frame.set_default_class_name (default_decorator_deferred_decorated_component_class_name)
			deferred_decorated_component_class_frame.set_default_feature_1_name (default_creation_procedure_name)

			hbox.extend (deferred_decorated_component_class_frame)
			hbox.disable_item_expand (deferred_decorated_component_class_frame)
			hbox.extend (create {EV_CELL})
			decorated_component_vbox.extend (hbox)
			decorated_component_vbox.disable_item_expand (hbox)

			create c
			c.set_minimum_height (margin)
			decorated_component_vbox.extend (c)
			decorated_component_vbox.disable_item_expand (c)

				-- Concrete decorated component class frame
			create hb
			hb.extend (create {EV_CELL})

			effective_decorated_component_class_frame.align_text_center
			effective_decorated_component_class_frame.set_minimum_width (window_width - 4 * margin)

			create vbox
			vbox.set_minimum_width (window_width - 6 * margin)

			create hbox
			hbox.set_minimum_width (window_width - 6 * margin)
			create c
			c.set_minimum_width (margin)
			hbox.extend (c)
			hbox.disable_item_expand (c)
			check_additional_attribute_button.enable_select
			hbox.extend (check_additional_attribute_button)
			hbox.extend (create {EV_CELL})
			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)

			create hbox
			hbox.set_minimum_width (window_width - 6 * margin)
			create c
			c.set_minimum_width (2 * margin)
			hbox.extend (c)
			hbox.disable_item_expand (c)
			additional_attribute_name_selector.set_default_name (default_additional_attribute_name)
			additional_attribute_name_selector.set_minimum_width (window_width - 6 * margin - 5)
			hbox.extend (additional_attribute_name_selector)
			hbox.disable_item_expand (additional_attribute_name_selector)
			create c
			c.set_minimum_width (margin)
			hbox.extend (c)
			hbox.disable_item_expand (c)
			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)

			create hbox
			hbox.set_minimum_width (window_width - 6 * margin)
			create c
			c.set_minimum_width (2 * margin)
			hbox.extend (c)
			hbox.disable_item_expand (c)
			additional_attribute_type_name_selector.set_default_name (default_attribute_type_name)
			additional_attribute_type_name_selector.set_minimum_width (window_width - 6 * margin - 5)
			hbox.extend (additional_attribute_type_name_selector)
			hbox.disable_item_expand (additional_attribute_type_name_selector)
			create c
			c.set_minimum_width (margin)
			hbox.extend (c)
			hbox.disable_item_expand (c)
			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)

			create hbox
			hbox.set_minimum_width (window_width - 6 * margin)
			create c
			c.set_minimum_width (margin)
			hbox.extend (c)
			hbox.disable_item_expand (c)
			check_additional_behavior_button.enable_select
			hbox.extend (check_additional_behavior_button)
			hbox.extend (create {EV_CELL})
			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)

			create hbox
			hbox.set_minimum_width (window_width - 5 * margin)
			create c
			c.set_minimum_width (2 * margin)
			hbox.extend (c)
			hbox.disable_item_expand (c)
			additional_behavior_name_selector.set_default_name (default_additional_feature_name)
			additional_behavior_name_selector.set_minimum_width (window_width - 6 * margin - 5)
			hbox.extend (additional_behavior_name_selector)
			hbox.disable_item_expand (additional_behavior_name_selector)
			create c
			c.set_minimum_width (margin)
			hbox.extend (c)
			hbox.disable_item_expand (c)
			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)

			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)

			effective_decorated_component_class_frame.extend (vbox)
			hb.extend (effective_decorated_component_class_frame)
			hb.disable_item_expand (effective_decorated_component_class_frame)
			hb.extend (create {EV_CELL})

			decorated_component_vbox.extend (hb)
			decorated_component_vbox.disable_item_expand (hb)

			notebook.extend (decorated_component_vbox)
			notebook.set_item_text (decorated_component_vbox, decorator_decorated_component_tab_text)

			pattern_vbox.extend (notebook)
			pattern_vbox.disable_item_expand (notebook)
		end

feature -- Access

	component_class_name: STRING is
			-- Chosen name for the component class
		do
			Result := deferred_component_class_frame.class_name_selector.name_text
		ensure
			component_class_name_not_void: Result /= Void
			definition: Result.is_equal (deferred_component_class_frame.class_name_selector.name_text)
		end

	component_feature_name: STRING is
			-- Chosen name for the feature of the component class
		do
			Result := deferred_component_class_frame.feature_1_name_selector.name_text
		ensure
			component_feature_name_not_void: Result /= Void
			definition: Result.is_equal (deferred_component_class_frame.feature_1_name_selector.name_text)
		end

	effective_component_class_name: STRING is
			-- Chosen name for the effective component class
		do
			Result := effective_component_class_frame.class_name_selector.name_text
		ensure
			effective_component_class_name_not_void: Result /= Void
			definition: Result.is_equal (effective_component_class_frame.class_name_selector.name_text)
		end

	decorated_component_class_name: STRING is
			-- Chosen name for the decorated component class
		do
			Result := deferred_decorated_component_class_frame.class_name_selector.name_text
		ensure
			decorated_component_class_name_not_void: Result /= Void
			definition: Result.is_equal (deferred_decorated_component_class_frame.class_name_selector.name_text)
		end

	decorated_component_creation_procedure_name: STRING is
			-- Chosen name for the creation procedure of the decorated component class
		do
			Result := deferred_decorated_component_class_frame.feature_1_name_selector.name_text
		ensure
			decorated_component_creation_procedure_name_not_void: Result /= Void
			definition: Result.is_equal (deferred_decorated_component_class_frame.feature_1_name_selector.name_text)
		end

	additional_attribute_name: STRING is
			-- Name of the additional attribute of the decorated component
		require
			is_component_with_additional_attribute_generation: is_component_with_additional_attribute_generation
		do
			Result := additional_attribute_name_selector.name_text
		ensure
			additional_attribute_name_not_void: Result /= Void
			definition: Result.is_equal (additional_attribute_name_selector.name_text)
		end

	additional_attribute_type_name: STRING is
			-- Type name of the additional attribute of the decorated component
		require
			is_component_with_additional_attribute_generation: is_component_with_additional_attribute_generation
		do
			Result := additional_attribute_type_name_selector.name_text
		ensure
			additional_attribute_type_name_not_void: Result /= Void
			definition: Result.is_equal (additional_attribute_type_name_selector.name_text)
		end

	additional_feature_name: STRING is
			-- Name of the additional feature of the decorated component
		require
			is_component_with_additional_behavior_generation: is_component_with_additional_behavior_generation
		do
			Result := additional_behavior_name_selector.name_text
		ensure
			additional_feature_name_not_void: Result /= Void
			definition: Result.is_equal (additional_behavior_name_selector.name_text)
		end

feature -- Status report

	is_component_with_additional_attribute_generation: BOOLEAN is
			 -- Should a decorated component with additional attribute be generated?
		do
			Result := check_additional_attribute_button.is_selected
		ensure
			definition: Result = check_additional_attribute_button.is_selected
		end

	is_component_with_additional_behavior_generation: BOOLEAN is
			 -- Should a decorated component with additional behavior be generated?
		do
			Result := check_additional_behavior_button.is_selected
		ensure
			definition: Result = check_additional_behavior_button.is_selected
		end

	is_in_default_state: BOOLEAN is
			-- Is decorator property selector in default state?
		do
			 Result := (
						original_component_vbox /= Void and
						deferred_component_class_frame /= Void and 
						effective_component_class_frame /= Void and
						decorated_component_vbox /= Void and 
						deferred_decorated_component_class_frame /= Void and
						effective_decorated_component_class_frame /= Void and
						check_additional_attribute_button /= Void and
						check_additional_behavior_button /= Void and
						additional_attribute_name_selector /= Void and
						additional_attribute_type_name_selector /= Void and
						additional_behavior_name_selector /= Void
					)
		end

feature {NONE} -- Event handling

	check_additional_attribute is
			-- Make `additional_attribute_name_selector' and `additional_attribute_type_name_selector'
			-- sensitive to user input if `check_additional_attribute_button' is selected;
			-- make them unsensitive otherwise.
		do
			if check_additional_attribute_button.is_selected then
				additional_attribute_name_selector.enable_name_selector_sensitive
				additional_attribute_type_name_selector.enable_name_selector_sensitive
			else
				additional_attribute_name_selector.disable_name_selector_sensitive
				additional_attribute_type_name_selector.disable_name_selector_sensitive
			end
		end 

	check_additional_behavior is
			-- Make `additional_behavior_name_selector' sensitive to user input
			-- if `check_additional_behavior_button' is selected;
			-- make it unsensitive otherwise.
		do
			if check_additional_behavior_button.is_selected then
				additional_behavior_name_selector.enable_name_selector_sensitive
			else
				additional_behavior_name_selector.disable_name_selector_sensitive
			end
		end 

feature {NONE} -- Implementation (GUI components)

	notebook: EV_NOTEBOOK
			-- Notebook with properties of the original component and
			-- properties of the decorated component

	original_component_vbox: EV_VERTICAL_BOX
			-- Vertical box with properties of deferred and effective 
			-- (non-decorated) component class

	deferred_component_class_frame: PW_PATTERN_BASIC_PROPERTY_SELECTOR
			-- Frame with properties concerning the deferred component class

	effective_component_class_frame: PW_PATTERN_BASIC_PROPERTY_SELECTOR
			-- Frame with properties concerning the effective component class

	decorated_component_vbox: EV_VERTICAL_BOX
			-- Vertical box with properties of deferred and effective 
			-- decorated) component class

	deferred_decorated_component_class_frame: PW_PATTERN_BASIC_PROPERTY_SELECTOR
			-- Frame with properties concerning the deferred decorated component class

	effective_decorated_component_class_frame: EV_FRAME
			-- Frame with properties concerning the effective decorated component class

	check_additional_attribute_button: EV_CHECK_BUTTON
			-- Toggle button enabling the user to say whether a decorated component
			-- class with additional attribute should be generated

	additional_attribute_name_selector: PW_NAME_SELECTOR
			-- Label and text field enabling the user to choose the name of the
			-- additional attribute

	additional_attribute_type_name_selector: PW_NAME_SELECTOR
			-- Label and text field enabling the user to choose the type name of the
			-- additional attribute

	check_additional_behavior_button: EV_CHECK_BUTTON
			-- Toggle button enabling the user to say whether a decorated component
			-- class with additional behavior should be generated

	additional_behavior_name_selector: PW_NAME_SELECTOR
			-- Label and text field enabling the user to choose the name of the
			-- feature to be added (the additional behavior)

invariant

	original_component_vbox_not_void: original_component_vbox /= Void
	deferred_component_class_frame_not_void: deferred_component_class_frame /= Void
	effective_component_class_frame_not_void: effective_component_class_frame /= Void 
	decorated_component_vbox_not_void: decorated_component_vbox /= Void
	deferred_decorated_component_class_frame: deferred_decorated_component_class_frame /= Void
	effective_decorated_component_class_frame: effective_decorated_component_class_frame /= Void
	check_additional_attribute_button_not_void: check_additional_attribute_button /= Void
	check_additional_behavior_button_not_void: check_additional_behavior_button /= Void
	additional_attribute_name_selector_not_void: additional_attribute_name_selector /= Void
	additional_attribute_type_name_selector_not_void: additional_attribute_type_name_selector /= Void
	additional_behavior_name_selector_not_void: additional_behavior_name_selector /= Void

end
