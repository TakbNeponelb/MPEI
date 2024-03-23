import numpy as np
import math

#number = 11
number = 18801
#data = 100100101110001

data = format(number, '016b')

print(data)

print(len(data))

number_of_control_digits = math.ceil(math.log2(len(data))) + 1

print(number_of_control_digits)
data2 = [data[i] for i in range(len(data))]
print(data2)
length = len(data)
[data2.insert(i, 0) for i in range(length) if (i+1) & i == 0]
print(data2)
print(len(data2))


