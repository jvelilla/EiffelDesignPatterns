note

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


class
	APPLICATION

create
	make

feature {NONE} -- Initialization

	make
		local
			l_app: EV_APPLICATION
		do
			create l_app
			prepare
				-- The next instruction launches GUI message processing.
				-- It should be the last instruction of a creation procedure
				-- that initializes GUI objects. Any other processing should
				-- be done either by agents associated with GUI elements
				-- or in a separate processor.
			l_app.launch
				-- No code should appear here,
				-- otherwise GUI message processing will be stuck in SCOOP mode.
		end

	prepare
			-- Prepare the first window to be displayed.
			-- Perform one call to first window to avoid
			-- violation of the invariant of class EV_APPLICATION.
		do
				-- create and initialize the first window.
			create first_window

				-- Show the first window.
				--| TODO: Remove this line if you don't want the first
				--|       window to be shown at the start of the program.
			first_window.show
		end

feature {NONE} -- Implementation

	first_window: MAIN_WINDOW
			-- Main window.

end
