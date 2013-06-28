indexing

	description:
		"[
			Entry point of the sample introducing the notion of event type
			and illustrating the Eiffel Event library.
		]"

	author: "Volkan Arslan, Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2003/12/19"
	revision: "$Revision: 1.1"

class APPLICATION
	
create

	make

feature -- Initialization

	make is
			-- Create and launch the application.
		local
			application: EV_APPLICATION
			main_window: MAIN_WINDOW
		do
			create application
			default_create
			
			create main_window
			main_window.show
			application.launch
		end

end
