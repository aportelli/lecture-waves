#!/usr/bin/env gnuplot -p

set term cairolatex pdf size 12.9cm,8cm 

load 'common.gp'

Gud(om, zeta, t) = (t > 0) ?\
   exp(-2*pi*om*zeta*t)*sin(2*pi*om*sqrt(1-zeta**2)*t)/(2*pi*om*sqrt(1-zeta**2)) : 0
God(om, zeta, t) = (t > 0) ?\
   exp(-2*pi*om*zeta*t)*sinh(2*pi*om*sqrt(zeta**2-1)*t)/(2*pi*om*sqrt(zeta**2-1)) : 0
Gcr(om, t) = (t > 0) ? t*exp(-2*pi*om*t) : 0

set xrange [-2:4]
set yrange [-0.07:0.13]
set grid
set key spacing 1.5
set xlabel '$t$ ($\mathrm{s}$)'
set ylabel '$G(t)$ ($\mathrm{s}$)'

plot Gud(1,0.2,x) t '$\zeta=0.2$',\
     God(1,4,x) t '$\zeta=2$',\
     Gcr(1,x) t '$\zeta=1$'
