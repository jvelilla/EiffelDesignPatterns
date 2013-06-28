indexing

	description:

		"Initial window of the Eiffel Pattern Wizard"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_INITIAL_WINDOW

inherit

	EV_TITLED_WINDOW
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
		undefine
			default_create, copy
		end

	PW_INITIAL_WINDOW_IMP
		undefine
			default_create, copy
		end

create

	default_create

feature {NONE} -- Initialization

	initialize is
			-- Initialize GUI components.
		do
			Precursor {EV_TITLED_WINDOW}
			create pattern_selector.make_with_text (pattern_selector_text)
			create pattern_properties_vbox
			create check_generate_root_class_button.make_with_text (check_generate_root_class_button_text)
			create check_close_wizard_button.make_with_text (check_close_wizard_button_text)
			create control_box
			set_title (window_title)
			set_width (window_width)
			disable_user_resize
			build
			close_request_actions.extend (agent close_window)
			if not pattern_delivery_directory.is_empty then
				create pw_icon_pixmap
				pw_icon_pixmap.set_with_named_file (pattern_delivery_directory + pw_icon_pixmap_file_name)
				set_icon_pixmap (pw_icon_pixmap)
			end
		end

	build is
			-- Build interface.
		local
			vbox: EV_VERTICAL_BOX
			hbox: EV_HORIZONTAL_BOX
			c: EV_CELL
			h_separator: EV_HORIZONTAL_SEPARATOR
		do
			create vbox

			create hbox
			hbox.extend (create {EV_CELL})
			pattern_selector.set_minimum_width (window_width - 2 * margin)
			pattern_selector.set_minimum_height (pattern_selector_height)
			hbox.extend (pattern_selector)
			hbox.disable_item_expand (pattern_selector)
			hbox.extend (create {EV_CELL})
			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)

			vbox.extend (pattern_properties_vbox)
			vbox.disable_item_expand (pattern_properties_vbox)

			create hbox
			hbox.extend (create {EV_CELL})
			check_generate_root_class_button.set_minimum_width (window_width - 2 * margin)
			check_generate_root_class_button.set_minimum_height (button_height)
			check_generate_root_class_button.enable_select
			hbox.extend (check_generate_root_class_button)
			hbox.disable_item_expand (check_generate_root_class_button)
			hbox.extend (create {EV_CELL})
			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)

			create hbox
			hbox.extend (create {EV_CELL})
			check_close_wizard_button.set_minimum_width (window_width - 2 * margin)
			check_close_wizard_button.set_minimum_height (button_height)
			check_close_wizard_button.enable_select
			hbox.extend (check_close_wizard_button)
			hbox.disable_item_expand (check_close_wizard_button)
			hbox.extend (create {EV_CELL})
			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)

			create h_separator
			vbox.extend (h_separator)
			vbox.disable_item_expand (h_separator)

			create c
			c.set_minimum_height (margin)
			vbox.extend (c)
			vbox.disable_item_expand (c)
			
			vbox.extend (control_box)
			vbox.disable_item_expand (control_box)

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
						pattern_selector /= Void and
						pattern_properties_vbox /= Void and
						check_generate_root_class_button /= Void and
						check_close_wizard_button /= Void and
						control_box /= Void and
						title.is_equal (window_title)
					)
		end

