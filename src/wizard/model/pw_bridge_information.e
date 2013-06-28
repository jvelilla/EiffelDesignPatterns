indexing

	description:

		"Information about the Bridge pattern needed for the code generation"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class PW_BRIDGE_INFORMATION

inherit

	PW_PATTERN_INFORMATION

feature -- Access

	application_class_name: STRING
			-- Name of the application class

	application_feature_name: STRING
			-- Name of the feature of the application class

	descendant_application_classes_name: LINKED_LIST [STRING]
			-- Name of the descendant application classes

	application_implementation_class_name: STRING
			-- Name of the application implementation class

	application_implementation_feature_name: STRING
			-- Name of the feature of the application implementation class

	descendant_application_implementation_classes_name: LINKED_LIST [STRING]
			-- Name of the descendant application implementation classes

feature -- Status report

	is_complete: BOOLEAN is
			-- Is bridge information complete
			-- (i.e. ready for code generation)?
		do
			Result := (
						application_class_name /= Void and
						application_feature_name /= Void and
						descendant_application_classes_name /= Void and
						application_implementation_class_name /= Void and
						application_implementation_feature_name /= Void and
						descendant_application_implementation_classes_name /= Void
					)
		ensure then
			definition: Result implies (
											application_class_name /= Void and
											application_feature_name /= Void and
											descendant_application_classes_name /= Void and
											application_implementation_class_name /= Void and
											application_implementation_feature_name /= Void and
											descendant_application_implementation_classes_name /= Void
										) 
		end

feature -- Element change

	set_application_class_name (a_name: like application_class_name) is
			-- Set `application_class_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			application_class_name := a_name
		ensure
			application_class_name_set: application_class_name = a_name
		end

	set_application_feature_name (a_name: like application_feature_name) is
			-- Set `application_feature_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			application_feature_name := a_name
		ensure
			application_feature_name_set: application_feature_name = a_name
		end

	set_descendant_application_classes_name (a_list: like descendant_application_classes_name) is
			-- Set `descendant_application_classes_name' to `a_list'.
		require
			a_list_not_void: a_list /= Void
			a_list_not_empty: not a_list.is_empty
			no_void_name: not a_list.has (Void)
		do
			descendant_application_classes_name := a_list
		ensure
			descendant_application_classes_name_set: descendant_application_classes_name = a_list
		end

	set_application_implementation_class_name (a_name: like application_implementation_class_name) is
			-- Set `application_implementation_class_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			application_implementation_class_name := a_name
		ensure
			application_implementation_class_name_set: application_implementation_class_name = a_name
		end

	set_application_implementation_feature_name (a_name: like application_implementation_feature_name) is
			-- Set `application_implementation_feature_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			application_implementation_feature_name := a_name
		ensure
			application_implementation_feature_name_set: application_implementation_feature_name = a_name
		end

	set_descendant_application_implementation_classes_name (a_list: like descendant_application_implementation_classes_name) is
			-- Set `descendant_application_implementation_classes_name' to `a_list'.
		require
			a_list_not_void: a_list /= Void
			a_list_not_empty: not a_list.is_empty
			no_void_name: not a_list.has (Void)
		do
			descendant_application_implementation_classes_name := a_list
		ensure
			descendant_application_implementation_classes_name_set: descendant_application_implementation_classes_name = a_list
		end

invariant

	application_class_name_not_empty_if_not_void: application_class_name /= Void implies not application_class_name.is_empty
	application_feature_name_not_empty_if_not_void: application_feature_name /= Void implies not application_feature_name.is_empty
	descendant_application_classes_name_not_empty_if_not_void: descendant_application_classes_name /= Void implies not descendant_application_classes_name.is_empty and not descendant_application_classes_name.has (Void)
	application_implementation_class_name_not_empty_if_not_void: application_implementation_class_name /= Void implies not application_implementation_class_name.is_empty
	application_implementation_feature_name_not_empty_if_not_void: application_implementation_feature_name /= Void implies not application_implementation_feature_name.is_empty
	descendant_application_implementation_classes_name_not_empty_if_not_void: descendant_application_implementation_classes_name /= Void implies not descendant_application_implementation_classes_name.is_empty and not descendant_application_classes_name.has (Void)

end
