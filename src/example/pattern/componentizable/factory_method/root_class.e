indexing

	description:

		"Example application using the Factory method pattern"

	pattern: "Factory Method"
	reusable_version: "Factory library (see ${PATTERN}/library/factory)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class ROOT_CLASS

create

	make

feature -- Initialization

	make is
			-- Create an instance of `MY_APPLICATION'
			-- and call `do_something' on it,
			-- which uses a factory method internally
			-- to create an object of type `PRODUCT'
			-- on which the operation is actually done.
		local
			my_application: MY_APPLICATION
		do
			create my_application
			my_application.do_something
		end

end

