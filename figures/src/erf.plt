#!/usr/bin/env gnuplot -p

set term cairolatex pdf size 12.9cm,8cm 

load 'common.gp'

set xrange [-4:4]
set yrange [-1.1:1.1]
set grid
set key spacing 1.5 Left left reverse
set xlabel '$x$'

plot erf(x) t '$\erf(x)$'
