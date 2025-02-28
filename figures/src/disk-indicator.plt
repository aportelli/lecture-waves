#!/usr/bin/env gnuplot -p

set terminal cairolatex png size 15cm,7.1cm resolution 250

set xrange [-0.5:0.5]
set xlabel '$x$'
set yrange [-0.5:0.5]
set ylabel '$y$' offset -1,0
cmin = -0.2
cmax = 1.2
crange(x) = (x-cmin)/(cmax-cmin)
set cbrange [cmin:cmax]
set grid

set tmargin at screen 0.9; set bmargin at screen 0.15
set view map
set isosamples 400,400
set samples 600,600
set pm3d interpolate 2,2
set size ratio -1
set palette defined ( crange(cmin) 'orange-red', crange(0) 'white', crange(cmax) 'royalblue' )

left=0.1
right=0.9
sp=0.05
s=(right-left-2*sp)/2.

chi(x,y) = (sqrt(x**2 + y**2) <= 0.25) ? 1 : 0
pi = 3.141592653589793
N_max = 15
f(x,y) = (pi/16.0) \
         + sum [m=-N_max:N_max] ( \
             sum [n=-N_max:N_max] ( \
                ( (sqrt(m*m+n*n) <= N_max && (m != 0 || n != 0) ) ) ? \
                  ( besj1((pi/2.0)*sqrt(m*m+n*n))/(4.0*sqrt(m*m+n*n)) * cos(2*pi*(m*x+n*y)) ) \
                  : 0 \
             ) \
         )

set multiplot layout 2,1

set lmargin at screen left; set rmargin at screen left+s
set title '$\chi_D(x,y)$' offset 0,-1
unset colorbox
splot chi(x,y) notitle with pm3d
set lmargin at screen left+s+sp; set rmargin at screen left+2*s+sp
set title '$s_{15}(\chi_D)(x,y)$' offset 0,-1
set colorbox
unset ylabel
set format y ''
splot f(x,y) notitle with pm3d
