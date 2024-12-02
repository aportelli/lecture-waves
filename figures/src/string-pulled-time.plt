#!/usr/bin/env gnuplot -p

set term cairolatex pdf size 12.9cm,8cm 

A=1
L=30
c=263.95*100

p(x) = floor(x/L)
w(x) = x - L*p(x)
f(x) = (-1)**p(x)*(w(x) < L/2. ? 2.*A/L*w(x) : 2.*A/L*(L-w(x)))
u(t,x) = 0.5*(f(x-c*t)+f(x+c*t))

load 'common.gp'

set xrange [0:0.01]
set yrange [-1.5:2.5]
set grid
set key spacing 1.5
set xlabel '$t$~($\mathrm{s}$)'
set ylabel 'displacement ($\mathrm{cm}$)'

plot u(x,L/2) t '$u(t,x=L/2)$', u(x,L/4) t '$u(t,x=L/4)$', u(x,L/6) t '$u(t,x=L/6)$'
