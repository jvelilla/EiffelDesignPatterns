note

	description:

		"Main window of the sample event application"

	author: "Volkan Arslan, Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2003/01/31"
	revision: "$Revision: 1.0"

class
	MY_DISPLAY2


inherit

	OBSERVER
		undefine
			default_create,
			copy
		end
	EV_TITLED_WINDOW
		rename
			data as window_data
		redefine
			create_interface_objects,
			initialize,
			is_in_default_state
		end

create
	make

feature {NONE}-- Initialization

	make (some_data: like data)
			-- Set `data' to `some_data'.
			-- Initialize GUI and register as an observer of `data'.
		do
			data := some_data
			default_create
			data.add_observer (Current)
			show
			application.launch
		end


	frozen initialize
			-- Build the interface of this window.
		do
			Precursor {EV_TITLED_WINDOW}

				-- Execute 'close_windows' when the user clicks on the cross in the title bar
			close_request_actions.extend (agent on_close)

			build_widgets

			set_title (Window_title)
			set_size (Window_width, Window_height)
			disable_user_resize
		ensure then
			window_title_set: title.is_equal (Window_title)
			window_size_set: width = Window_width and height = Window_height
		end


	frozen create_interface_objects
			-- Create objects
		do
			create application
			create hbox
			create add_button.make_with_text ("Add")
			create remove_button.make_with_text ("Remove")
		end

feature

	hbox: EV_HORIZONTAL_BOX

	add_button: EV_BUTTON
			-- Button with label Add

	remove_button: EV_BUTTON
			-- Button with label Remove

	data: MY_DATA
			-- Data to be observed

feature -- Event handling

	on_add
			-- Action performed when add_button is pressed
		do
			data.add
		end

	on_remove
			-- Action performed when remove_button is pressed
		do
			data.remove
		end


feature -- Observer pattern

	update
			-- Update GUI.
		do
			io.put_string ("Update display.%N")
			-- Something here
		end


feature {NONE} -- Implementation

	build_widgets
			-- Create the GUI elements.
		do
				-- Avoid flicker on some platforms
			lock_update

			add_button.select_actions.extend (agent on_add)
			remove_button.select_actions.extend (agent on_remove)

				-- Cover entire window area with a primitive container.
			hbox.extend (add_button)
			hbox.extend (remove_button)
			extend (hbox)

			-- Allow screen refresh on some platforms
			unlock_update
		end


	on_close
			-- Destroy the application.
		do
			application.destroy
		end

feature {NONE} -- Contract checking

	is_in_default_state: BOOLEAN
			-- Is main window in default state?
		do
			Result := True
		ensure then
			ist_in_default_sate: Result = True
		end


feature {NONE} -- Implementation / Constants

	application: EV_APPLICATION
			-- Application


	Window_title: STRING = "Observer Example"
			-- Title of the window

	Window_width: INTEGER = 700
			-- Width of the window

	Window_height: INTEGER = 500
			-- Height of the window

end