feature {PW_PATTERN_SELECTOR} -- Event handling

	select_pattern (a_name: STRING) is
			-- Select pattern corresponding to `a_name' and display the corresponding GUI.
		require
			a_name_not_void: a_name /= Void
			a_name_not_emtpy: not a_name.is_empty
		do
			if not pattern_properties_vbox.is_empty then
				pattern_properties_vbox.start
				pattern_properties_vbox.remove
			end
			if a_name.is_equal (singleton_pattern_name) then
				create {PW_SINGLETON_VERTICAL_BOX} pattern_vbox
				pattern_properties_vbox.extend (pattern_vbox)
				control_box.generate_button.enable_sensitive
			elseif a_name.is_equal (decorator_pattern_name) then
				create {PW_DECORATOR_VERTICAL_BOX} pattern_vbox
				pattern_properties_vbox.extend (pattern_vbox)
				control_box.generate_button.enable_sensitive
			elseif a_name.is_equal (class_adapter_pattern_name) then
				create {PW_CLASS_ADAPTER_VERTICAL_BOX} pattern_vbox
				pattern_properties_vbox.extend (pattern_vbox)
				control_box.generate_button.enable_sensitive
			elseif a_name.is_equal (object_adapter_pattern_name) then
				create {PW_OBJECT_ADAPTER_VERTICAL_BOX} pattern_vbox
				pattern_properties_vbox.extend (pattern_vbox)
				control_box.generate_button.enable_sensitive
			elseif a_name.is_equal (template_method_pattern_name) then
				create {PW_TEMPLATE_METHOD_VERTICAL_BOX} pattern_vbox
				pattern_properties_vbox.extend (pattern_vbox)
				control_box.generate_button.enable_sensitive
			elseif a_name.is_equal (template_method_with_agents_pattern_name) then
				create {PW_TEMPLATE_METHOD_WITH_AGENTS_VERTICAL_BOX} pattern_vbox
				pattern_properties_vbox.extend (pattern_vbox)
				control_box.generate_button.enable_sensitive
			elseif a_name.is_equal (bridge_pattern_name) then
				create {PW_BRIDGE_VERTICAL_BOX} pattern_vbox
				pattern_properties_vbox.extend (pattern_vbox)
				control_box.generate_button.enable_sensitive
			elseif a_name.is_equal (bridge_with_effective_classes_pattern_name) then
				create {PW_BRIDGE_WITH_EFFECTIVE_CLASSES_VERTICAL_BOX} pattern_vbox
				pattern_properties_vbox.extend (pattern_vbox)
				control_box.generate_button.enable_sensitive
			elseif a_name.is_equal (bridge_with_inheritance_pattern_name) then
				create {PW_BRIDGE_WITH_INHERITANCE_VERTICAL_BOX} pattern_vbox
				pattern_properties_vbox.extend (pattern_vbox)
				control_box.generate_button.enable_sensitive
			end
			set_height (window_height)
		ensure
			pattern_vbox_not_void: pattern_vbox /= Void
		end
		
feature {PW_CONTROL_BOX} -- Event handling

	generate_code is
			-- Generate code for the selected pattern according to the chosen properties.
		require
			pattern_vbox_not_void: pattern_vbox /= Void
		local
			a_project_directory: STRING
			information_dialog: EV_INFORMATION_DIALOG
			warning_dialog: EV_WARNING_DIALOG
			error_occurred: BOOLEAN
		do
			singleton_pattern_vbox ?= pattern_vbox
			if singleton_pattern_vbox /= Void then
				a_project_directory := singleton_pattern_vbox.project_location_selector.project_directory
				if directory_exists (a_project_directory) then
					singleton_code_generator.set_project_directory (a_project_directory)
					singleton_code_generator.set_root_class_and_ace_file_generation (check_generate_root_class_button.is_selected)
					singleton_code_generator.set_pattern_info (singleton_info)
					singleton_code_generator.generate
				else
					display_error_dialog (incorrect_project_directory_path_text)
					singleton_pattern_vbox.project_location_selector.remove_location_text
					error_occurred := True 
				end
			end
			decorator_pattern_vbox ?= pattern_vbox
			if decorator_pattern_vbox /= Void then
				a_project_directory := decorator_pattern_vbox.project_location_selector.project_directory 
				if directory_exists (a_project_directory) then
					decorator_code_generator.set_project_directory (a_project_directory)
					decorator_code_generator.set_root_class_and_ace_file_generation (check_generate_root_class_button.is_selected)
					decorator_code_generator.set_pattern_info (decorator_info)
					decorator_code_generator.generate
				else
					display_error_dialog (incorrect_project_directory_path_text)
					decorator_pattern_vbox.project_location_selector.remove_location_text
					error_occurred := True 
				end
			end
			class_adapter_pattern_vbox ?= pattern_vbox
			if class_adapter_pattern_vbox /= Void then
				a_project_directory := class_adapter_pattern_vbox.project_location_selector.project_directory
				if directory_exists (a_project_directory) then
					class_adapter_code_generator.set_project_directory (a_project_directory)
					class_adapter_code_generator.set_root_class_and_ace_file_generation (check_generate_root_class_button.is_selected)
					class_adapter_code_generator.set_pattern_info (class_adapter_info)
					class_adapter_code_generator.generate
				else
					display_error_dialog (incorrect_project_directory_path_text)
					class_adapter_pattern_vbox.project_location_selector.remove_location_text
					error_occurred := True 
				end
			end
			object_adapter_pattern_vbox ?= pattern_vbox
			if object_adapter_pattern_vbox /= Void then
				a_project_directory := object_adapter_pattern_vbox.project_location_selector.project_directory
				if directory_exists (a_project_directory) then
					object_adapter_code_generator.set_project_directory (a_project_directory)
					object_adapter_code_generator.set_root_class_and_ace_file_generation (check_generate_root_class_button.is_selected)
					object_adapter_code_generator.set_pattern_info (object_adapter_info)
					object_adapter_code_generator.generate
				else
					display_error_dialog (incorrect_project_directory_path_text)
					object_adapter_pattern_vbox.project_location_selector.remove_location_text
					error_occurred := True
				end
			end
			template_method_pattern_vbox ?= pattern_vbox
			if template_method_pattern_vbox /= Void then
				a_project_directory := template_method_pattern_vbox.project_location_selector.project_directory
				if directory_exists (a_project_directory) then
					template_method_code_generator.set_project_directory (a_project_directory)
					template_method_code_generator.set_root_class_and_ace_file_generation (check_generate_root_class_button.is_selected)
					template_method_code_generator.set_pattern_info (template_method_info)
					template_method_code_generator.generate
				else
					display_error_dialog (incorrect_project_directory_path_text)
					template_method_pattern_vbox.project_location_selector.remove_location_text
					error_occurred := True 
				end
			end
			template_method_with_agents_pattern_vbox ?= pattern_vbox
			if template_method_with_agents_pattern_vbox /= Void then
				a_project_directory := template_method_with_agents_pattern_vbox.project_location_selector.project_directory
				if directory_exists (a_project_directory) then
					template_method_with_agents_code_generator.set_project_directory (a_project_directory)
					if not check_generate_root_class_button.is_selected then
						create warning_dialog.make_with_text (template_method_with_agents_automatic_root_class_generation_text)
						warning_dialog.set_icon_pixmap (pw_icon_pixmap)
						warning_dialog.show_modal_to_window (Current)
						check_generate_root_class_button.enable_select
					end
					template_method_with_agents_code_generator.set_root_class_and_ace_file_generation (True)
					template_method_with_agents_code_generator.set_pattern_info (template_method_with_agents_info)
					template_method_with_agents_code_generator.generate
				else
					display_error_dialog (incorrect_project_directory_path_text)
					template_method_with_agents_pattern_vbox.project_location_selector.remove_location_text
					error_occurred := True 
				end
			end
			bridge_pattern_vbox ?= pattern_vbox
			if bridge_pattern_vbox /= Void then
				a_project_directory := bridge_pattern_vbox.project_location_selector.project_directory
				if directory_exists (a_project_directory) then
					bridge_code_generator.set_project_directory (a_project_directory)
					bridge_code_generator.set_root_class_and_ace_file_generation (check_generate_root_class_button.is_selected)
					bridge_code_generator.set_pattern_info (bridge_info)
					if bridge_info.descendant_application_classes_name.count /= bridge_info.descendant_application_implementation_classes_name.count then
						display_error_dialog (bridge_incorrect_descendant_classes_count_text)
						error_occurred := True
					else
						bridge_code_generator.generate
					end
				else
					display_error_dialog (incorrect_project_directory_path_text)
					bridge_pattern_vbox.project_location_selector.remove_location_text
					error_occurred := True 
				end
			end
			bridge_with_effective_classes_pattern_vbox ?= pattern_vbox
			if bridge_with_effective_classes_pattern_vbox /= Void then
				a_project_directory := bridge_with_effective_classes_pattern_vbox.project_location_selector.project_directory
				if directory_exists (a_project_directory) then
					bridge_with_effective_classes_code_generator.set_project_directory (a_project_directory)
					bridge_with_effective_classes_code_generator.set_root_class_and_ace_file_generation (check_generate_root_class_button.is_selected)
					bridge_with_effective_classes_code_generator.set_pattern_info (bridge_with_effective_classes_info)
					if bridge_with_effective_classes_info.descendant_application_classes_name.count /= bridge_with_effective_classes_info.descendant_application_implementation_classes_name.count then
						display_error_dialog (bridge_incorrect_descendant_classes_count_text)
						error_occurred := True
					else
						bridge_with_effective_classes_code_generator.generate
					end
				else
					display_error_dialog (incorrect_project_directory_path_text)
					bridge_with_effective_classes_pattern_vbox.project_location_selector.remove_location_text 
					error_occurred := True
				end
			end
			bridge_with_inheritance_pattern_vbox ?= pattern_vbox
			if bridge_with_inheritance_pattern_vbox /= Void then
				a_project_directory := bridge_with_inheritance_pattern_vbox.project_location_selector.project_directory
				if directory_exists (a_project_directory) then
					bridge_with_inheritance_code_generator.set_project_directory (a_project_directory)
					bridge_with_inheritance_code_generator.set_root_class_and_ace_file_generation (check_generate_root_class_button.is_selected)
					bridge_with_inheritance_code_generator.set_pattern_info (bridge_with_inheritance_info)
					if bridge_with_inheritance_info.descendant_application_classes_name.count /= bridge_with_inheritance_info.descendant_application_implementation_classes_name.count then
						display_error_dialog (bridge_incorrect_descendant_classes_count_text)
						error_occurred := True
					else
						bridge_with_inheritance_code_generator.generate
					end
				else
					display_error_dialog (incorrect_project_directory_path_text) 
					bridge_with_inheritance_pattern_vbox.project_location_selector.remove_location_text
					error_occurred := True
				end
			end

			if not error_occurred then
				if check_close_wizard_button.is_selected then
					close_window
				else
					create information_dialog.make_with_text (successfull_code_generation)
					information_dialog.set_icon_pixmap (pw_icon_pixmap)
					information_dialog.show_modal_to_window (Current)
				end
			end
		end

feature {NONE} -- Event handling

	display_error_dialog (a_text: STRING) is
			-- Display an error dialog with message `a_text'.
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: not a_text.is_empty
		local
			error_dialog: EV_MESSAGE_DIALOG
		do
			create error_dialog.make_with_text (a_text)
			error_dialog.set_title (error_dialog_title)
			error_dialog.set_pixmap ((create {EV_STOCK_PIXMAPS}).error_pixmap)
			error_dialog.set_buttons (<< (create {EV_DIALOG_CONSTANTS}).ev_ok >>)
			error_dialog.set_default_push_button (error_dialog.button ((create {EV_DIALOG_CONSTANTS}).ev_ok))
			error_dialog.set_icon_pixmap (pw_icon_pixmap)
			error_dialog.show_modal_to_window (Current)
		end

	close_window is
			-- Close window.
			-- (Action performed when the user clicks on the cross in the title bar.)
		do
			destroy;
			(create {EV_ENVIRONMENT}).application.destroy
		end

