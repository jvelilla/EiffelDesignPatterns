note

	description:

	"Application using the Flyweight library"

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

	make
			-- Create flyweights and display them.
			-- (Show typical use of the Flyweight library.)
		local
			a_composite_flyweight: COMPOSITE_FLYWEIGHT [EXTERNAL_PROPERTY, INTEGER]
			some_shared_flyweights: ARRAY [SHARED_FLYWEIGHT [EXTERNAL_PROPERTY, INTEGER]]
			red_context: FLYWEIGHT_CONTEXT [EXTERNAL_PROPERTY]
			some_other_shared_flyweights: ARRAY [SHARED_FLYWEIGHT [EXTERNAL_PROPERTY, INTEGER]]
			beige_context: FLYWEIGHT_CONTEXT [EXTERNAL_PROPERTY]
		do
			create a_composite_flyweight.make (agent do_something)

				--create some_shared_flyweights.make (1, 4)
			create some_shared_flyweights.make_from_array (<<create {SHARED_FLYWEIGHT [EXTERNAL_PROPERTY, INTEGER]}.make (2),
															create {SHARED_FLYWEIGHT [EXTERNAL_PROPERTY, INTEGER]}.make (36),
															create {SHARED_FLYWEIGHT [EXTERNAL_PROPERTY, INTEGER]}.make (5),
															create {SHARED_FLYWEIGHT [EXTERNAL_PROPERTY, INTEGER]}.make (25)>>)
			a_composite_flyweight.add_flyweights (some_shared_flyweights)

			create red_context.make (create {EXTERNAL_PROPERTY}.make (red))
			debug
				io.put_string ("After inserting some shared flyweights, in red context:%N")
			end
			a_composite_flyweight.do_something (red_context)

				--create some_other_shared_flyweights.make (1, 2)
			create some_other_shared_flyweights.make_from_array (<<create {SHARED_FLYWEIGHT [EXTERNAL_PROPERTY, INTEGER]}.make (18),create {SHARED_FLYWEIGHT [EXTERNAL_PROPERTY, INTEGER]}.make (17)>>)
			a_composite_flyweight.insert_flyweights (some_other_shared_flyweights, 2)

			debug
				io.put_string ("After inserting other shared flyweights, in red context:%N")
			end
			a_composite_flyweight.do_something (Void)

			a_composite_flyweight.set_external_characteristic_range (create {EXTERNAL_PROPERTY}.make (beige), 3, 5)
			debug
				io.put_string ("After changing parts of the context to beige:%N")
			end
			a_composite_flyweight.do_something (Void)

			debug
				io.put_string ("Now with beige context:%N")
			end
			create beige_context.make (create {EXTERNAL_PROPERTY}.make (beige))
			a_composite_flyweight.do_something (beige_context)
		end

feature -- Output

	do_something (a_shared_flyweight: SHARED_FLYWEIGHT [EXTERNAL_PROPERTY, INTEGER];
		a_context: FLYWEIGHT_CONTEXT [EXTERNAL_PROPERTY])
			-- Draw `a_shared_flyweight' according to `a_context'.
		require
			a_shared_flyweight_not_void: a_shared_flyweight /= Void
			a_context_not_void: a_context /= Void
		do
			inspect a_shared_flyweight.external_characteristic (a_context).code
			when beige then
				io.put_string ("Bolt of diameter: ")
				io.put_integer (a_shared_flyweight.characteristic)
				io.put_string ("; color: beige%N")
			when black then
				io.put_string ("Bolt of diameter: ")
				io.put_integer (a_shared_flyweight.characteristic)
				io.put_string ("; color: black%N")
			when blue then
				io.put_string ("Bolt of diameter: ")
				io.put_integer (a_shared_flyweight.characteristic)
				io.put_string ("; color: blue%N")
			when green then
				io.put_string ("Bolt of diameter: ")
				io.put_integer (a_shared_flyweight.characteristic)
				io.put_string ("; color: green%N")
			when grey then
				io.put_string ("Bolt of diameter: ")
				io.put_integer (a_shared_flyweight.characteristic)
				io.put_string ("; color: grey%N")
			when red then
				io.put_string ("Bolt of diameter: ")
				io.put_integer (a_shared_flyweight.characteristic)
				io.put_string ("; color: red%N")
			when white then
				io.put_string ("Bolt of diameter: ")
				io.put_integer (a_shared_flyweight.characteristic)
				io.put_string ("; color: white%N")
			when yellow then
				io.put_string ("Bolt of diameter: ")
				io.put_integer (a_shared_flyweight.characteristic)
				io.put_string ("; color: yellow%N")
			when default_code then
				io.put_string ("Bolt of diameter: ")
				io.put_integer (a_shared_flyweight.characteristic)
				io.put_string ("; color: default%N")
			end
		end

end
