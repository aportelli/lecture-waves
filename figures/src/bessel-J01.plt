#!/usr/bin/env gnuplot -p

set term cairolatex pdf size 12.9cm,8cm 

load 'common.gp'

set xrange [-20:20]
set yrange [-0.7:1.1]
set grid
set key spacing 1.5
set xlabel '$t$'

plot besj0(x) t '$J_0(x)$', besj1(x) t '$J_1(x)$'
