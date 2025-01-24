#!/usr/bin/env gnuplot -p

set term cairolatex pdf size 12.9cm,12.9cm 

load 'common.gp'

b(n)    = (n % 2 != 0) ? 4./(pi*n) : 0.
f(x, N) = sum [n=0:N] b(n)*sin(2*n*pi*x)
sq(x) = 2.*(2.*floor(x) - floor(2.*x)) + 1.

set grid
set key spacing 1.5
set xlabel '$t$'

top=0.95
bottom=0.1
s=(top-bottom-0.1)/2.

set multiplot layout 2,1
set lmargin at screen 0.1; set rmargin at screen 0.95
set tmargin at screen top; set bmargin at screen top - s
set xrange [0:1]
set yrange [-1.3:1.3]
plot (abs(2.*x - floor(2.*x)) > 1.0e-2) ? sq(x) : 1/0 lw 8 t '$\mathrm{sq}(t)$',\
     f(x,5) sharpen t 'partial sum $N=5$',\
     f(x,50) sharpen t '$N=50$',\
     f(x,100) sharpen t '$N=100$'
set tmargin at screen top - s - 0.1; set bmargin at screen top - 0.1 - 2.*s
set xrange [0.39:0.51]
set yrange [0.8:1.3]
plot (abs(2.*x - floor(2.*x)) > 1.0e-2) ? sq(x) : 1/0 lw 8 notitle,\
     f(x,5) sharpen notitle,\
     f(x,50) sharpen notitle,\
     f(x,100) sharpen notitle,\
     1+ 2*(1.851/pi - 0.5) dt 2 lw 3 lc rgb 'black' notitle
