indexing

	description:
		"[
			Horizontal box with control buttons 'Generate' and 'Cancel'
			and information buttons 'Help' and 'About'
		]"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_CONTROL_BOX

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

	PW_SUPPORT
		undefine
			is_equal, default_create, copy
		end
		
create

	default_create

feature {NONE} -- Initialization

	initialize is
			-- Initialize buttons and build the horizontal box.
		do 
			Precursor {EV_HORIZONTAL_BOX}
			create about_button.make_with_text_and_action (about_button_text, agent show_about)
			create generate_button.make_with_text_and_action (generate_button_text, agent generate)
			create cancel_button.make_with_text_and_action (cancel_button_text, agent close_window)
			create help_button.make_with_text_and_action (help_button_text, agent show_help)
			build
		end

	build is
			-- Build control box with `about_button', `generate_button'
			-- `cancel_button' and `help_button'.
		local
			c: EV_CELL
		do
			create c
			c.set_minimum_width (margin)
			extend (c)
			disable_item_expand (c)

			about_button.align_text_center
			about_button.set_minimum_width (button_width)
			about_button.set_minimum_height (button_height)
			extend (about_button)
			disable_item_expand (about_button)

			extend (create {EV_CELL})

			generate_button.align_text_center
			generate_button.set_minimum_width (button_width)
			generate_button.set_minimum_height (button_height)
			generate_button.disable_sensitive
			extend (generate_button)
			disable_item_expand (generate_button)

			create c
			c.set_minimum_width (margin)
			extend (c)
			disable_item_expand (c)

			cancel_button.align_text_center
			cancel_button.set_minimum_width (button_width)
			cancel_button.set_minimum_height (button_height)
			extend (cancel_button)
			disable_item_expand (cancel_button)

			create c
			c.set_minimum_width (margin)
			extend (c)
			disable_item_expand (c)

			help_button.align_text_center
			help_button.set_minimum_width (button_width)
			help_button.set_minimum_height (button_height)
			extend (help_button)
			disable_item_expand (help_button)

			create c
			c.set_minimum_width (margin)
			extend (c)
			disable_item_expand (c)
		end

feature -- Status report

	is_in_default_state: BOOLEAN is
			-- Is control box in default state?
		do
			Result := (
						about_button /= Void and generate_button /= Void and
						cancel_button /= Void and help_button /= Void and
						about_button.is_center_aligned and 
						generate_button.is_center_aligned and
						cancel_button.is_center_aligned and
						help_button.is_center_aligned
					)
		end

feature -- Event handling

	show_about is
			-- Show the "About Eiffel Pattern Wizard" dialog.
			-- (Action performed when the user clicks the `about_button')
		local
			about_dialog: PW_ABOUT_DIALOG
			application: PATTERN_WIZARD
		do
			create about_dialog
			application ?= (create {EV_ENVIRONMENT}).application
			if application /= Void then
				about_dialog.show_modal_to_window (application.initial_window)
			end
		end

	generate is
			-- Generate code from the selected information.
			-- (Action performed when the user clicks the `generate_button')
		local
			application: PATTERN_WIZARD
		do
			application ?= (create {EV_ENVIRONMENT}).application
			if application /= Void then
				application.initial_window.generate_code
			end
		end

	close_window is
			-- Close window.
			-- (Action performed when the user clicks the `cancel_button')
		do
			destroy;
			(create {EV_ENVIRONMENT}).application.destroy
		end

	show_help is
			-- Show the wizard documentation.
			-- (Action performed when the user clicks the `help_button')
		local
			wel_registry: WEL_REGISTRY
			a_registry_value: WEL_REGISTRY_KEY_VALUE
			a_pointer: POINTER
			a_value: STRING
		do
			create wel_registry
			a_pointer := wel_registry.open_key_with_access ("hkey_classes_root" + "\.pdf", feature {WEL_REGISTRY_ACCESS_MODE}.key_query_value)
			a_registry_value := wel_registry.default_key_value (a_pointer, Void)
			a_registry_value.set_type (feature {WEL_REGISTRY_KEY_VALUE_TYPE}.reg_sz)
			a_value := a_registry_value.string_value
			a_pointer := wel_registry.open_key_with_access ("hkey_classes_root" + "\" + a_value + "\shell\Open\command", feature {WEL_REGISTRY_ACCESS_MODE}.key_query_value)
			a_registry_value := wel_registry.default_key_value (a_pointer, Void)
			a_registry_value.set_type (feature {WEL_REGISTRY_KEY_VALUE_TYPE}.reg_sz)
			a_value := a_registry_value.string_value
			a_value.replace_substring_all ("%"%%1%"", pattern_delivery_directory + clone (help_file_name))
			(create {EXECUTION_ENVIRONMENT}).launch (a_value)
		end

feature {PW_INITIAL_WINDOW} -- Access (GUI components)

	about_button: EV_BUTTON
			-- Button giving access to the "About Eiffel Pattern Wizard" dialog

	generate_button: EV_BUTTON
			-- Button starting code generation

	cancel_button: EV_BUTTON
			-- Button cancelling code generation and closing the wizard

	help_button: EV_BUTTON
			-- Button giving access to the wizard documentation

invariant

	about_button_not_void: about_button /= Void
	generate_button_not_void: generate_button /= Void
	cancel_button_not_void: cancel_button /= Void
	help_button_not_void: help_button /= Void
	about_button_text_center_aligned: about_button.is_center_aligned
	generate_button_text_center_aligned: generate_button.is_center_aligned
	cancel_button_text_center_aligned: cancel_button.is_center_aligned
	help_button_text_center_aligned: help_button.is_center_aligned

end
