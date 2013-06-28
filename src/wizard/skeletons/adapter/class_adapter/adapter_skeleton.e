indexing

	description:

		"Adapter of ADAPTEE to be usable as a TARGET"

	pattern: "Class adapter"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class <ADAPTER_CLASS_NAME>

inherit

	<ADAPTER_TARGET_CLASS_NAME>
		undefine
			<ADAPTER_TARGET_FEATURE_NAME>
		end

	--expanded <ADAPTER_ADAPTEE_CLASS_NAME>
	<ADAPTER_ADAPTEE_CLASS_NAME>
		rename
			<ADAPTER_ADAPTEE_FEATURE_NAME> as <ADAPTER_TARGET_FEATURE_NAME>
		export
			{NONE} all
		end

end
