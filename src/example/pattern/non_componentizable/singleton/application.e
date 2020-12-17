note

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

feature {NONE}-- Basic operation

	make
			-- Use singleton.
		local
			s1, s2: ONCE_COUNTER
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

			create s1.count
			create s2.count
			check s1 = s2 end
			s1.set_stats (1)
			check s2.stats = s1.stats end
			s1.reset_stats
			check s2.stats = s1.stats end
		end

end
