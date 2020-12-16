note

	description:

		"Virtual proxy"

	pattern: "Proxy"
	reusable_version: "Proxy library (see ${PATTERN}/library/proxy)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PROXY

inherit

	SUBJECT

create

	make

feature {NONE} -- Initialization

	make (a_characteristic: like characteristic)
			-- Initialize subject with `a_characteristic'.
		do
			cached_characteristic := a_characteristic
		ensure then
			cached_characteristic_set: cached_characteristic = a_characteristic
		end

feature -- Access

	characteristic: TUPLE
			-- Characteristic of a subject
		do
			debug
				io.put_string ("Characteristic of cached subject: ")
				if attached ( cached_characteristic @ 1) as item then
					separate item as s do
						io.put_string ((create {STRING}.make_from_separate (s.out)).out)
					end
				end
				io.put_new_line
			end
			Result := cached_characteristic
		ensure then
			is_cached_characteristic: Result = cached_characteristic
		end

feature -- Basic operations

	request
			-- Request something on current subject.
		do
			debug
				io.put_string ("Request on proxy subject with characteristic: ")
				if attached ( characteristic @ 1) as item then
					separate item as s do
						io.put_string ((create {STRING}.make_from_separate (s.out)).out)
					end
				end
				io.put_new_line
			end
			subject.request
		end

	request_with_args (args: TUPLE)
			-- Request something on current subject using `args'.
		do
			debug
				io.put_string ("Request on proxy subject with characteristic: ")
				if attached ( characteristic @ 1) as item then
					separate item as s do
						io.put_string ((create {STRING}.make_from_separate (s.out)).out)
					end
				end
				io.put_string ("; args: ")
				if attached ( args @ 1) as item then
					separate item as s do
						io.put_string ((create {STRING}.make_from_separate (s.out)).out)
					end
				end
				io.put_new_line
			end
			subject.request_with_args (args)
		end

feature -- Status setting

	set_characteristic (a_characteristic: like characteristic)
			-- Set `characteristic' to `a_characteristic'.
		do
			debug
				io.put_string ("Set characteristic of proxy subject to: ")
				if attached ( a_characteristic @ 1) as item then
					separate item as s do
						io.put_string ((create {STRING}.make_from_separate (s.out)).out)
					end
				end
				io.put_new_line
			end
			subject.set_characteristic (a_characteristic)
			cached_characteristic := a_characteristic
		ensure then
			cached_characteristic_set: cached_characteristic = a_characteristic
		end

feature {NONE} -- Implementation

	subject: REAL_SUBJECT 
			-- Subject
		local
			l_result: like actual_subject
		do
			l_result := actual_subject
			if l_result = Void then
				create l_result.make (cached_characteristic)
				cached_characteristic := l_result.characteristic
			end
			actual_subject := l_result
			Result := l_result
		ensure then
			subject_not_void: Result /= Void
			is_actual_subject: Result = actual_subject
			cached_characteristic_not_void: cached_characteristic /= Void
		end

	actual_subject: detachable REAL_SUBJECT
			-- Actual subject
			--|Loaded only when needed

	cached_characteristic: like characteristic
			-- Cache of characteristic of actual subject

invariant

	cached_characteristic_not_void: cached_characteristic /= Void
	consistent: attached actual_subject as l_actual_subject implies
			cached_characteristic = l_actual_subject.characteristic

end
