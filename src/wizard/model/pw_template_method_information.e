note

	description:

		"Information about the Template method pattern needed for the code generation"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class PW_TEMPLATE_METHOD_INFORMATION

inherit

	PW_PATTERN_INFORMATION

feature -- Access

	class_name: STRING_32
			-- Name of the class containing the template method

	template_method_name: STRING_32
			-- Name of the template method

	implementation_features_name: LINKED_LIST [STRING_32]
			-- Name of the template method's implementation features


feature -- Status report

	is_complete: BOOLEAN
			-- Is template method information complete
			-- (i.e. ready for code generation)?
		do
			Result := (
						class_name /= Void and
						template_method_name /= Void and
						implementation_features_name /= Void
					)
		ensure then
			definition: Result implies (
											class_name /= Void and
											template_method_name /= Void and
											implementation_features_name /= Void
										)
		end

feature -- Element change

	set_class_name (a_name: like class_name)
			-- Set `class_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			class_name := a_name
		ensure
			class_name_set: class_name = a_name
		end

	set_template_method_name (a_name: like template_method_name)
			-- Set `template_method_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			template_method_name := a_name
		ensure
			template_method_name_set: template_method_name = a_name
		end

	set_implementation_features_name (a_list: like implementation_features_name)
			-- Set `implementation_features_name' to `a_list'.
		require
			a_list_not_void: a_list /= Void
			a_list_not_empty: not a_list.is_empty
			no_void_name: not a_list.has (Void)
		do
			implementation_features_name := a_list
		ensure
			implementation_features_name_set: implementation_features_name = a_list
		end

invariant

	class_name_not_empty_if_not_void: class_name /= Void implies not class_name.is_empty
	template_method_name_not_empty_if_not_void: template_method_name /= Void implies not template_method_name.is_empty
	implementation_features_name_not_empty_if_not_void: implementation_features_name /= Void implies not implementation_features_name.is_empty and not implementation_features_name.has (Void)

end
