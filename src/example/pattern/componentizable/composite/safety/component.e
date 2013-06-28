indexing

	description:

		"Component"

	pattern: "Composite (safety version)"
	reusable_version: "Composite library (see ${PATTERN}/library/composite)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class COMPONENT

feature -- Basic Operation

	do_something is
			-- Do something.
		deferred
		end

feature -- Status report

	is_composite: BOOLEAN is
			-- Is component a composite?
		do
			Result := False
		end

end
