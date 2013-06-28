indexing

	description:

		"Application using a Proxy subject"

	pattern: "Proxy"
	reusable_version: "Proxy library (see ${PATTERN}/library/proxy)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class APPLICATION

create

	make

feature {NONE} -- Initialization

	make is
			-- Use real and proxy subjects. 
		local
			subject_1: SUBJECT
			subject_2: SUBJECT
		do
			create {REAL_SUBJECT} subject_1.make ([18])
			create {PROXY} subject_2.make ([5])

			subject_1.request
			subject_2.request

			subject_1.set_characteristic ([24])
			subject_2.set_characteristic ([25])

			debug
				io.put_string ("Characteristic of subject 1: ")
				io.put_string (((subject_1.characteristic) @ 1).out)
				io.put_new_line
				io.put_string ("Characteristic of subject 2: ")
				io.put_string (((subject_2.characteristic) @ 1).out)
				io.put_new_line
			end
		end

end
