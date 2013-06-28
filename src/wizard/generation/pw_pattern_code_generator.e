indexing

	description:

		"Pattern code generator"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

deferred class PW_PATTERN_CODE_GENERATOR

inherit

	PW_SKELETON_NAMES
		export
			{NONE} all
		end

	PW_INTERFACE_NAMES
		export
			{NONE} all
		end

	PW_SUPPORT

feature -- Access

	project_directory: STRING
			-- Path of the project directory
			-- (where the code will be generated)

	pattern_info: PW_PATTERN_INFORMATION
			-- Pattern information needed for the code generation
			-- (name of classes, name of features, etc.)

feature -- Status report

	root_class_and_ace_file_generation: BOOLEAN
			-- Should a root class and an Ace file be generated?

feature -- Element change

	set_project_directory (a_project_directory: like project_directory) is
			-- Set `project_directory' to `a_project_directory'.
			-- Add '\' at the end if none.
		require
			a_project_directory_not_void: a_project_directory /= Void
			a_project_directory_not_empty: not a_project_directory.is_empty
			directory_exists: directory_exists (a_project_directory)
		do
			project_directory := a_project_directory
			if project_directory.item (project_directory.count) /= '\' then
				project_directory := project_directory + "\"
			end
		ensure
			project_directory_set: project_directory /= Void and then not project_directory.is_empty
		end

	set_root_class_and_ace_file_generation (a_value: like root_class_and_ace_file_generation) is
			-- Set `root_class_and_ace_file_generation' to `a_value'.
		do
			root_class_and_ace_file_generation := a_value
		ensure
			root_class_and_ace_file_generation_set: root_class_and_ace_file_generation = a_value
		end

	set_pattern_info (a_pattern_info: like pattern_info) is
			-- Set `pattern_info' to `a_pattern_info'.
		require
			a_pattern_info_not_void: a_pattern_info /= Void
		do
			pattern_info := a_pattern_info
		ensure
			pattern_info_set: pattern_info = a_pattern_info
		end

feature -- Generation

	generate is
			-- Generate code for this pattern.
		require
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		do
			if root_class_and_ace_file_generation then
				generate_ace_file
				generate_root_class
			end
			generate_pattern_code
		end

feature {NONE} -- Implementation (Code generation)

	generate_root_class is
			-- Generate root class.
		require
			root_class_and_ace_file_generation: root_class_and_ace_file_generation
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		deferred
		end

	generate_ace_file is
			-- Generate Ace file.
		require
			root_class_and_ace_file_generation: root_class_and_ace_file_generation
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		deferred
		end

	generate_pattern_code is
			-- Generate Eiffel classes for this pattern (except the root class).
		require
			pattern_info_not_void: pattern_info /= Void
			pattern_info_complete: pattern_info.is_complete
		deferred
		end

	generate_code (a_new_file_name, a_skeleton_file_name: STRING; some_changes: LINKED_LIST [TUPLE [STRING, STRING]]) is
			-- Generate new file with file name `a_new_file_name' from the skeleton
			-- corresponding to `a_skeleton_file_name' by reproducing the skeleton code into the
			-- new file after `some_changes' (replacing a value by another).
			--| `some_changes' should be of the form: LINKED_LIST [[old_string, new_string], ...]
		require
			a_new_file_name_not_void: a_new_file_name /= Void
			a_new_file_name_not_empty: not a_new_file_name.is_empty
			a_skeleton_file_name_not_void: a_skeleton_file_name /= Void
			a_skeleton_file_name_not_empty: not a_skeleton_file_name.is_empty
			a_skeleton_file_exists: file_exists (a_skeleton_file_name)
			some_changes_not_void: some_changes /= Void
			no_void_change: not some_changes.has (Void)
			-- no_void_old_string: forall c in some_changes, c.item (1) /= Void
			-- no_void_new_string: forall c in some_changes, c.item (2) /= Void
		local
			file: PLAIN_TEXT_FILE
			skeleton_file: PLAIN_TEXT_FILE
			text: STRING
			a_change: TUPLE [STRING, STRING]
			old_string: STRING
			new_string: STRING
		do
			create skeleton_file.make_open_read (a_skeleton_file_name)
			skeleton_file.read_stream (skeleton_file.count)
			text := skeleton_file.last_string
			from some_changes.start until some_changes.after loop
				a_change := some_changes.item
				old_string ?= a_change.item (1)
				if old_string /= Void then
					new_string ?= a_change.item (2)
					if new_string /= Void then
						text.replace_substring_all (old_string, new_string)
					end
				end
				some_changes.forth
			end
			create file.make_create_read_write (a_new_file_name)
			file.put_string (text)
			file.close
			skeleton_file.close
		end

invariant

	project_directory_not_empty_and_exists_if_not_void: project_directory /= Void implies (not project_directory.is_empty and directory_exists (project_directory))

end
