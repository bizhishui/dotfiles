GeoF = "`pwd`/GeometricParameters.txt"

set terminal postscript enhanced eps color font "Times-Roman" 22 dashlength 3
set title 'R_0'
set xlabel 't'
set ylabel 'R_0 (S)' rotate by 90
set y2label 'R_0 (V)' rotate by -90
set y2tics

set output "`pwd`/R0.eps"
plot GeoF using 1:((0.75*$3/pi)**(1.0/3.0)) title 'R_0 (V)' with lines lt 1 lw 2 axes x1y2, \
     GeoF using 1:(sqrt(0.25*$4/pi)) title 'R_0 (S)' with lines lt 2 lw 2  axes x1y1
