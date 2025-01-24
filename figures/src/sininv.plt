#!/usr/bin/env gnuplot -p

set term cairolatex pdf size 12.9cm,8cm 

load 'common.gp'

set xrange [0:1]
set yrange [-1.5:1.5]
set grid
set key spacing 1.5
set xlabel '$t$'

plot sin(1/x) sharpen t '$\sin(\frac{1}{t})$'
