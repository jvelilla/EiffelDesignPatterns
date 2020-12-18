note

	description:

		"Information about the original Bridge pattern needed for the code generation"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_ORIGINAL_BRIDGE_INFORMATION

inherit

	PW_BRIDGE_INFORMATION
		redefine
			is_complete
		end

create

	default_create

feature -- Access

	application_creation_procedure_name: STRING_32
			-- Name of the creation procedure of the application class

feature -- Status report

	is_complete: BOOLEAN
			-- Is bridge information complete
			-- (i.e. ready for code generation)?
		do
			Result := Precursor {PW_BRIDGE_INFORMATION} and application_creation_procedure_name /= Void
		ensure then
			definition: Result implies application_creation_procedure_name /= Void
		end

feature -- Element change

	set_application_creation_procedure_name (a_name: like application_creation_procedure_name)
			-- Set `application_creation_procedure_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			application_creation_procedure_name := a_name
		ensure
			application_creation_procedure_name_set: application_creation_procedure_name = a_name
		end

invariant

	application_creation_procedure_name_not_empty_if_not_void: application_creation_procedure_name /= Void implies not application_creation_procedure_name.is_empty

end
