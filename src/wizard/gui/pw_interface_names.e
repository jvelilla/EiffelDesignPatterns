indexing

	description:

		"Strings used in the Eiffel Pattern Wizard interface"

	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class PW_INTERFACE_NAMES

create

	default_create

feature -- Initial window

	window_width: INTEGER is 600
	window_height: INTEGER is 800
	window_title: STRING is "Eiffel Pattern Wizard, version 1.0"
	pattern_selector_text: STRING is "Pattern selection"
	pattern_selector_height: INTEGER is 300
	pattern_intent_frame_text: STRING is "Pattern's intent"
	pattern_applicability_frame_text: STRING is "Pattern's applicability"
	project_location_selector_text: STRING is "Project location"
	project_location_selector_description: STRING is "The project location is the place where the pattern's source code will be generated%Nby the Eiffel Pattern Wizard"
	project_location_selector_height: INTEGER is 85
	project_default_location: STRING is "C:\pattern_wizard"
	pattern_properties_frame_text: STRING is "Pattern properties"
	check_generate_root_class_button_text: STRING is "Generate root class and Ace file"
	check_close_wizard_button_text: STRING is "Close the Eiffel Pattern Wizard after code generation"
	successfull_code_generation: STRING is "The Eiffel classes corresponding to this pattern have been successfully generated in your project directory."
	template_method_with_agents_automatic_root_class_generation_text: STRING is "The root class must be generated for the Template method pattern implemented%Nwith agents because the root class is one of the pattern classes."
	bridge_incorrect_descendant_classes_count_text: STRING is "There must be as many application descendant classes as implementation descendant classes.%NPlease change the pattern properties accordingly.%NNo code was generated."
	incorrect_project_directory_path_text: STRING is "The project directory path you selected is not valid. Please choose a valid directory."
	error_dialog_title: STRING is "Error"
	error_pattern_environment_variable_not_defined_text: STRING is "The environment variable PATTERN is not defined.%NPlease set the environment variable PATTERN to the Pattern Wizard's installation directory and restart the application.%N(See `Readme.txt%' of the Pattern Wizard's delivery for more information.)"
 
feature -- Pattern selector

	non_componentizable_item_text: STRING is "Non-componentizable"
	possible_skeleton_item_text: STRING is "Possible skeleton"
	singleton_item_text: STRING is "Singleton"
	method_item_text: STRING is "With method"
	decorator_item_text: STRING is "Decorator"
	adapter_item_text: STRING is "Adapter"
	class_adapter_item_text: STRING is "class adapter"
	object_adapter_item_text: STRING is "object adapter"
	skeleton_item_text: STRING is "Skeleton"
	no_method_item_text: STRING is "No method"
	template_method_item_text: STRING is "Template method"
	template_method_pattern_item_text: STRING is "original pattern"
	template_method_with_agents_item_text: STRING is "with agents"
	bridge_item_text: STRING is "Bridge"
	bridge_with_deferred_classes_item_text: STRING is "with deferred classes (original pattern)"
	bridge_with_effective_classes_item_text: STRING is "with effective classes (like in EiffelVision2)"
	bridge_with_inheritance_item_text: STRING is "with non-conforming inheritance"

feature -- About dialog

	about_dialog_text: STRING is "Eiffel Pattern Wizard (1.0)%N%NCopyright (C) 2002-2004 ETH Zurich, Switzerland%NAll rights reserved%N%NETH Zentrum - RZ Building%NChair of Software Engineering%NClausiusstrasse 59%NCH-8092 Zurich%NSwitzerland%NTelephone: (+41)1 632 4723%NFax: (+41)1 632 1435%NElectronic mail: <Karine.Arnout@inf.ethz.ch>%N%NWeb: http://se.inf.ethz.ch/people/arnout/index.html"
	about_dialog_width: INTEGER is 380
	about_dialog_height: INTEGER is 380
	pw_pixmap_file_name: STRING is "\src\wizard\pixmaps\wizard_about.png"

