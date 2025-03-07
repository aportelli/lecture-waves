#!/usr/bin/env gnuplot -p

set terminal cairolatex pdf size 15cm,7.1cm

load 'common.gp'

set yrange [-0.5:1.5]
set grid

set tmargin at screen 0.9; set bmargin at screen 0.15

left=0.05
right=0.95
sp=0.05
s=(right-left-2*sp)/2.

set multiplot layout 2,1

set lmargin at screen left; set rmargin at screen left+s
set xrange [-1:1]
set xlabel '$x$'

plot (abs(x) < 0.49) ? 1 : ((abs(x) > 0.51) ? 0 : 1/0) lc 1 t '$\chi(x)$',\
  npts(2) u ($0 - 0.5):(0) lc 1 pt 7 ps 0.5 notitle

set lmargin at screen left+s+sp; set rmargin at screen left+2*s+sp
set xrange [-6:6]
set xlabel '$\omega$'
set format y ''
plot sin(pi*x)/(pi*x) title '$\sinc(\omega)$'