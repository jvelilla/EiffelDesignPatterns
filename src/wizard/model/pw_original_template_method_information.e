indexing

	description:

		"Information about the Template method pattern needed for the code generation"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_ORIGINAL_TEMPLATE_METHOD_INFORMATION

inherit

	PW_TEMPLATE_METHOD_INFORMATION
		redefine
			is_complete
		end

create

	default_create

feature -- Access

	effective_class_name: STRING
			-- Name of the effective descendant class that provides
			-- an implementation for the template method's deferred steps

feature -- Status report

	is_complete: BOOLEAN is
			-- Is template method information complete
			-- (i.e. ready for code generation)?
		do
			Result := Precursor {PW_TEMPLATE_METHOD_INFORMATION} and effective_class_name /= Void
		ensure then
			definition: Result implies effective_class_name /= Void 
		end

feature -- Element change

	set_effective_class_name (a_name: like effective_class_name) is
			-- Set `effective_class_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			effective_class_name := a_name
		ensure
			effective_class_name_set: effective_class_name = a_name
		end

invariant

	effective_class_name_not_empty_if_not_void: effective_class_name /= Void implies not effective_class_name.is_empty

end