feature -- Pattern descriptor

	descriptor_text_field_height: INTEGER is 80

feature -- Directory selector

	browse_button_text: STRING is "Browse..."
	location_description_height: INTEGER is 40
	directory_dialog_text: STRING is "Choose a directory"

feature -- Control box

	about_button_text: STRING is "About"
	generate_button_text: STRING is "Generate"
	cancel_button_text: STRING is "Cancel"
	help_button_text: STRING is "Help"
	help_file_name: STRING is "\src\wizard\doc\pattern_wizard_help.pdf"

feature -- Class diagram bar

	class_diagram_button_text: STRING is "Class diagram"

feature -- Class diagram dialog

	class_diagram_dialog_title: STRING is "Class diagram: "
	dialog_width: INTEGER is 200
	dialog_height: INTEGER is 200
	ok_button_text: STRING is "OK"
	pw_icon_pixmap_file_name: STRING is "\src\wizard\pixmaps\wizard.png"

feature -- Property selector

	class_name_label_text: STRING is "Class name:"
	location_label_text: STRING is "Location:"
	creation_procedure_name_label_text: STRING is "Creation procedure name:"
	feature_name_label_text: STRING is "Feature name:"
	attribute_name_label_text: STRING is "Attribute name:"
	attribute_type_name_label_text: STRING is "Attribute type name:"
	template_method_name_label_text: STRING is "Template method name:"
	template_method_implementation_feature_names_label_text: STRING is "Implementation features' name:"

feature -- Singleton property selector

	singleton_class_text: STRING is "Singleton class"
	access_point_text: STRING is "Access point to singleton class"
	access_point_feature_name_label_text: STRING is "Access point's feature name:"

feature -- Decorator property selector

	decorator_deferred_component_class_text: STRING is "Deferred component class (without decoration)"
	decorator_effective_component_class_text: STRING is "Effective component class (without decoration)"
	decorator_deferred_decorated_component_class_text: STRING is "Deferred decorated component class"
	decorator_effective_decorated_component_class_text: STRING is "Effective decorated component class"
	check_additional_attribute_button_text: STRING is "with additional attribute"
	check_additional_behavior_button_text: STRING is "with additional behavior"
	decorator_original_component_tab_text: STRING is "Original component properties"
	decorator_decorated_component_tab_text: STRING is "Decorated component properties"

feature -- Adapter property selector

	adapter_target_class_text: STRING is "Target class"
	adapter_adaptee_class_text: STRING is "Adaptee class"
	adapter_class_text: STRING is "Adapter class"
	adapter_target_text: STRING is "Target properties"
	adapter_adaptee_text: STRING is "Adaptee properties"
	adapter_text: STRING is "Adapter properties"

feature -- Name list selector

	add_button_text: STRING is "Add"
	remove_button_text: STRING is "Remove"
	name_already_in_list_warning_text: STRING is "This name is already in the list. Please choose a different name."

feature -- Template method property selector

	template_method_deferred_application_class_text: STRING is "Deferred application class"
	template_method_effective_application_class_text: STRING is "Effective application class"
	template_method_deferred_application_text: STRING is "Deferred application class properties"
	template_method_effective_application_text: STRING is "Effective application class properties"
	template_method_application_class_text: STRING is "Application class"
	template_method_client_class_text: STRING is "Client (root) class"
	template_method_application_text: STRING is "Application class properties"
	template_method_client_text: STRING is "Client class properties"

feature -- Bridge property selector

	bridge_deferred_application_class_text: STRING is "Deferred application class"
	bridge_deferred_application_implementation_class_text: STRING is "Deferred application implementation class"
	bridge_descendant_application_classes_label_text: STRING is "Descendant application classes:"
	bridge_descendant_application_implementation_classes_label_text: STRING is "Descendant application implementation classes:"
	bridge_application_classes_text: STRING is "Application classes properties"
	bridge_application_implementation_classes_text: STRING is "Application implementation classes properties"
	bridge_application_class_text: STRING is "Application class"
	bridge_application_implementation_class_text: STRING is "Application implementation class"

