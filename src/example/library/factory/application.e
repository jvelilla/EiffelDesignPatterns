indexing

	description:

		"Application using the Factory library"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class 

	APPLICATION

inherit

	PRODUCT_CONSTANTS
		export
			{NONE} all
		end

	ANY

create 

	make

feature {NONE} -- Initialization

	make is
			-- Create two clients to create two product families.
		local
			client_1: CLIENT
			client_2: CLIENT
		do
			create client_1.make (product_family_1_id)
			create client_2.make (product_family_2_id)
		end

end
