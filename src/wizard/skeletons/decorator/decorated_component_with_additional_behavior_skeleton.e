note

	description:
		"[
			Second kind of concrete decorated component
			('Concrete Decorator') 
			with redefined operation (additional behavior)
		]"

	pattern: "Decorator"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class DECORATED_COMPONENT_B

inherit

	<DECORATOR_DECORATED_COMPONENT_CLASS_NAME>
		redefine
			<DECORATOR_FEATURE_NAME>
		end

create

	<DECORATOR_DECORATED_COMPONENT_CREATION_PROCEDURE_NAME>

feature -- Basic Operation

	<DECORATOR_FEATURE_NAME> 
			-- Do something.
		do
			Precursor {<DECORATOR_DECORATED_COMPONENT_CLASS_NAME>}
			<DECORATOR_ADDITIONAL_FEATURE_NAME>
		end

feature {NONE} -- Implementation

	<DECORATOR_ADDITIONAL_FEATURE_NAME> 
			-- Do something more.
		do
			-- Do something more than just
			-- `do_something'.
			debug
				io.put_string ("Do something more...%N")
			end
		end

end
