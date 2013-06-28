indexing

	description:

		"Facade"

	pattern: "Facade"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class FACADE

feature -- Basic operation

	r is
			-- Do something.
		do
			(create {A}).ra;
			(create {B}).rb;
			(create {C}).rc
		end

end
