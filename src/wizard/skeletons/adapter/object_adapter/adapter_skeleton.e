indexing

	description:

		"Adapter of ADAPTEE to be usable as a TARGET"

	pattern: "Object adapter"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class <ADAPTER_CLASS_NAME>

inherit

	<ADAPTER_TARGET_CLASS_NAME>
		redefine
			<ADAPTER_TARGET_FEATURE_NAME>
		end

create

	<ADAPTER_CREATION_PROCEDURE_NAME>

feature {NONE} -- Initialization

	<ADAPTER_CREATION_PROCEDURE_NAME> (an_adaptee: like adaptee) is
			-- Set `adaptee' to `an_adaptee'.
		require
			an_adaptee_not_void: an_adaptee /= Void
		do
			adaptee := an_adaptee
		ensure
			adaptee_set: adaptee = an_adaptee
		end

feature -- Access

	adaptee: <ADAPTER_ADAPTEE_CLASS_NAME>
			-- Object to be adapted to `TARGET'

feature -- Basic operations

	<ADAPTER_TARGET_FEATURE_NAME> is
			-- Perform an operation.
			-- Delegate work to `adaptee'.
		do
			adaptee.<ADAPTER_ADAPTEE_FEATURE_NAME>
		end

invariant

	adaptee_not_void: adaptee /= Void

end
