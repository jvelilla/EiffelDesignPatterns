note

	description:
		"[
			Build a product of type `F', 
			which  composed of three parts
			(the first part being of type `G',
			the second part of type `H'
			and the third part of type `J').
		]"

	library: "Builder library"
	author: "Karine Arnout"
	copyright: "Copyright (c) 2002-2004, ETH Zurich, Switzerland"
	license: "Eiffel Forum License v2 (see License.txt)"
	date: "$Date: 2004/03/15 $"
	revision: "$Revision: 1.0 $"

class THREE_PART_BUILDER [F -> BUILDABLE, G, H, J]

inherit

	BUILDER [F]

create

	make

feature {NONE} -- Initialization

	make (f: like factory_function_f; g: like factory_function_g;
		h: like factory_function_h; j: like factory_function_j)
			-- Set `factory_function_f' to `f'.
			-- Set `factory_function_g' to `g'.
			-- Set `factory_function_h' to `h'.
			-- Set `factory_function_j' to `j'.
		require
			f_not_void: f /= Void
			g_not_void: g /= Void
			h_not_void: h /= Void
			j_not_void: j /= Void
		do
			factory_function_f := f
			factory_function_g := g
			factory_function_h := h
			factory_function_j := j
			create f_factory.make (factory_function_f)
			create g_factory.make (factory_function_g)
			create h_factory.make (factory_function_h)
			create j_factory.make (factory_function_j)
		ensure
			factory_function_f_set: factory_function_f = f
			factory_function_g_set: factory_function_g = g
			factory_function_h_set: factory_function_h = h
			factory_function_j_set: factory_function_j = j
		end

feature -- Access

	last_product: detachable F
			-- Product under construction

feature -- Status report

	is_ready: BOOLEAN
			-- Is builder ready to build `last_product'?
		do
			Result := valid_args ([], [], [], [])
		end

	valid_args (args_f, args_g, args_h, args_j: TUPLE): BOOLEAN
			-- Are `args_f', `args_g', `args_h' and `args_j' valid arguments
			-- to build `last_product'?
		do
			Result := factory_function_f.valid_operands (args_f)
						and then factory_function_g.valid_operands (args_g)
						and then factory_function_h.valid_operands (args_h)
						and then factory_function_j.valid_operands (args_j)
		end

feature -- Basic Operations

	build
			-- Build `new_product'.
			--|Successively call `build_g', `build_h' and `build_j'
			--|to build the corresponding product parts.
		do
			check attached f_factory.new as l_new then
				last_product := l_new
			end
			check
				last_product_not_void: last_product /= Void
			end
			build_g ([])
			build_h ([])
			build_j ([])
		ensure then
			g_not_void: attached last_product as l_last_product and then attached l_last_product.g
			h_not_void: attached l_last_product.h
			j_not_void: attached l_last_product.j 
		end

	build_with_args (args_f, args_g, args_h, args_j: TUPLE)
			-- Build `new_product' with `args_f'.
			--|Successively call `build_g' with `args_g'
			--|`build_h' with `args_h',
			--|`build_j' with `arg_j'.
		require
			valid_args: valid_args (args_f, args_g, args_h, args_j)
		do
			if attached f_factory.new_with_args (args_f) as l_f_new then
				last_product := l_f_new
			end
			check
				last_product_not_void: last_product /= Void
			end
			build_g (args_g)
			build_h (args_h)
			build_j (args_j)
		ensure
			last_product_not_void: last_product /= Void
			g_not_void:  attached last_product as l_last_product and then attached l_last_product.g
			h_not_void:  attached l_last_product.h
			j_not_void:  attached l_last_product.j
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

	factory_function_j: FUNCTION [ANY, TUPLE, J]
			-- Factory function creating new instances of
			-- type J

feature {NONE} -- Basic Operations

	build_g (args_g: TUPLE)
			-- Set `last_product.g' with a new instance of
			-- type `G' created with arguments `args_g'.
		require
			last_product_not_void: last_product /= Void
			valid_args_g: factory_function_g.valid_operands (args_g)
		do
			if  attached last_product as l_last_product and then
				attached g_factory.new_with_args (args_g) as l_g_new  then
				l_last_product.set_g (l_g_new)
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
			if  attached last_product as l_last_product and then
				attached h_factory.new_with_args (args_h) as l_h_new then
				l_last_product.set_h (l_h_new)
			end
		ensure
			h_not_void: attached last_product as l_last_product and then attached l_last_product.h
		end

	build_j (args_j: TUPLE)
			-- Set `last_product.j' with a new instance of
			-- type `J' created with arguments `args_j'.
		require
			last_product_not_void: last_product /= Void
			valid_args_j: factory_function_j.valid_operands (args_j)
		do
			if  attached last_product as l_last_product and then
				attached j_factory.new_with_args (args_j) as l_j_new then
				l_last_product.set_j (l_j_new)
			end
		ensure
			j_not_void:  attached last_product as l_last_product and then attached l_last_product.j
		end

feature {NONE} -- Factories

	f_factory: FACTORY [F]
			-- Factory of objects of type `F'

	g_factory: FACTORY [G]
			-- Factory of objects of type `G'

	h_factory: FACTORY [H]
			-- Factory of objects of type `H'

	j_factory: FACTORY [J]
			-- Factory of objects of type `J'

invariant

	factory_function_f_not_void: factory_function_f /= Void
	factory_function_g_not_void: factory_function_g /= Void
	factory_function_h_not_void: factory_function_h /= Void
	factory_function_j_not_void: factory_function_j /= Void
	f_factory_not_void: f_factory /= Void
	g_factory_not_void: g_factory /= Void
	h_factory_not_void: h_factory /= Void
	j_factory_not_void: j_factory /= Void

end
