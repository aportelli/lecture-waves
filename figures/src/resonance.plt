#!/usr/bin/env gnuplot -p

set terminal cairolatex pdf size 15cm,22cm

load 'common.gp'


set grid

top=0.95
bottom=0.07
sp=0.05
s=(top-bottom-2*sp)/2.

R(xi, z) = 1./sqrt((1-xi**2)**2 + 4.*z**2*xi**2)
phi(xi, z) = (xi < 1) ? atan(2*z*xi/(1-xi**2)) : \
  ((xi == 1) ? pi/2 : atan(2*z*xi/(1-xi**2))+pi)

set multiplot layout 2,1

set lmargin at screen 0.1; set rmargin at screen 0.9
set tmargin at screen top; set bmargin at screen top-s
set ylabel '$\bar{R}(\xi)$'
set ylabel offset -0.8,0
set yrange [0.0:2.8]
set xrange [0:2.7]
set key spacing 1.5
set xlabel ''
set format x ''

plot R(x, 0.2) title '$\zeta = 0.2$', \
     R(x, 0.3) title '$\zeta = 0.3$', \
     R(x, 0.5) title '$\zeta = 0.5$', \
     R(x, 1.0) title '$\zeta = 1.0$', \
     R(x, 1.5) title '$\zeta = 1.5$'

set tmargin at screen top-s-sp; set bmargin at screen top-2*s-sp
set yrange [0.0:pi]
set ytics ('$0$' 0, '$\displaystyle\frac{\pi}{4}$' pi/4, '$\displaystyle\frac{\pi}{2}$' pi/2, '$\displaystyle\frac{3\pi}{4}$' 3*pi/4, '$\displaystyle\pi$' pi)
set ylabel '$\phi(\xi)$'
set ylabel offset 1,0
set xlabel '$\xi=\omega/\omega_0$'
set format x '$% g$'

plot phi(x, 0.2) notitle, \
     phi(x, 0.3) notitle, \
     phi(x, 0.5) notitle, \
     phi(x, 1.0) notitle, \
     phi(x, 1.5) notitle
