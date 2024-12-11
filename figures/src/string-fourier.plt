#!/usr/bin/env gnuplot -p

set term cairolatex pdf size 12.9cm,8cm 

load 'common.gp'

A=1
L=30
u0(x)   = x < L/2. ? 2.*A/L*x : 2.*A/L*(L-x)
a(n)    = 8*A/(pi**2*n**2)*sin(0.5*pi*n)
f(x, N) = sum [n=1:N] a(n)*sin(pi/L*n*x) 

set xrange [0:L]
set yrange [0:1.2]
set grid
set key spacing 1.5
set xlabel '$x$~($\mathrm{cm}$)'
set ylabel 'displacement ($\mathrm{cm}$)'

plot [0:L] u0(x) lw 8 t '$u_0(x)$',\
     f(x,1) t 'partial sum $N=1$',\
     f(x,3) t '$N=3$',\
     f(x,5) t '$N=5$',\
     f(x,7) t '$N=7$'
