note

	description:

		"Useful features"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_SUPPORT

create

	default_create

feature -- Access

	pattern_delivery_directory: STRING
			-- Path to the directory where the Pattern delivery was unzipped
			-- (Value of the environment variable %PATTERN%)
		once
			Result := (create {EXECUTION_ENVIRONMENT}).get ("PATTERN")
			if Result /= Void and then not Result.is_empty then
				if Result.item (Result.count) = '\' then
					Result.remove (Result.count)
				end
			else
				create Result.make_from_string ({EXECUTION_ENVIRONMENT}.current_working_path.parent.parent.utf_8_name)
			end
		ensure
			pattern_delivery_directory_path_not_void: Result /= Void
		end

feature -- Status report

	directory_exists (a_path: READABLE_STRING_GENERAL): BOOLEAN
			-- Does a directory corresponding to path `a_path' exist?
		require
			a_path_not_void: a_path /= Void
			a_path_not_empty: not a_path.is_empty
		do
			Result := (create {DIRECTORY}.make (a_path)).exists
		end

	file_exists (a_path: READABLE_STRING_GENERAL): BOOLEAN
			-- Does a file corresponding to path `a_path' exist?
		require
			a_path_not_void: a_path /= Void
			a_path_not_empty: not a_path.is_empty
		do
			Result := (create {RAW_FILE}.make_with_name (a_path)).exists
		end

feature -- Code generators

	singleton_code_generator: PW_SINGLETON_CODE_GENERATOR
			-- Code generator
		once
			create Result
		ensure
			code_generator_not_void: Result /= Void
		end

	decorator_code_generator: PW_DECORATOR_CODE_GENERATOR
			-- Code generator
		once
			create Result
		ensure
			code_generator_not_void: Result /= Void
		end

	class_adapter_code_generator: PW_CLASS_ADAPTER_CODE_GENERATOR
			-- Code generator
		once
			create Result
		ensure
			code_generator_not_void: Result /= Void
		end

	object_adapter_code_generator: PW_OBJECT_ADAPTER_CODE_GENERATOR
			-- Code generator
		once
			create Result
		ensure
			code_generator_not_void: Result /= Void
		end

	template_method_code_generator: PW_TEMPLATE_METHOD_CODE_GENERATOR
			-- Code generator
		once
			create Result
		ensure
			code_generator_not_void: Result /= Void
		end

	template_method_with_agents_code_generator: PW_TEMPLATE_METHOD_WITH_AGENTS_CODE_GENERATOR
			-- Code generator
		once
			create Result
		ensure
			code_generator_not_void: Result /= Void
		end

	bridge_code_generator: PW_BRIDGE_CODE_GENERATOR
			-- Code generator
		once
			create Result
		ensure
			code_generator_not_void: Result /= Void
		end

	bridge_with_effective_classes_code_generator: PW_BRIDGE_WITH_EFFECTIVE_CLASSES_CODE_GENERATOR
			-- Code generator
		once
			create Result
		ensure
			code_generator_not_void: Result /= Void
		end

	bridge_with_inheritance_code_generator: PW_BRIDGE_WITH_INHERITANCE_CODE_GENERATOR
			-- Code generator
		once
			create Result
		ensure
			code_generator_not_void: Result /= Void
		end

end
