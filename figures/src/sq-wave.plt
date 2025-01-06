#!/usr/bin/env gnuplot -p

set term cairolatex pdf size 12.9cm,8cm 

load 'common.gp'

set xrange [0:3]
set yrange [-1.5:1.5]
set grid
set key spacing 1.5
set xlabel '$t$'

sq(x) = 2.*(2.*floor(x) - floor(2.*x)) + 1.

plot (abs(2.*x - floor(2.*x)) > 1.0e-2) ? sq(x) : 1/0 t '$\mathrm{sq}(t)$',\
     npts(6) u ($0/2):(sq($0/2)) lc 1 pt 7 ps 0.5 notitle
