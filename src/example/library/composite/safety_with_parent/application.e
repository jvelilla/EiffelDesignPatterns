indexing

	description:

		"Application using the Composite library"

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
			-- Illustrate how to create and use
			-- composite components.
		local
			some_components: LINKED_LIST [COMPONENT [LEAF]]
			a_composite: COMPOSITE [LEAF]
			a_component: COMPONENT [LEAF]
			another_composite: COMPOSITE [LEAF]
		do
			create some_components.make
			some_components.extend (create {LEAF})

			create a_composite.make
			a_composite.add (create {LEAF})
			a_composite.add (create {LEAF})
			some_components.extend (a_composite)

			from
				some_components.start
			until
				some_components.after
			loop
				a_component := some_components.item
				a_component.do_something
				if a_component.is_composite then
					another_composite ?= a_component
					check
						another_composite_not_void: another_composite /= Void
					end
					another_composite.add (create {LEAF})
				end
				some_components.forth
			end
		end

end
