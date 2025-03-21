#!/usr/bin/env gnuplot -p

set term cairolatex pdf size 12.9cm,10cm 

load 'common.gp'

set xrange [0:30]
set yrange [-2.5:2.5]
set grid
set key spacing 1.5

top=0.95
bottom=0.1
s=(top-bottom)/2.
f=1.1

set format x ''
set multiplot layout 2,1
set tmargin at screen top; set bmargin at screen top - s
plot sin(2*pi*x) notitle lc 1, sin(2*pi*x*f) notitle lc 2
set tmargin at screen top - s; set bmargin at screen top - 2.*s
set format x '$% g$'
set xlabel '$t$'
plot sin(2*pi*x)+sin(2*pi*x*f) notitle lc 3
