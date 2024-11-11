#!/usr/bin/env gnuplot -p

set term epslatex color size 12.9cm,8cm 

load 'common.gp'

set xrange [0:3]
set yrange [-1.5:1.5]
set grid
set key spacing 1.5
set xlabel '$t$'

plot 2.*(2.*floor(x) - floor(2.*x)) + 1. t '$\mathrm{sq}(t)$'
