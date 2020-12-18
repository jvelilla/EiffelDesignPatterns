note

	description:

		"Information about the Template method with agents pattern needed for the code generation"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_TEMPLATE_METHOD_WITH_AGENTS_INFORMATION

inherit

	PW_TEMPLATE_METHOD_INFORMATION
		redefine
			is_complete
		end

create

	default_create

feature -- Access

	creation_procedure_name: STRING_32
			-- Name of the creation procedure of the application class

	client_class_name: STRING_32
			-- Name of the client class that defines the implementation features
			-- for the template method's deferred steps

feature -- Status report

	is_complete: BOOLEAN
			-- Is template method information complete
			-- (i.e. ready for code generation)?
		do
			Result := (
						Precursor {PW_TEMPLATE_METHOD_INFORMATION} and
						creation_procedure_name /= Void and
						client_class_name /= Void
					)
		ensure then
			definition: Result implies (
											creation_procedure_name /= Void and
											client_class_name /= Void
										)
		end

feature -- Element change

	set_creation_procedure_name (a_name: like creation_procedure_name)
			-- Set `creation_procedure_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			creation_procedure_name := a_name
		ensure
			creation_procedure_name_set: creation_procedure_name = a_name
		end

	set_client_class_name (a_name: like client_class_name)
			-- Set `client_class_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			client_class_name := a_name
		ensure
			client_class_name_set: client_class_name = a_name
		end

invariant

	creation_procedure_name_not_empty_if_not_void: creation_procedure_name /= Void implies not creation_procedure_name.is_empty
	client_class_name_not_empty_if_not_void: client_class_name /= Void implies not client_class_name.is_empty

end
