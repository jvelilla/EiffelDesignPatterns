indexing

	description:

		"Particular observer"

	pattern: "Observer"
	reusable_version: "Event library (see ${PATTERN}/library/event)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class MY_DISPLAY

inherit

	OBSERVER
		undefine
			default_create,
			copy
		end

	EV_TITLED_WINDOW
		rename
			data as window_data
		end

create

	make

feature -- Initialization

	make (some_data: like data) is
			-- Set `data' to `some_data'.
			-- Initialize GUI and register as an observer of `data'.
		local
			hbox: EV_HORIZONTAL_BOX
		do
			data := some_data

			create application
			make_with_title ("Observer example")
			set_minimum_width (250)
			set_minimum_height (75)
			create hbox
			create add_button.make_with_text_and_action ("Add", agent on_add)
			create remove_button.make_with_text_and_action ("Remove", agent on_remove)
			data.add_observer (Current)
			hbox.extend (add_button)
			hbox.extend (remove_button)
			extend (hbox)
			close_request_actions.extend (agent on_close)
			show
			application.launch
		end

feature -- Access

	add_button: EV_BUTTON
			-- Button with label Add

	remove_button: EV_BUTTON
			-- Button with label Remove

	data: MY_DATA
			-- Data to be observed

feature -- Event handling

	on_add is
			-- Action performed when add_button is pressed
		do
			data.add
		end

	on_remove is
			-- Action performed when remove_button is pressed
		do
			data.remove
		end

	on_close is
			-- Action performed when window is closed
		do
			application.destroy
		end

feature -- Observer pattern

	update is
			-- Update GUI.
		do
			io.put_string ("Update display.%N")
			-- Something here
		end

feature {NONE} -- Implementation

	application: EV_APPLICATION
			-- Graphical application

invariant

	data_not_void: data /= Void

end
