#!/usr/bin/env gnuplot -p

set term cairolatex pdf size 12.9cm,8cm 

load 'common.gp'

set xrange [-4:4]
set yrange [0.0:2.0]
set grid
set key spacing 1.5
set xlabel '$x$'

g(x,sig) = exp(-x**2/(2*sig**2))/(sig*sqrt(2*pi))

plot g(x,1.0) t '$\gauss_1(x)$', g(x,0.5) t '$\gauss_{\frac{1}{2}}(x)$',\
     g(x,0.25) t '$\gauss_{\frac{1}{4}}(x)$'
