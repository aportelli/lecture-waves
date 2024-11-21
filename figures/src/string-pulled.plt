#!/usr/bin/env gnuplot -p

set term epslatex color size 12.9cm,5cm 

A=1
L=30

f(x)= x < L/2. ? 2.*A/L*x : 2.*A/L*(L-x)

load 'common.gp'

set xrange [0:L]
set yrange [0:1.2]
set grid
set key spacing 1.5
set xlabel '$x$~($\mathrm{cm}$)'
set ylabel 'displacement ($\mathrm{cm}$)'

plot [0:L] f(x) t '$u_0(x)$'
