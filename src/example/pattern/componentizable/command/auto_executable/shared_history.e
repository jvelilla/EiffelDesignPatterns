note

	description:

		"Shared history"

	pattern: "Command"
	reusable_version: "Command library (see ${PATTERN}/library/command)"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class SHARED_HISTORY

feature {NONE} -- Implementation

	history: HISTORY is
			-- History of executed commands
		once
			create Result.make
		ensure
			history_not_void: Result /= Void
		end

end
