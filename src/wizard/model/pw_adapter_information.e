indexing

	description:

		"Information about the Adapter pattern needed for the code generation"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class PW_ADAPTER_INFORMATION

inherit

	PW_PATTERN_INFORMATION

feature -- Access

	target_class_name: STRING
			-- Name of the target class

	target_feature_name: STRING
			-- Feature name of the target class

	adaptee_class_name: STRING
			-- Name of the adaptee class

	adaptee_feature_name: STRING
			-- Feature name of the adaptee class

	adapter_class_name: STRING
			-- Name of the adapter class

feature -- Status report

	is_complete: BOOLEAN is
			-- Is adapter information complete
			-- (i.e. ready for code generation)?
		do
			Result := (
						target_class_name /= Void and
						target_feature_name /= Void and
						adaptee_class_name /= Void and
						adaptee_feature_name /= Void and
						adapter_class_name /= Void
					)
		ensure then
			definition: Result implies (
											target_class_name /= Void and
											target_feature_name /= Void and
											adaptee_class_name /= Void and
											adaptee_feature_name /= Void and
											adapter_class_name /= Void
										) 
		end

feature -- Element change

	set_target_class_name (a_name: like target_class_name) is
			-- Set `target_class_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			target_class_name := a_name
		ensure
			target_class_name_set: target_class_name = a_name
		end

	set_target_feature_name (a_name: like target_feature_name) is
			-- Set `target_feature_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			target_feature_name := a_name
		ensure
			target_feature_name_set: target_feature_name = a_name
		end

	set_adaptee_class_name (a_name: like adaptee_class_name) is
			-- Set `adaptee_class_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			adaptee_class_name := a_name
		ensure
			adaptee_class_name_set: adaptee_class_name = a_name
		end

	set_adaptee_feature_name (a_name: like adaptee_feature_name) is
			-- Set `adaptee_feature_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			adaptee_feature_name := a_name
		ensure
			adaptee_feature_name_set: adaptee_feature_name = a_name
		end

	set_adapter_class_name (a_name: like adapter_class_name) is
			-- Set `adapter_class_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			adapter_class_name := a_name
		ensure
			adapter_class_name_set: adapter_class_name = a_name
		end

invariant

	target_class_name_not_empty_if_not_void: target_class_name /= Void implies not target_class_name.is_empty
	target_feature_name_not_empty_if_not_void: target_feature_name /= Void implies not target_feature_name.is_empty
	adaptee_class_name_not_empty_if_not_void: adaptee_class_name /= Void implies not adaptee_class_name.is_empty
	adaptee_feature_name_not_empty_if_not_void: adaptee_feature_name /= Void implies not adaptee_feature_name.is_empty
	adapter_class_name_not_empty_if_not_void: adapter_class_name /= Void implies not adapter_class_name.is_empty

end
