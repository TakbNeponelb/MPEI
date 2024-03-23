#

import math

def f(x):
    return (2 * x - 1) * math.cos(2 * x)

def midpoint_rule_integration(a, b, n):
    h = (b - a) / n
    integral = 0
    for i in range(n):
        x = a + (i + 0.5) * h
        integral += f(x)
    integral *= h
    return integral

a = 0
b = math.pi / 4

for i in range(1, 15):
    result = midpoint_rule_integration(a, b, 10**i)
    print(f"Number of subintervals: {i}, Approximated Integral: {result}")
