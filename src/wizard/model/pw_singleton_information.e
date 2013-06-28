indexing

	description:

		"Information about the Singleton pattern needed for the code generation"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_SINGLETON_INFORMATION

inherit

	PW_PATTERN_INFORMATION

create

	default_create

feature -- Access

	class_name: STRING
			-- Name of the singleton class

	access_point_class_name: STRING
			-- Name of the singleton access point class

	creation_procedure_name: STRING
			-- Name of the singleton creation procedure

	access_point_feature_name: STRING
			-- Name of the singleton access point feature

feature -- Status report

	is_complete: BOOLEAN is
			-- Is singleton information complete
			-- (i.e. ready for code generation)?
		do
			Result := (
						class_name /= Void and
						access_point_class_name /= Void and
						creation_procedure_name /= Void and
						access_point_feature_name /= Void
					)
		ensure then
			definition: Result implies (
										class_name /= Void and
										access_point_class_name /= Void and
										creation_procedure_name /= Void and
										access_point_feature_name /= Void
										) 
		end

feature -- Element change

	set_class_name (a_name: like class_name) is
			-- Set `class_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			class_name := a_name
		ensure
			class_name_set: class_name = a_name
		end

	set_access_point_class_name (a_name: like access_point_class_name) is
			-- Set `access_point_class_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			access_point_class_name := a_name
		ensure
			access_point_class_name_set: access_point_class_name = a_name
		end

	set_creation_procedure_name (a_name: like creation_procedure_name) is
			-- Set `creation_procedure_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			creation_procedure_name := a_name
		ensure
			creation_procedure_name_set: creation_procedure_name = a_name
		end

	set_access_point_feature_name (a_name: like access_point_feature_name) is
			-- Set `access_point_feature_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			access_point_feature_name := a_name
		ensure
			access_point_feature_name_set: access_point_feature_name = a_name
		end

invariant

	class_name_not_empty_if_not_void: class_name /= Void implies not class_name.is_empty
	access_point_class_name_not_empty_if_not_void: access_point_class_name /= Void implies not access_point_class_name.is_empty 
	creation_procedure_name_not_empty_if_not_void: creation_procedure_name /= Void implies not creation_procedure_name.is_empty
	access_point_feature_name_not_empty_if_not_void: access_point_feature_name /= Void implies not access_point_feature_name.is_empty

end
