#|
Interval with center and tolerance: 
[c - w, c + w] = [c - c*T, c + c*T] = [c(1-T),c(1+T)] 
=> tolerance([a1,b1]*[b1*b2])
= tolerance(
    [c1 - c1*T1,c1 + c1*T1]*[c2 - c2*T2,c2 + c2*T2] 
    = [c1*c2*(1-T1)(1-T2),c1*c2(1+T1)(1+T2)]
    = [c1*c2*(1 - (T1 + T2) + T1T2),c1*c2*(1 + (T1 + T2) + T1T2)]
)
Assuming T1 and T2 are very small => T1*T2 is even smaller
Tolerance of the product is approximately the product of the tolerances of the component intervals
|#