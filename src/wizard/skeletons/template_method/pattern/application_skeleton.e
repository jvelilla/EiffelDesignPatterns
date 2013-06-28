indexing

	description:

		"Application using the Template method pattern."

	pattern: "Template method"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class <TEMPLATE_METHOD_APPLICATION_CLASS_NAME>

feature -- Template method

	frozen <TEMPLATE_METHOD_NAME> is
			-- Do something.
		require
			ready: ready
		do
			debug
				io.put_string ("Do something -- Template method -- in ")
				io.put_string (generating_type)
				io.put_string (".%N")
			end
			<TEMPLATE_METHOD_IMPLEMENTATION_FEATURES_NAME>
		ensure
			done: done
		end

feature -- Status report

	ready: BOOLEAN is
			-- Are all conditions met for 
			-- feature `do_something' to be called?
		deferred
		end

	done: BOOLEAN is
			-- Has `do_something' done its job?
		deferred
		end

feature {NONE} -- Status report

	<TEMPLATE_METHOD_PARTS_DONE>

feature {NONE} -- Implementation ("Hook" features)

	<TEMPLATE_METHOD_IMPLEMENTATION_FEATURES_CODE>

end
