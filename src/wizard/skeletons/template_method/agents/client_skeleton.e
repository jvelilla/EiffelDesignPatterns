indexing

	description:

		"Client using a Template Method implemented with agents"

	pattern: "Template method"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class <TEMPLATE_METHOD_CLIENT_CLASS_NAME>

create

	make

feature {NONE} -- Implementation

	make is
			-- Create an application,
			-- which uses a template method.
		local
			an_application: <TEMPLATE_METHOD_APPLICATION_CLASS_NAME>
		do
			create an_application.<TEMPLATE_METHOD_CREATION_PROCEDURE_NAME>

			<TEMPLATE_METHOD_IMPLEMENTATION_FEATURES_NAME>

			an_application.<TEMPLATE_METHOD_NAME>
		end

feature {NONE} -- Implementation ("Hook" features)

	<TEMPLATE_METHOD_IMPLEMENTATION_FEATURES_CODE>

end
