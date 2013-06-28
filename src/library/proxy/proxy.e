indexing

	description:

		"Virtual proxy"

	library: "Proxy library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PROXY [G -> SUBJECT create make end]

inherit

	SUBJECT

create

	make

feature {NONE} -- Initialization

	make (a_characteristic: like characteristic) is
			-- Initialize subject with `a_characteristic'.
		do
			cached_characteristic := a_characteristic
		ensure then
			cached_characteristic_set: cached_characteristic = a_characteristic
		end

feature -- Access

	characteristic: TUPLE is
			-- Characteristic of a subject
		do
			debug
				io.put_string ("Characteristic of cached subject: ")
				io.put_string ((cached_characteristic @ 1).out)
				io.put_new_line
			end
			Result := cached_characteristic
		ensure then
			is_cached_characteristic: Result = cached_characteristic
		end

feature -- Basic operations

	request is
			-- Request something on current subject.
		do
			debug
				io.put_string ("Request on proxy subject with characteristic: ")
				io.put_string ((characteristic @ 1).out)
				io.put_new_line
			end
			subject.request
		end

	request_with_args (args: TUPLE) is
			-- Request something on current subject using `args'.
		do
			debug
				io.put_string ("Request on proxy subject with characteristic: ")
				io.put_string ((characteristic @ 1).out)
				io.put_string ("; args: ")
				io.put_string ((args @ 1).out)
				io.put_new_line
			end
			subject.request_with_args (args)
		end

feature -- Status setting

	set_characteristic (a_characteristic: like characteristic) is
			-- Set `characteristic' to `a_characteristic'.
		do
			debug
				io.put_string ("Set characteristic of proxy subject to: ")
				io.put_string ((a_characteristic @ 1).out)
				io.put_new_line
			end
			subject.set_characteristic (a_characteristic)
			cached_characteristic := a_characteristic
		ensure then
			cached_characteristic_set: cached_characteristic = a_characteristic
		end

feature {NONE} -- Implementation

	subject: G is
			-- Subject
		do
			if actual_subject = Void then
				create actual_subject.make (cached_characteristic)
				cached_characteristic := actual_subject.characteristic
			end
			Result := actual_subject
		ensure
			subject_not_void: Result /= Void
			is_actual_subject: Result = actual_subject
			cached_characteristic_not_void: cached_characteristic /= Void
		end

	actual_subject: G
			-- Actual subject
			--|Loaded only when needed

	cached_characteristic: like characteristic
			-- Cache of characteristic of actual subject

invariant

	cached_characteristic_not_void: cached_characteristic /= Void
	consistent: actual_subject /= Void implies 
			cached_characteristic = actual_subject.characteristic

end
