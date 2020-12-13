note

	description:

	"Application using the Composite design pattern"

	pattern: "Composite (safety version)"
	reusable_version: "Composite library (see ${PATTERN}/library/composite)"
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
			-- Illustrate how to create and use
			-- composite components.
		local
			some_components: LINKED_LIST [COMPONENT]
			a_composite: COMPOSITE
			a_component: COMPONENT
		do
			create some_components.make
			some_components.extend (create {LEAF})

			create a_composite.make
			a_composite.add (create {LEAF})
			a_composite.add (create {LEAF})
			some_components.extend (a_composite)

			across
				some_components as ic
			loop
				a_component := ic.item
				a_component.do_something
				if a_component.is_composite and then
					attached {COMPOSITE} a_component as another_composite then
					another_composite.add (create {LEAF})
				end
			end
		end

end
