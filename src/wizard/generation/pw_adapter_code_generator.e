note

	description:

		"Adapter pattern code generator"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class PW_ADAPTER_CODE_GENERATOR

inherit

	PW_PATTERN_CODE_GENERATOR

feature {NONE} -- Implementation (Code generation)

	generate_pattern_code
			-- Generate Eiffel classes for this pattern (except the root class).
		do
			generate_target_class
			generate_adaptee_class
			generate_adapter_class
		end

	generate_target_class
			-- Generate target class.
		require
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		deferred
		end

	generate_adaptee_class
			-- Generate adaptee class.
		require
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		deferred
		end

	generate_adapter_class
			-- Generate adapter class.
		require
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		deferred
		end

end
