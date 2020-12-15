note

	description:
		"[
			Build a product of type `F', 
			which  composed of two parts
			(the first part being of type `G'
			and the second part of type `H').
		]"

	library: "Builder library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class TWO_PART_BUILDER [F -> BUILDABLE, G, H]

inherit

	BUILDER [F]

create

	make

feature {NONE} -- Initialization

	make (f: like factory_function_f; g: like factory_function_g;
		h: like factory_function_h)
			-- Set `factory_function_f' to `f'.
			-- Set `factory_function_g' to `g'.
			-- Set `factory_function_h' to `h'.
		require
			f_not_void: f /= Void
			g_not_void: g /= Void
			h_not_void: h /= Void
		do
			factory_function_f := f
			factory_function_g := g
			factory_function_h := h
			create f_factory.make (factory_function_f)
			create g_factory.make (factory_function_g)
			create h_factory.make (factory_function_h)
		ensure
			factory_function_f_set: factory_function_f = f
			factory_function_g_set: factory_function_g = g
			factory_function_h_set: factory_function_h = h
		end

feature -- Access

	last_product: detachable F
			-- Product under construction


feature -- Status report

	is_ready: BOOLEAN
			-- Is builder ready to build `last_product'?
		do
			Result := valid_args ([], [], [])
		end

	valid_args (args_f, args_g, args_h: TUPLE): BOOLEAN
			-- Are `args_f', `args_g' and `args_h' valid arguments
			-- to build `last_product'?
		do
			Result := factory_function_f.valid_operands (args_f)
						and then factory_function_g.valid_operands (args_g)
						and then factory_function_h.valid_operands (args_h)
		end

feature -- Basic Operations

	build
			-- Build `last_product'.
			--|Successively call `build_g' and `build_h' to build product parts.
		do
			last_product := f_factory.new
			check
				last_product_not_void: last_product /= Void
			end
			build_g ([])
			build_h ([])
		ensure then
			g_not_void: attached last_product as l_last_product and then attached l_last_product.g
			h_not_void: attached l_last_product.h
		end

	build_with_args (args_f, args_g, args_h: TUPLE)
			-- Build `last_product' with `args_f'.
			--|Successively call `build_g' with `args_g'
			--|and `build_h' with `args_h' to build product parts.
		require
			valid_args: valid_args (args_f, args_g, args_h)
		do
			last_product := f_factory.new_with_args (args_f)
			check
				last_product_not_void: last_product /= Void
			end
			build_g (args_g)
			build_h (args_h)
		ensure
			last_product_not_void: last_product /= Void
			g_not_void: attached last_product as l_last_product and then attached l_last_product.g
			h_not_void: attached l_last_product.h
		end

feature -- Access

	factory_function_f: FUNCTION [ANY, TUPLE, F]
			-- Factory function creating new instances of
			-- type F

	factory_function_g: FUNCTION [ANY, TUPLE, G]
			-- Factory function creating new instances of
			-- type G

	factory_function_h: FUNCTION [ANY, TUPLE, H]
			-- Factory function creating new instances of
			-- type H

feature {NONE} -- Basic Operations

	build_g (args_g: TUPLE)
			-- Set `last_product.g' with a new instance of
			-- type `G' created with arguments `args_g'.
		require
			last_product_not_void: last_product /= Void
			valid_args_g: factory_function_g.valid_operands (args_g)
		do
			if attached last_product as l_last_product and then
			   attached {ANY} g_factory.new_with_args (args_g) as l_new_g_factory then
			   l_last_product.set_g (l_new_g_factory)
			end
		ensure
			g_not_void: attached last_product as l_last_product and then attached l_last_product.g
		end

	build_h (args_h: TUPLE)
			-- Set `last_product.h' with a new instance of
			-- type `H' created with arguments `args_h'.
		require
			last_product_not_void: last_product /= Void
			valid_args_h: factory_function_h.valid_operands (args_h)
		do
			if attached last_product as l_last_product and then
			   attached {ANY} h_factory.new_with_args (args_h) as l_new_h_factory then
				l_last_product.set_h (l_new_h_factory)
			end
		ensure
			h_not_void: attached last_product as l_last_product and then attached l_last_product.h
		end

feature {NONE} -- Factories

	f_factory: FACTORY [F]
			-- Factory of objects of type `F'

	g_factory: FACTORY [G]
			-- Factory of objects of type `G'

	h_factory: FACTORY [H]
			-- Factory of objects of type `H'

invariant

	factory_function_f_not_void: factory_function_f /= Void
	factory_function_g_not_void: factory_function_g /= Void
	factory_function_h_not_void: factory_function_h /= Void
	f_factory_not_void: f_factory /= Void
	g_factory_not_void: g_factory /= Void
	h_factory_not_void: h_factory /= Void

end
