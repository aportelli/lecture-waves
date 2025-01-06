set samples 1000

# helper for discrete plots
npts(n) = sprintf('< for x in $(seq %d); do printf "0\n"; done', n)

# category10 colors
set linetype  1 lc rgb "#1f77b4" lw 5
set linetype  2 lc rgb "#ff7f0e" lw 5
set linetype  3 lc rgb "#2ca02c" lw 5
set linetype  4 lc rgb "#d62728" lw 5
set linetype  5 lc rgb "#9467bd" lw 5
set linetype  6 lc rgb "#8c564b" lw 5
set linetype  7 lc rgb "#e377c2" lw 5
set linetype  8 lc rgb "#7f7f7f" lw 5
set linetype  9 lc rgb "#bcbd22" lw 5
