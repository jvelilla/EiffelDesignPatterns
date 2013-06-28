indexing

	description:

		"Application using the Flyweight pattern"

	pattern: "Flyweight"
	reusable_version: "Flyweight library (see ${PATTERN}/library/flyweight)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class APPLICATION

inherit

	EXTERNAL_PROPERTY_CONSTANTS
		export
			{NONE} all
		end

	ANY

create

	make

feature {NONE} -- Initialization

	make is
			-- Create flyweights and display them.
		local
			a_composite_flyweight: COMPOSITE_FLYWEIGHT
			some_shared_flyweights: ARRAY [SHARED_FLYWEIGHT]
			red_context: FLYWEIGHT_CONTEXT
			some_other_shared_flyweights: ARRAY [SHARED_FLYWEIGHT]
			beige_context: FLYWEIGHT_CONTEXT
		do
			create a_composite_flyweight.make

			create some_shared_flyweights.make (1, 4)
			some_shared_flyweights.put (create {SHARED_FLYWEIGHT}.make (2), 1)
			some_shared_flyweights.put (create {SHARED_FLYWEIGHT}.make (36), 2)
			some_shared_flyweights.put (create {SHARED_FLYWEIGHT}.make (5), 3)
			some_shared_flyweights.put (create {SHARED_FLYWEIGHT}.make (25), 4)
			a_composite_flyweight.add_flyweights (some_shared_flyweights)

			create red_context.make (create {EXTERNAL_PROPERTY}.make (red))
			debug
				io.put_string ("After inserting some shared flyweights, in red context:%N")
			end
			a_composite_flyweight.draw (red_context)

			create some_other_shared_flyweights.make (1, 2)
			some_other_shared_flyweights.put (create {SHARED_FLYWEIGHT}.make (18), 1)
			some_other_shared_flyweights.put (create {SHARED_FLYWEIGHT}.make (17), 2)
			a_composite_flyweight.insert_flyweights (some_other_shared_flyweights, 2)

			debug
				io.put_string ("After inserting other shared flyweights, in red context:%N")
			end
			a_composite_flyweight.draw (Void)

			a_composite_flyweight.set_external_characteristic_range (create {EXTERNAL_PROPERTY}.make (beige), 3, 5)
			debug
				io.put_string ("After changing parts of the context to beige:%N")
			end
			a_composite_flyweight.draw (Void)

			debug
				io.put_string ("Now with beige context:%N")
			end
			create beige_context.make (create {EXTERNAL_PROPERTY}.make (beige))
			a_composite_flyweight.draw (beige_context)
		end

end
