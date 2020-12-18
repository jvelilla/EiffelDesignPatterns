note

	description:

		"Tree enabling the users to select a pattern"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_PATTERN_SELECTOR

inherit

	EV_FRAME
		redefine
			initialize,
			is_in_default_state
		end

	PW_INTERFACE_NAMES
		export
			{NONE} all
		undefine
			default_create, copy
		end

create

	default_create,
	make_with_text

feature {NONE} -- Initialization

	initialize is
			-- Initialize `tree' and its items.
		do
			Precursor {EV_FRAME}

				-- Create tree components.
			create tree
			create non_componentizable_item
			create skeleton_item
			create method_item
			create decorator_item
			create adapter_item
			create class_adapter_item
			create object_adapter_item
			create no_method_item
			create template_method_item
			create template_method_pattern_item
			create template_method_with_agents_item
			create bridge_item
			create bridge_with_deferred_classes_item
			create bridge_with_effective_classes_item
			create bridge_with_inheritance_item
			create possible_skeleton_item
			create singleton_item

				-- Set text of tree components.
			non_componentizable_item.set_text (non_componentizable_item_text)
			skeleton_item.set_text (skeleton_item_text)
			method_item.set_text (method_item_text)
			decorator_item.set_text (decorator_item_text)
			adapter_item.set_text (adapter_item_text)
			class_adapter_item.set_text (class_adapter_item_text)
			object_adapter_item.set_text (object_adapter_item_text)
			no_method_item.set_text (no_method_item_text)
			template_method_item.set_text (template_method_item_text)
			template_method_pattern_item.set_text (template_method_pattern_item_text)
			template_method_with_agents_item.set_text (template_method_with_agents_item_text)
			bridge_item.set_text (bridge_item_text)
			bridge_with_deferred_classes_item.set_text (bridge_with_deferred_classes_item_text)
			bridge_with_effective_classes_item.set_text (bridge_with_effective_classes_item_text)
			bridge_with_inheritance_item.set_text (bridge_with_inheritance_item_text)
			possible_skeleton_item.set_text (possible_skeleton_item_text)
			singleton_item.set_text (singleton_item_text)

			align_text_center
			build

			decorator_item.select_actions.extend (agent select_pattern (decorator_pattern_name))
			class_adapter_item.select_actions.extend (agent select_pattern (class_adapter_pattern_name))
			object_adapter_item.select_actions.extend (agent select_pattern (object_adapter_pattern_name))
			template_method_pattern_item.select_actions.extend (agent select_pattern (template_method_pattern_name))
			template_method_with_agents_item.select_actions.extend (agent select_pattern (template_method_with_agents_pattern_name))
			bridge_with_deferred_classes_item.select_actions.extend (agent select_pattern (bridge_pattern_name))
			bridge_with_effective_classes_item.select_actions.extend (agent select_pattern (bridge_with_effective_classes_pattern_name))
			bridge_with_inheritance_item.select_actions.extend (agent select_pattern (bridge_with_inheritance_pattern_name))
			singleton_item.select_actions.extend (agent select_pattern (singleton_pattern_name))
		end

	build is
			-- Build `tree' representation of the pattern classification.
		local
			vbox: EV_VERTICAL_BOX
			hbox: EV_HORIZONTAL_BOX
		do
			create vbox
			vbox.extend (create {EV_CELL})

			create hbox
			hbox.extend (create {EV_CELL})

			tree.extend (non_componentizable_item)

			non_componentizable_item.extend (skeleton_item)
			skeleton_item.extend (method_item)
			method_item.extend (decorator_item)
			method_item.extend (adapter_item)
			adapter_item.extend (class_adapter_item)
			adapter_item.extend (object_adapter_item)

			skeleton_item.extend (no_method_item)
			no_method_item.extend (template_method_item)
			template_method_item.extend (template_method_pattern_item)
			template_method_item.extend (template_method_with_agents_item)
			no_method_item.extend (bridge_item)
			bridge_item.extend (bridge_with_deferred_classes_item)
			bridge_item.extend (bridge_with_effective_classes_item)
			bridge_item.extend (bridge_with_inheritance_item)

			non_componentizable_item.extend (possible_skeleton_item)
			possible_skeleton_item.extend (singleton_item)

			non_componentizable_item.expand
			skeleton_item.expand
			method_item.expand
			adapter_item.expand
			no_method_item.expand
			template_method_item.expand
			bridge_item.expand
			possible_skeleton_item.expand

			tree.set_minimum_width ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (window_width - 4 * margin))
			tree.set_minimum_height ({EV_MONITOR_DPI_DETECTOR_IMP}.scaled_size (pattern_selector_height - 2 * margin))

			hbox.extend (tree)
			hbox.disable_item_expand (tree)
			hbox.extend (create {EV_CELL})

			vbox.extend (hbox)
			vbox.disable_item_expand (hbox)
			vbox.extend (create {EV_CELL})
			extend (vbox)
		end

feature -- Status report

	is_in_default_state: BOOLEAN is
			-- Is pattern selector in default state?
		do
			Result := is_center_aligned
		end

feature -- Event handling

	select_pattern (a_name: STRING_32) 
			-- Select pattern corresponding to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		local
			application: PATTERN_WIZARD
		do
			application ?= (create {EV_ENVIRONMENT}).application
			if application /= Void then
				application.initial_window.select_pattern (a_name)
			end
		end

