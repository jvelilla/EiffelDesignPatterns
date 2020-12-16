note

	description:

		"Application using the Builder design pattern"

	pattern: "Builder"
	reusable_version: "Builder library (see ${PATTERN}/library/builder)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class APPLICATION

create

	make

feature {NONE} -- Initialization

	make 
			-- Creation procedure
		local
			a_builder: MY_BUILDER
			a_client: CLIENT
			my_product: PRODUCT
		do
			create a_builder
			create a_client.make (a_builder)
			a_client.build
			my_product := a_builder.last_product
		end

end
