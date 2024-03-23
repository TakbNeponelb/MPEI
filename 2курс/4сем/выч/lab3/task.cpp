#include <iostream>
#include <iomanip>
#include <cmath>

using FunctionRef = long double (&)(long double);

long double f(long double x) {
    return (2.0L * x - 1.0L) * std::cos(2.0L * x);
}

long double midpoint_rule_integration(long double a, long double b, long long int n) {
    long double h = (b - a) / n;
    long double* integral = new long double(0.0L);
    long double x = a - 0.5L * h;
    FunctionRef ref = f;
    long double func;
    while (n > 0) {
        x = x + h;
        func = ref(x);
        *integral = *integral + func;
        n = n - 1;
        std::cout << n << "\r";
    }
    *integral = *integral * h;
    return *integral;
}

int main() {
    long double a = 0.0L;
    long double b = M_PI / 4.0L;
    for (int i = 10; i <= 15; ++i) {
        long long int n = std::pow(10, i);
        long double result = midpoint_rule_integration(a, b, n);
        std::cout << "Number of subintervals: 10^" << i << ", Approximated Integral: " << std::setprecision(25) << result << std::endl;
    }

    return 0;
}