feature {NONE} -- Implementation (GUI components)

	tree: EV_TREE
			-- Tree representing the pattern classification

	non_componentizable_item: EV_TREE_ITEM
			-- Tree item representing non-componentizable patterns

	skeleton_item: EV_TREE_ITEM
			-- Tree item representing patterns for which it is possible
			-- to generate skeleton classes

	method_item: EV_TREE_ITEM
			-- Tree item representing patterns for which it is possible
			-- to generate skeleton classes and to provide a method to
			-- fill these skeletons

	decorator_item: EV_TREE_ITEM
			-- Tree item representing the Decorator pattern

	adapter_item: EV_TREE_ITEM
			-- Tree item representing the Adapter patterns
			-- (class and object adapter)

	class_adapter_item: EV_TREE_ITEM
			-- Tree item representing the Class Adapter pattern

	object_adapter_item: EV_TREE_ITEM
			-- Tree item representing the Object Adapter pattern

	no_method_item: EV_TREE_ITEM
			-- Tree item representing patterns for which it is possible
			-- to generate skeleton classes but no method can be provided
			-- to help the developer fill the skeletons

	template_method_item: EV_TREE_ITEM
			-- Tree item representing the two possible implementations
			-- of the Template Method pattern

	template_method_pattern_item: EV_TREE_ITEM
			-- Tree item representing the original Template Method pattern

	template_method_with_agents_item: EV_TREE_ITEM
			-- Tree item representing the Template Method pattern
			-- implemented with agents

	bridge_item: EV_TREE_ITEM
			-- Tree item representing the three possible implementations
			-- of the Bridge pattern

	bridge_with_deferred_classes_item: EV_TREE_ITEM
			-- Tree item representing the original Bridge pattern
			-- (implemented with deferred classes)

	bridge_with_effective_classes_item: EV_TREE_ITEM
			-- Tree item representing a variant of the Bridge pattern
			-- implemented with effective classes only

	bridge_with_inheritance_item: EV_TREE_ITEM
			-- Tree item representing the Bridge pattern implemented with
			-- non-conforming inheritance

	possible_skeleton_item: EV_TREE_ITEM
			-- Tree item representing patterns for which it is possible
			-- to generate skeleton classes given some language extensions

	singleton_item: EV_TREE_ITEM
			-- Tree item representing the Singleton pattern

invariant

	tree_not_void: tree /= Void
	non_componentizable_item_not_void: non_componentizable_item /= Void
	possible_skeleton_item_not_void: possible_skeleton_item /= Void
	singleton_item_not_void: singleton_item /= Void
	method_item_not_void: method_item /= Void
	no_method_item_not_void: no_method_item /= Void
	decorator_item_not_void: decorator_item /= Void
	adapter_item_not_void: adapter_item /= Void
	class_adapter_item_not_void: class_adapter_item /= Void
	object_adapter_item_not_void: object_adapter_item /= Void
	skeleton_item_not_void: skeleton_item /= Void
	template_method_item_not_void: template_method_item /= Void
	template_method_pattern_item_not_void: template_method_pattern_item /= Void
	template_method_with_agents_item_not_void: template_method_with_agents_item /= Void
	bridge_item_not_void: bridge_item /= Void
	bridge_with_deferred_classes_item_not_void: bridge_with_deferred_classes_item /= Void
	bridge_with_effective_classes_item_not_void: bridge_with_effective_classes_item /= Void
	bridge_with_inheritance_item_not_void: bridge_with_inheritance_item /= Void
	is_center_aligned: is_center_aligned
	non_componentizable_item_text_set: non_componentizable_item.text.is_equal (non_componentizable_item_text)
	possible_skeleton_item_text_set: possible_skeleton_item.text.is_equal (possible_skeleton_item_text)
	singleton_item_text_set: singleton_item.text.is_equal (singleton_item_text)
	method_item_text_set: method_item.text.is_equal (method_item_text)
	no_method_item_text_set: no_method_item.text.is_equal (no_method_item_text)
	decorator_item_text_set: decorator_item.text.is_equal (decorator_item_text)
	adapter_item_text_set: adapter_item.text.is_equal (adapter_item_text)
	class_adapter_item_text_set: class_adapter_item.text.is_equal (class_adapter_item_text)
	object_adapter_item_text_set: object_adapter_item.text.is_equal (object_adapter_item_text)
	skeleton_item_text_set: skeleton_item.text.is_equal (skeleton_item_text)
	template_method_item_text_set: template_method_item.text.is_equal (template_method_item_text)
	template_method_pattern_item_text_set: template_method_pattern_item.text.is_equal (template_method_pattern_item_text)
	template_method_with_agents_item_text_set: template_method_with_agents_item.text.is_equal (template_method_with_agents_item_text)
	bridge_item_text_set: bridge_item.text.is_equal (bridge_item_text)
	bridge_with_deferred_classes_item_text_set: bridge_with_deferred_classes_item.text.is_equal (bridge_with_deferred_classes_item_text)
	bridge_with_effective_classes_item_text_set: bridge_with_effective_classes_item.text.is_equal (bridge_with_effective_classes_item_text)
	bridge_with_inheritance_item_text_set: bridge_with_inheritance_item.text.is_equal (bridge_with_inheritance_item_text)


end
