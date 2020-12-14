note

	description:

		"Shared flyweight"

	pattern: "Flyweight"
	reusable_version: "Flyweight library (see ${PATTERN}/library/flyweight)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class SHARED_FLYWEIGHT

inherit

	FLYWEIGHT
		redefine
			set_external_characteristic
		end

	EXTERNAL_PROPERTY_CONSTANTS
		export
			{NONE} all
		end

create

	make

feature {NONE} -- Initialization

	make (a_characteristic: like characteristic)
			-- Set `characteristic' to `a_characteristic'.
		require
			a_characteristic_in_range: a_characteristic >= minimum_characteristic
										and a_characteristic <= maximum_characteristic
		do
			characteristic := a_characteristic
		ensure
			characteristic_set: characteristic = a_characteristic
		end

feature -- Access

	characteristic: INTEGER
			-- Intrinsic characteristic

feature -- Constants

	Minimum_characteristic: INTEGER = 1
			-- Minimum value for `characteristic'

	Maximum_characteristic: INTEGER = 256
			-- Maximum value for `characteristic'

feature -- Element change

	set_external_characteristic (a_characteristic: like external_characteristic;
									a_context: FLYWEIGHT_CONTEXT)
			-- Set external characteristic of `a_context' to `a_characteristic'.
		do
			Precursor {FLYWEIGHT} (a_characteristic, a_context)
			a_context.set_external_characteristic (a_characteristic, 1)
		end

feature -- Output

	draw (a_context: FLYWEIGHT_CONTEXT) 
			-- Draw shared flyweight according to `a_context'.
		do
			inspect external_characteristic (a_context).code
			when beige then
				io.put_string ("Shared flyweight of intrinsic characteristic: ")
				io.put_integer (characteristic)
				io.put_string ("; external characteristic: beige%N")
			when black then
				io.put_string ("Shared flyweight of intrinsic characteristic: ")
				io.put_integer (characteristic)
				io.put_string ("; external characteristic: black%N")
			when blue then
				io.put_string ("Shared flyweight of intrinsic characteristic: ")
				io.put_integer (characteristic)
				io.put_string ("; external characteristic: blue%N")
			when default_code then
				io.put_string ("Shared flyweight of intrinsic characteristic: ")
				io.put_integer (characteristic)
				io.put_string ("; external characteristic: default%N")
			when green then
				io.put_string ("Shared flyweight of intrinsic characteristic: ")
				io.put_integer (characteristic)
				io.put_string ("; external characteristic: green%N")
			when grey then
				io.put_string ("Shared flyweight of intrinsic characteristic: ")
				io.put_integer (characteristic)
				io.put_string ("; external characteristic: grey%N")
			when red then
				io.put_string ("Shared flyweight of intrinsic characteristic: ")
				io.put_integer (characteristic)
				io.put_string ("; external characteristic: red%N")
			when white then
				io.put_string ("Shared flyweight of intrinsic characteristic: ")
				io.put_integer (characteristic)
				io.put_string ("; external characteristic: white%N")
			when yellow then
				io.put_string ("Shared flyweight of intrinsic characteristic: ")
				io.put_integer (characteristic)
				io.put_string ("; external characteristic: yellow%N")
			end
		end

end
