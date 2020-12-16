note

	description:

		"Application using the Proxy library"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2003/12/19"
	revision: "$Revision: 1.0"

class APPLICATION

create

	make

feature {NONE} -- Initialization

	make
			--
		local
			subject_1: SUBJECT
			subject_2: SUBJECT
		do
			create {REAL_SUBJECT} subject_1.make ([18])
			create {PROXY [REAL_SUBJECT]} subject_2.make ([5])

			subject_1.request
			subject_2.request

			subject_1.set_characteristic ([24])
			subject_2.set_characteristic ([25])

			debug
				if attached ((subject_1.characteristic) @ 1) as item then
					separate item as s do
						io.put_string ( (create {STRING}.make_from_separate (s.out)).out)
					end
			 	end
				io.put_new_line
				if attached ((subject_2.characteristic) @ 1) as item then
					separate item as s do
						io.put_string ( (create {STRING}.make_from_separate (s.out)).out)
					end
			 	end
				io.put_new_line
			end
		end

end