feature -- Default names

	default_creation_procedure_name: STRING is "make"
	default_singleton_class_name: STRING is "SINGLETON"
	default_singleton_access_point_class_name: STRING is "SHARED_SINGLETON"
	default_singleton_access_point_feature_name: STRING is "singleton"
	default_decorator_deferred_component_class_name: STRING is "COMPONENT"
	default_feature_name: STRING is "do_something"
	default_decorator_effective_component_class_name: STRING is "MY_COMPONENT"
	default_decorator_deferred_decorated_component_class_name: STRING is "DECORATED_COMPONENT"
	default_decorator_decorated_component_with_additional_attribute_class_name: STRING is "DECORATED_COMPONENT_A"
	default_decorator_decorated_component_with_additional_behavior_class_name: STRING is "DECORATED_COMPONENT_B"
	default_additional_attribute_name: STRING is "additional_attribute"
	default_attribute_type_name: STRING is "SOME_TYPE"
	default_additional_feature_name: STRING is "do_something_more"
	default_adapter_target_class_name: STRING is "TARGET"
	default_adapter_adaptee_class_name: STRING is "ADAPTEE"
	default_adapter_class_name: STRING is "ADAPTER"
	default_adapter_target_feature_name: STRING is "f"
	default_adapter_adaptee_feature_name: STRING is "g"
	default_template_method_application_class_name: STRING is "APPLICATION"
	default_template_method_effective_application_class_name: STRING is "MY_APPLICATION"
	default_template_method_feature_name: STRING is "do_something"
	default_template_method_feature_1_name: STRING is "do_something_imp_1"
	default_template_method_feature_2_name: STRING is "do_something_imp_2"
	default_template_method_client_class_name: STRING is "CLIENT"
	default_bridge_application_class_name: STRING is "APPLICATION"
	default_bridge_descendant_application_class_1_name: STRING is "APPLICATION_1"
	default_bridge_descendant_application_class_2_name: STRING is "APPLICATION_2"
	default_bridge_application_implementation_class_name: STRING is "APPLICATION_IMP"
	default_bridge_descendant_application_implementation_class_1_name: STRING is "APPLICATION_IMP_1"
	default_bridge_descendant_application_implementation_class_2_name: STRING is "APPLICATION_IMP_2"
	default_bridge_with_inheritance_implementation_feature_name: STRING is "do_something_imp"

feature -- Root class names

	default_root_class_name: STRING is "APPLICATION"
	other_root_class_name: STRING is "CLIENT"

feature -- Patterns' name

	singleton_pattern_name: STRING is "Singleton"
	decorator_pattern_name: STRING is "Decorator"
	class_adapter_pattern_name: STRING is "Class adapter"
	object_adapter_pattern_name: STRING is "Object adapter"
	template_method_pattern_name: STRING is "Template method"
	template_method_with_agents_pattern_name: STRING is "Template method with agents"
	bridge_pattern_name: STRING is "Bridge with deferred classes (original pattern)"
	bridge_with_effective_classes_pattern_name: STRING is "Bridge with effective classes"
	bridge_with_inheritance_pattern_name: STRING is "Bridge with non-conforming inheritance"

feature -- Patterns' intent

	singleton_intent: STRING is "Ensure a class only has one instance, and provide a global point of access to it. [Gamma 1995, p 127]"
	decorator_intent: STRING is "Attach additional responsibilities to an object dynamically. Decorators provide a flexible alternative to subclassing for extending functionality. [Gamma 1995, p 175]"
	adapter_intent: STRING is "Convert the interface of a class into another interface clients expect. Adapter lets classes work together that couldn't otherwise because of incompatible interfaces. [Gamma 1995, p 139]"
	template_method_intent: STRING is "Define the skeleton of an algorithm in an operation, deferring some steps to subclasses. Template Method lets subclasses redefine certain steps of an algorithm without changing the algorithm's structure. [Gamma 1995, p 325]"
	bridge_intent: STRING is "Decouple an abstraction from its implementation so that the two can vary independently. [Gamma 1995, p 151]"

