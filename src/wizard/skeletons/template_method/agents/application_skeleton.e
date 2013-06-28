indexing

	description:

		"Application using a Template Method implemented with agents"

	pattern: "Template method"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class <TEMPLATE_METHOD_APPLICATION_CLASS_NAME>

create

	make

feature {NONE} -- Initialization

	<TEMPLATE_METHOD_CREATION_PROCEDURE_NAME> is
			-- Initialize `implementation_procedures'.
		do
			create implementation_procedures.make
		end

feature -- Access

	implementation_procedures: LINKED_LIST [PROCEDURE [ANY, TUPLE]]
			-- Procedures to be called (successively) by `do_something'

feature -- Element change

	extend (a_procedure: PROCEDURE [ANY, TUPLE]) is
			-- Extend `implementation_procedures' with `a_procedure'.
		require
			a_procedure_not_void: a_procedure /= Void
		do
			implementation_procedures.extend (a_procedure)
		ensure
			one_more: implementation_procedures.count = 
						old implementation_procedures.count + 1
			extended: implementation_procedures.last = a_procedure
		end

feature -- Template method

	frozen <TEMPLATE_METHOD_NAME> is
			-- Do something.
		do
			debug
				io.put_string ("Do something -- Template method.%N")
			end

			from
				implementation_procedures.start
			until
				implementation_procedures.after
			loop
				implementation_procedures.item.call ([])
				implementation_procedures.forth
			end
		end

invariant

	implementation_procedures_not_void: implementation_procedures /= Void

end
