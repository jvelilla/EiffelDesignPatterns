indexing

	description:

		"Application using the Mediator library"

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
			-- Create a mediator and 
			-- change some of its colleagues.
		local
			a_mediator: MEDIATOR [COLLEAGUE]
			a_colleague_1: COLLEAGUE_1
			colleagues: LINKED_LIST [COLLEAGUE]
			a_cursor: CURSOR
		do
			create a_mediator.make
			create a_colleague_1.make (a_mediator)

			a_mediator.extend (a_colleague_1)
			a_mediator.extend (create {COLLEAGUE_1}.make (a_mediator))
			a_mediator.extend (create {COLLEAGUE_2}.make (a_mediator))

			debug
				io.put_string ("Change something in colleagues of mediator:%N")
			end

			colleagues := a_mediator.colleagues
			a_cursor := colleagues.cursor
			from colleagues.start until colleagues.after loop
				colleagues.item.change
				colleagues.forth
			end
			colleagues.go_to (a_cursor)

			a_mediator.remove (a_colleague_1)
		end

end