feature {PW_CONTROL_BOX} -- Implementation (GUI components)

	pattern_vbox: PW_PATTERN_VERTICAL_BOX
			-- Vertical box enabling the users to select the pattern properties
			-- for the future code generation

feature {NONE} -- Implementation (GUI components)

	pw_icon_pixmap: EV_PIXMAP
			-- Pixmap used for the icon appearing in the window and dialog boxes
			-- of the Eiffel Pattern Wizard

	pattern_selector: PW_PATTERN_SELECTOR
			-- Frame containing the tree representation of the pattern classification

	pattern_properties_vbox: EV_VERTICAL_BOX
			-- Vertical box that will contain the pattern-specific `pattern_vbox'

	check_generate_root_class_button: EV_CHECK_BUTTON
			-- Toggle button enabling the user to decide whether the wizard should
			-- generate a root class and an Ace file

	check_close_wizard_button: EV_CHECK_BUTTON
			-- Toggle button enabling the user to decide whether the wizard should
			-- be closed after code generation

	control_box: PW_CONTROL_BOX
			-- Horizontal box with control buttons "Generate", "Cancel"
			-- and buttons "Help" and "About"

invariant

	pattern_selector_not_void: pattern_selector /= Void
	window_not_resizable: not user_can_resize
	pattern_properties_vbox_not_void: pattern_properties_vbox /= Void
	check_generate_root_class_button_not_void: check_generate_root_class_button /= Void
	check_close_wizard_button_not_void: check_close_wizard_button /= Void
	control_box_not_void: control_box /= Void

end
