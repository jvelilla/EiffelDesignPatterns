indexing

	description:

		"Main window of the sample event application"

	author: "Volkan Arslan, Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2003/01/31"
	revision: "$Revision: 1.0"

class MAIN_WINDOW

inherit

	EV_TITLED_WINDOW
		redefine
			initialize,
			is_in_default_state
		end

create

	default_create

feature -- Initialization	

	initialize is
			-- Build the interface of this window.
		do
			Precursor {EV_TITLED_WINDOW}

				-- Execute 'close_windows' when the user clicks on the cross in the title bar
			close_request_actions.extend (agent destroy_application)
			
			build_widgets
			
			set_title (Window_title)
			set_size (Window_width, Window_height)
			disable_user_resize
		ensure then
			window_title_set: title.is_equal (Window_title)
			window_size_set: width = Window_width and height = Window_height
		end
		
feature {NONE} -- Implementation

	build_widgets is
			-- Create the GUI elements.
		require
			enclosing_box_not_yet_created: enclosing_box = Void
			start_button_not_yet_created: start_button = Void
		do
				-- Avoid flicker on some platforms
			lock_update
			
				-- Cover entire window area with a primitive container.
			create enclosing_box
			extend (enclosing_box)

				-- Add `start' button primitive
			create start_button.make_with_text ("Start the application")

			start_button.select_actions.extend (agent start_actions)

			enclosing_box.extend (start_button)
			enclosing_box.set_item_x_position (start_button, 120)
			enclosing_box.set_item_y_position (start_button, 115)


			create application_window_1
			create application_window_2
			create application_window_3
			
			application_window_1.set_title ("Event application: client window 1")
			application_window_2.set_title ("Event application: client window 2")
			application_window_3.set_title ("Event application: client window 3")

			application_window_1.show
			application_window_2.show
			application_window_3.show

			-- Allow screen refresh on some platforms
			unlock_update
		ensure
			enclosing_box_created: enclosing_box /= void
			start_button_created: start_button /= void
			application_window_1_not_void: application_window_1 /= Void
			application_window_2_not_void: application_window_2 /= Void
			application_window_3_not_void: application_window_3 /= Void
		end

	start_actions is
			-- Start the appropriate actions.
		local
			info_dialog: EV_INFORMATION_DIALOG
			temperature_action_1: PROCEDURE [APPLICATION_WINDOW, TUPLE [INTEGER]]
			humidity_action_1: PROCEDURE [APPLICATION_WINDOW, TUPLE [INTEGER]]
			humidity_action_2: PROCEDURE [APPLICATION_WINDOW, TUPLE [INTEGER]]
			pressure_action_2: PROCEDURE [APPLICATION_WINDOW, TUPLE [INTEGER]]
			temperature_action_3: PROCEDURE [APPLICATION_WINDOW, TUPLE [INTEGER]]
			humidity_action_3: PROCEDURE [APPLICATION_WINDOW, TUPLE [INTEGER]]
			pressure_action_3: PROCEDURE [APPLICATION_WINDOW, TUPLE [INTEGER]]
		do
			Sensor.temperature_event.wipe_out
			Sensor.humidity_event.wipe_out
			Sensor.pressure_event.wipe_out

			Sensor.temperature_event.restore_subscription
			Sensor.humidity_event.restore_subscription
			Sensor.pressure_event.restore_subscription

			create info_dialog.make_with_text ("Client window 1 subscribed to temperature and humidity%NClient window 2 subscribed to humidity and pressure%NClient window 3 subscribed to temperature, humidity and pressure%N%NTo proceed please press OK button!")
			info_dialog.show_modal_to_window (Current)			

				-- subscribe to temperature and humidity in application_window_1
			temperature_action_1 := agent application_window_1.display_temperature (?)
			Sensor.temperature_event.subscribe (temperature_action_1)
			humidity_action_1 := agent application_window_1.display_humidity (?)
			Sensor.humidity_event.subscribe (humidity_action_1)

				-- subscribe to humidity and pressure in application_window_2
			humidity_action_2 := agent application_window_2.display_humidity (?)
			Sensor.humidity_event.subscribe (humidity_action_2)
			pressure_action_2 := agent application_window_2.display_pressure (?)
			Sensor.pressure_event.subscribe (pressure_action_2)

				-- subscribe to temperature, humidity and pressure in application_window_3
			temperature_action_3 := agent application_window_3.display_temperature (?)
			Sensor.temperature_event.subscribe (temperature_action_3)
			humidity_action_3 := agent application_window_3.display_humidity (?)
			Sensor.humidity_event.subscribe (humidity_action_3)
			pressure_action_3 := agent application_window_3.display_pressure (?)
			Sensor.pressure_event.subscribe (pressure_action_3)

			change_values

			create info_dialog.make_with_text ("Now client window 1 unsubscribes temperature%N%NTo proceed please press OK button!")
			info_dialog.show_modal_to_window (Current)

			reset_widgets
			Sensor.temperature_event.unsubscribe (temperature_action_1)
			change_values


			create info_dialog.make_with_text ("Now all subscription are suspended%N To proceed please press OK button!")
			info_dialog.show_modal_to_window (Current)

			reset_widgets
			Sensor.temperature_event.suspend_subscription
			Sensor.humidity_event.suspend_subscription
			Sensor.pressure_event.suspend_subscription	
			change_values
		end

	change_values is
			-- Change values of `Sensor' object.
		local
			i: INTEGER
			j: INTEGER	
			k: INTEGER
		do
			from
				i := 50
				j := 70
				k := 2500
			until
				i > 60
			loop
				if i \\ 2 = 0 then
					sensor.set_temperature (i)
				end
				if j \\ 2 = 1 then
					sensor.set_humidity (j)
				end
				sensor.set_pressure (k)
				i := i + 1
				j := j + 1
				k := k + 1
				Application.process_events
				wait
			end
		end

	wait is
			-- Wait for `Iterations' before proceeding
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i = Iterations
			loop
				i := i + 1
			end
		end

	reset_widgets is
			-- Reset contents of all widgets.
		do
			application_window_1.reset_widget
			application_window_2.reset_widget
			application_window_3.reset_widget
		end

	destroy_application is
			-- Destroy the application.
		do
			Application.destroy
		end	

feature {NONE} -- Contract checking

	is_in_default_state: BOOLEAN is
			-- Is main window in default state?
		do
			Result := True
		ensure then
			ist_in_default_sate: Result = True
		end

feature {NONE} -- Implementation / widgets 

	enclosing_box: EV_FIXED
			-- Invisible Primitives Container

	start_button: EV_BUTTON
			-- Start button

	application_window_1: APPLICATION_WINDOW
			-- application window 1

	application_window_2: APPLICATION_WINDOW
			-- application window 2

	application_window_3: APPLICATION_WINDOW
			-- application window 3

feature {NONE} -- Implementation / Constants

	Application: EV_APPLICATION is
			-- Application
		once
			Result :=(create {EV_ENVIRONMENT}).application
		ensure 
			application_created: Result /= Void
		end

	Sensor: SENSOR is
			-- Publisher
		once
			create Result.make
		ensure
			sensor_created: Result /= Void
		end

	Iterations: INTEGER is 2000000
			-- Iterations

	Window_title: STRING is "Event application: main window"
			-- Title of the window

	Window_width: INTEGER is 400
			-- Width of the window

	Window_height: INTEGER is 300
			-- Height of the window

end
