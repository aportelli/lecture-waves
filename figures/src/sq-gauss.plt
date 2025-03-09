#!/usr/bin/env gnuplot -p

set term cairolatex pdf size 14.9cm,8cm 

load 'common.gp'

set xrange [-1.1:1.1]
set yrange [-1.1:1.1]
set grid
set key spacing 1.5 outside
set xlabel '$x$'

chig(x, a, b, sig) = 0.5*(erf((x-a)/(sig*sqrt(2)))-erf((x-b)/(sig*sqrt(2))))
f(x, sig, n) = sum[k=-n:n]((-1)**k*chig(x, 0.5*k, 0.5*(k+1), sig))

plot f(x,0.2,5) t '$f_{0.2}(x)$', f(x,0.1,5) t '$f_{0.1}(x)$', f(x,0.05,5) t '$f_{0.05}(x)$', f(x,0.01,5) t '$f_{0.01}(x)$'
