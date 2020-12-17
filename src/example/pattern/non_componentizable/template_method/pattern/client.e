note

	description:

		"Client using the Template Method pattern."

	pattern: "Template method"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class CLIENT

create

	make

feature {NONE} -- Implementation

	make 
			-- Create an application,
			-- which uses a template method.
		local
			an_application: APPLICATION
		do
			create {MY_APPLICATION} an_application
			an_application.do_something
		end

end
