indexing

	description:

		"Client using a Template Method implemented with agents"

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

	make is
			-- Create an application,
			-- which uses a template method.
		local
			an_application: APPLICATION
		do
			create an_application.make
			an_application.extend (agent do_something_imp_1)
			an_application.extend (agent do_something_imp_2)
			an_application.do_something
		end

feature {NONE} -- Implementation ("Hook" features)

	do_something_imp_1 is
			-- Do something.
		do
			debug
				io.put_string ("Do something -- First part.%N")
			end
			-- Do something
		end

	do_something_imp_2 is
			-- Do something.
		do
			debug
				io.put_string ("Do something -- Second part.%N")
			end
			-- Do something.
		end

end