feature -- Patterns' applicability

	singleton_applicability: STRING is "* there must be exactly one instance of a class, and it must be accessible to clients from a well-known access point.%N*when the sole instance should be extensible by subclassing, and clients should be able to use an extended instance without modifying their code.%N[Gamma 1995, p 127]"
	decorator_applicability: STRING is "* to add responsibilities to individual objects dynamically and transparently, that is, without affecting other objects.%N* for responsibilities that can be withdrawn.%N* when extension by subclassing is impractical. Sometimes a large number of independent extensions are possible and would produce an explosion of subclasses to support every combination. Or a class definition may be hidden or otherwise unavailable for subclassing. [Gamma 1995, p 177]"
	adapter_applicability: STRING is "* you want to use an existing class, and its interface does not match the one you need.%N*you want to create a reusable class that cooperates with unrelated or unforeseen classes, that is, classes that don't necessarily have compatible interfaces.%N*(object adapter only) you need to use several existing subclasses, but it's impractical to adapt their interface by subclassing every one. An object adapter can adapt the interface of its parent class. [Gamma 1995, p 140]"
	template_method_applicability: STRING is "* to implement the invariant parts of an algorithm once and leave it up to subclasses to implement the behavior that can vary.%N* when common behavior among subclasses should be factored and localized in a common class to avoid code duplication.%N* to control subclasses extensions. You can define a template method that calls 'hook' operations at specific points, thereby permitting extensions only at those points. [Gamma 1995, p 326]"
	bridge_applicability: STRING is "* you want to avoid a permanent binding between an abstraction and its implementation. This might be the case, for example, when the implementation must be selected or switched at run-time.%N* both the abstractions and their implementations should be extensible by subclassing. In this case, the Bridge pattern lets you combine the different abstractions and implementations and extend them independently.%N* changes in the implementation of an abstraction should have no impact on clients; that is, their code should not have to be recompiled.%N* you have a proliferation of classes. Such a class hierarchy indicates the need for splitting an object into two parts.%N* you want to share an implementation among multiple objects, and this fact should be hidden from the client. [Gamma 1995, p 153]"
 
feature -- Patterns' class diagram file name

	singleton_class_diagram_file_name: STRING is "\src\wizard\pixmaps\singleton_class_diagram.PNG"
	decorator_class_diagram_file_name: STRING is "\src\wizard\pixmaps\decorator_class_diagram.PNG"
	class_adapter_class_diagram_file_name: STRING is "\src\wizard\pixmaps\class_adapter_class_diagram.PNG"
	object_adapter_class_diagram_file_name: STRING is "\src\wizard\pixmaps\object_adapter_class_diagram.PNG"
	template_method_class_diagram_file_name: STRING is "\src\wizard\pixmaps\template_method_class_diagram.PNG"
	template_method_with_agents_class_diagram_file_name: STRING is "\src\wizard\pixmaps\template_method_with_agents_class_diagram.PNG"
	bridge_class_diagram_file_name: STRING is "\src\wizard\pixmaps\bridge_class_diagram.PNG"
	bridge_with_effective_classes_class_diagram_file_name: STRING is "\src\wizard\pixmaps\bridge_with_effective_classes_class_diagram.PNG"
	bridge_with_inheritance_class_diagram_file_name: STRING is "\src\wizard\pixmaps\bridge_with_inheritance_class_diagram.PNG"

feature -- Miscellaneous

	margin: INTEGER is 10
	button_width: INTEGER is 80
	button_height: INTEGER is 25
	text_field_width: INTEGER is 380
	text_field_height: INTEGER is 25
	name_list_height: INTEGER is 80

end
