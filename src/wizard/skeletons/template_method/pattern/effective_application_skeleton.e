indexing

	description:

		"Particular application using the Template method pattern."

	pattern: "Template method"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class <TEMPLATE_METHOD_EFFECTIVE_APPLICATION_CLASS_NAME>

inherit

	<TEMPLATE_METHOD_APPLICATION_CLASS_NAME>

feature -- Status report

	ready: BOOLEAN is True
			-- Are all conditions met for 
			-- feature `do_something' to be called?

	done: BOOLEAN
			-- Has `do_something' done its job?

feature {NONE} -- Status report

	<TEMPLATE_METHOD_EFFECTIVE_PARTS_DONE>

feature {NONE} -- Implementation ("Hook" features)

	<TEMPLATE_METHOD_EFFECTIVE_IMPLEMENTATION_FEATURES_CODE>

end

