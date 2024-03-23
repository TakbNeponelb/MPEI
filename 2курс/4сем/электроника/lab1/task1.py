import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit

# Заданные данные точек (F, H(f))
F = np.array([46, 100, 220, 460, 1000, 2200, 4600, 10000, 22000, 46000, 100000, 220000])
H_f = np.array([0.077777778, 0.166666667, 0.333333333, 0.612244898, 0.816326531, 
                0.93877551, 0.959183673, 0.959183673, 0.96, 0.979591837, 
                0.979591837, 0.959183673])

# Функция для аппроксимации
def func(x, a, b):
    return a * np.log(x) + b

# Аппроксимация кривой через данные точки
popt, pcov = curve_fit(func, F, H_f)

# Параметры для графика
F_range = np.linspace(min(F), max(F), 500)
H_f_fit = func(F_range, *popt)

# Построение графика
plt.figure(figsize=(10, 6))
plt.scatter(F, H_f, label='Исходные данные')
plt.plot(F_range, H_f_fit, 'r-', label='Аппроксимация')
plt.xlabel('F')
plt.ylabel('H(f)')
plt.legend()
plt.title('График данных с аппроксимацией')
plt.grid(True)
plt.show()
