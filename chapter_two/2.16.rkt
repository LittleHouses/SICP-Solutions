 
#| observe:
Let I = [a,b]
Theoretically, we would expect preforming an arbitrary amount of inverse algebraic expressions
to act like an identity element, eg
I*I/I*I/I == I
But when we look at our interval arithmetic:
[a,b]*[a,b]/[a,b]
= max(aa, ab, bb)/[a,b] **assuming all positive 
=[aa,bb]/[a,b]
=[aa,bb]*[1/a,1/b]
=max(a,aa/b,bb/a,b)
Since a<b by definition, this is where our problem arises, since:
(a = aa/a) > aa/b && (b = bb/b) < bb/a
Therefore, we arive at:
[a,a]*[a,b]/[a,b] = [(a^2)/b,(b^2)/a]

Thus, mult and division in our interval arithmetic are not inverse operations
and we cannot expect algebra with this arithmetic to produce results analogous to algebra with real numbers. 

The solution would be to devise an interval arithmetic such that mult and division are inverse operations
ie, [a,b]*[a,b]/[a,b] = [a,b]
We want to create an algebraic group with the set of intervals, ie:
Multiplying two intervals must produce an interval
There must be an identity element (perhaps [1,1])
Multiplication must be associative
and each element must have an inverse (division).