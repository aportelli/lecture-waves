#!/usr/bin/env gnuplot -p

set terminal cairolatex png size 15cm,7.1cm resolution 250

set xrange [-3:3]
set xlabel '$x$'
set yrange [-3:3]
set ylabel '$y$' offset -1,0
set grid

set tmargin at screen 0.9; set bmargin at screen 0.15
set view map
set isosamples 400,400
set samples 200,200
set pm3d interpolate 2,2
set size ratio -1
set palette defined ( -1 'orange-red', 0 'white', 1 'royalblue' )

left=0.1
right=0.9
sp=0.05
s=(right-left-2*sp)/2.

set multiplot layout 2,1

set lmargin at screen left; set rmargin at screen left+s
set title '$\sin(2\pi r)$' offset 0,-2
unset colorbox
splot sin(2*pi*sqrt(x**2+y**2)) notitle with pm3d
set lmargin at screen left+s+sp; set rmargin at screen left+2*s+sp
set title '$\frac12\sin(2\pi r_1)+\frac12\sin(2\pi r_2)$' offset 0,-6.1
set colorbox
unset ylabel
set format y ''
splot 0.5*sin(2*pi*sqrt((x+1)**2+(y-1.5)**2))+0.5*sin(2*pi*sqrt((x-2)**2+y**2)) notitle with pm3d