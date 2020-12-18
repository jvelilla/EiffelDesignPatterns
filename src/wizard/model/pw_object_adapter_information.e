note

	description:

		"Information about the Object Adapter pattern needed for the code generation"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_OBJECT_ADAPTER_INFORMATION

inherit

	PW_ADAPTER_INFORMATION
		redefine
			is_complete
		end

create

	default_create

feature -- Access

	adapter_creation_procedure_name: STRING_32
			-- Name of the creation procedure of the adapter class

feature -- Status report

	is_complete: BOOLEAN
			-- Is object adapter information complete
			-- (i.e. ready for code generation)?
		do
			Result := Precursor {PW_ADAPTER_INFORMATION} and adapter_creation_procedure_name /= Void
		ensure then
			definition: Result implies adapter_creation_procedure_name /= Void
		end

feature -- Element change

	set_adapter_creation_procedure_name (a_name: like adapter_creation_procedure_name) 
			-- Set `adapter_creation_procedure_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			adapter_creation_procedure_name := a_name
		ensure
			adapter_creation_procedure_name_set: adapter_creation_procedure_name = a_name
		end

invariant

	adapter_creation_procedure_name_not_empty_if_not_void: adapter_creation_procedure_name /= Void implies not adapter_creation_procedure_name.is_empty

end
