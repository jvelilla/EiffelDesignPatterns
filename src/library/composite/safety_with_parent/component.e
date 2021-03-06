note

	description:

		"Component"

	library: "Composite library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class COMPONENT [G]

feature -- Basic Operation

	do_something
			-- Do something.
		deferred
		end

feature -- Status report

	is_composite: BOOLEAN
			-- Is component a composite?
		do
			Result := False
		end

feature -- Access

	parent: detachable COMPOSITE [G]
			-- Parent component, which must be a composite

feature {COMPOSITE} -- Status setting

	set_parent (a_parent: like parent)
			-- Set `parent' to `a_parent'.
		do
			parent := a_parent
		ensure
			parent_set: parent = a_parent
		end

invariant

	parent_consistent: attached parent as l_parent implies l_parent.has (Current)

end
