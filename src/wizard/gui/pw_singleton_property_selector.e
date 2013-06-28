indexing

	description:

		"Frame where the user can select the Singleton pattern properties"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_SINGLETON_PROPERTY_SELECTOR

inherit

	PW_PATTERN_PROPERTY_SELECTOR
		redefine
			is_in_default_state
		end

create

	make,
	make_with_name_and_text
	   
feature {NONE} -- Initialization

	initialize_pattern_components is
			-- Initialize GUI components that are pattern-specific.
		do
			create singleton_frame.make_with_info_and_text (creation_procedure_name_label_text, Void, singleton_class_text)
			create access_point_frame.make_with_info_and_text (access_point_feature_name_label_text, Void, access_point_text) 
		end

	build_pattern_vbox is
			-- Build `pattern_vbox'.
		local
			hbox: EV_HORIZONTAL_BOX
			c: EV_CELL
		do
				-- Singleton frame
			create hbox
			hbox.set_minimum_width (window_width - 4 * margin)
			hbox.extend (create {EV_CELL})

			singleton_frame.set_default_class_name (default_singleton_class_name)
			singleton_frame.set_default_feature_1_name (default_creation_procedure_name)

			hbox.extend (singleton_frame)
			hbox.disable_item_expand (singleton_frame)
			hbox.extend (create {EV_CELL})
			pattern_vbox.extend (hbox)
			pattern_vbox.disable_item_expand (hbox)

			create c
			c.set_minimum_height (margin)
			pattern_vbox.extend (c)
			pattern_vbox.disable_item_expand (c)

				-- Singleton access point frame
			create hbox
			hbox.set_minimum_width (window_width - 4 * margin)
			hbox.extend (create {EV_CELL})

			access_point_frame.set_default_class_name (default_singleton_access_point_class_name)
			access_point_frame.set_default_feature_1_name (default_singleton_access_point_feature_name)

			hbox.extend (access_point_frame)
			hbox.disable_item_expand (access_point_frame)
			hbox.extend (create {EV_CELL})
			pattern_vbox.extend (hbox)
			pattern_vbox.disable_item_expand (hbox)

			create c
			c.set_minimum_height (margin)
			pattern_vbox.extend (c)
			pattern_vbox.disable_item_expand (c)
		end

feature -- Access

	singleton_class_name: STRING is
			-- Chosen name for the Singleton class
		do
			Result := singleton_frame.class_name_selector.name_text
		ensure
			singleton_class_name_not_void: Result /= Void
			definition: Result.is_equal (singleton_frame.class_name_selector.name_text)
		end

	singleton_creation_procedure_name: STRING is
			-- Chosen name for the creation procedure of the Singleton class
		do
			Result := singleton_frame.feature_1_name_selector.name_text
		ensure
			singleton_creation_procedure_name_not_void: Result /= Void
			definition: Result.is_equal (singleton_frame.feature_1_name_selector.name_text)
		end

	access_point_class_name: STRING is
			-- Chosen name for the Singleton access point class
		do
			Result := access_point_frame.class_name_selector.name_text
		ensure
			access_point_class_name_not_void: Result /= Void
			definition: Result.is_equal (access_point_frame.class_name_selector.name_text)
		end

	access_point_feature_name: STRING is
			-- Chosen name for the feature name of the Singleton access point class
		do
			Result := access_point_frame.feature_1_name_selector.name_text
		ensure
			access_point_feature_name_not_void: Result /= Void
			definition: Result.is_equal (access_point_frame.feature_1_name_selector.name_text)
		end

feature -- Status report

	is_in_default_state: BOOLEAN is
			-- Is pattern selector in default state?
		do
			 Result := (
						singleton_frame /= Void and
						access_point_frame /= Void --and
					)
		end

feature {NONE} -- Implementation (GUI components)

	singleton_frame: PW_PATTERN_BASIC_PROPERTY_SELECTOR
			-- Frame with properties concerning the Singleton class

	access_point_frame: PW_PATTERN_BASIC_PROPERTY_SELECTOR
			-- Frame with properties concerning the access point to 
			-- the singleton class

invariant

	singleton_frame_not_void: singleton_frame /= Void
	access_point_frame_not_void: access_point_frame /= Void

end
