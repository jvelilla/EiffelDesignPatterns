note
	description: "Implementing Singleton using once class"
	eis: "name=once classes", "src=https://www.eiffel.org/blog/Alexander Kogtenkov/2020/12/once-classes", ""

once class ONCE_COUNTER

create
	count

feature {NONE} -- Creation

	count once end
feature -- Access

	stats: NATURAL assign set_stats


	set_stats (a_stats: like stats)
			-- Set `stats` to the given value.
		do
			stats := a_stats
		ensure
			stats_set : stats = a_stats
		end

	reset_stats
		do
			stats := 0
		end

invariant
      stats_positive: stats >= 0
end
