#!/usr/bin/env gnuplot -p

set terminal cairolatex png size 15cm,7.1cm resolution 250

set xrange [-1.4:1.4]
set xlabel '$x$'
set yrange [-1.4:1.4]
set ylabel '$y$' offset -1,0
set grid

set tmargin at screen 0.9; set bmargin at screen 0.1

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
unset colorbox
set title '$\sw(\vec{x};(1,2))$' offset 0,-2
set arrow from 0,0 to 1./sqrt(5.),2./sqrt(5.) lw 4 front
set label '$\hat{\vec{\omega}}$' at 0.35,0.5 front
set arrow from 0,0 to 2./sqrt(5.),-1./sqrt(5.) lw 4 front
set label '$\hat{\vec{\omega}}_{\perp}$' at 0.3,-0.35 front
splot sin(2*pi*(x+2.*y)) notitle with pm3d

set lmargin at screen left+s+sp; set rmargin at screen left+2*s+sp
set colorbox
unset arrow
unset label
unset ylabel
set title '$\frac{1}{2}\sw(\vec{x};(1,2))+\frac{1}{2}\sw(\vec{x};(1,-1))$' offset 0,-6
set format y ''
splot 0.5*sin(2*pi*(x+2.*y))+0.5*sin(2*pi*(x-y)) notitle with pm3d