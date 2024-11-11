#!/usr/bin/env gnuplot -p

set term epslatex color size 12.9cm,8cm 

load 'common.gp'

set xrange [0:10]
set yrange [-2:3]
set grid
set key spacing 1.5
set xlabel '$t$'

plot sin(2.*pi/3.*x) + sin(pi*x) t '$\sin\left(\frac{2\pi}{3}t\right)+\sin(\pi t)$',\
     sin(x) + sin(pi*x) t '$\sin(t)+\sin(\pi t)$'
