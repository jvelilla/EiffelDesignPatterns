indexing

	description:

		"Eiffel Pattern Wizard"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PATTERN_WIZARD

inherit

	EV_APPLICATION

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

create

	make_and_launch

feature -- Initialization

	make_and_launch is
			-- Initialize and launch application.
		local
			error_dialog: EV_ERROR_DIALOG
		do
			default_create
			prepare

				-- Check that the environment variable $PATTERN has been set.
			if pattern_delivery_directory.is_empty then
				create error_dialog.make_with_text (error_pattern_environment_variable_not_defined_text)
				error_dialog.set_title (error_dialog_title)
				error_dialog.set_pixmap ((create {EV_STOCK_PIXMAPS}).error_pixmap)
				error_dialog.set_buttons_and_actions (<< (create {EV_DIALOG_CONSTANTS}).ev_ok >>, << agent destroy >>)
				error_dialog.set_default_push_button (error_dialog.button ((create {EV_DIALOG_CONSTANTS}).ev_ok))
				error_dialog.show_modal_to_window (initial_window)
			else
				launch
			end
		end

	prepare is
			-- Prepare the initial window to be displayed.
			--| Perform one call to initial window in order to
			--| avoid to violate the invariant of class EV_APPLICATION.
		do
				-- Create and initialize the initial window.
			create initial_window

				-- Show the initial window.
			initial_window.show
		end

feature -- Access (GUI components)

	initial_window: PW_INITIAL_WINDOW
			-- Initial window of the Pattern Wizard

invariant

	initial_window_not_void: initial_window /= Void

end
