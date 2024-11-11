#!/usr/bin/env gnuplot -p

set term epslatex color size 12.9cm,8cm 

load 'common.gp'

phi = 0.2*2*pi
om = 2
t0 = phi/(2.*pi)/om

set xrange [-0.25:0.75]
set yrange [-1.5:1.5]
set grid
set key spacing 1.5
set xlabel '$t$'
set arrow from -t0,0 to 0,0 heads lw 4
set label '$t_0=\frac{T\phi}{2\pi}$' at -t0, -0.25
set arrow from 0.25/om-t0,1.0 to 0.25/om-t0+1.0/om,1.0 heads lw 4 front
set label '$T=\frac{1}{\omega}$' at 0.25/om-t0+0.4/om, 1.25

plot sin(2.*pi*om*x + phi) notitle
