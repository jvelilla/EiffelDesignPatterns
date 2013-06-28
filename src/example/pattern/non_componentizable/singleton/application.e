indexing

	description:

		"Application using the Singleton pattern"

	pattern: "Singleton"
	author: "Eric Bezault, Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class APPLICATION

inherit

	MY_SHARED_SINGLETON

create

	make

feature -- Basic operation

	make is
			-- Use singleton.
		do
			singleton.do_nothing
			debug
				io.put_string ("Used singleton.%N")
			end
			if singleton_created then
				io.put_string ("Singleton created.%N")
			end
			singleton.do_nothing
			debug
				io.put_string ("Used singleton again.")
			end
		end

end
