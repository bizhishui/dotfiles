GeoF = "`pwd`/GeometricParameters.txt"

set terminal postscript enhanced eps color font "Times-Roman" 22 dashlength 3
set title '{/Symbol q}'
set xlabel 't'
set ylabel '{/Symbol q}' rotate by 90

set output "`pwd`/theta.eps"
plot GeoF using 1:(180/pi*atan($13/$12)) title '{/Symbol q}' with lines lt 1 lw 2 
