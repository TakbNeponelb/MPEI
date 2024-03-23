#include <iostream>
#include <vector>
#include <string>

bool isPrefixCode(const std::vector<std::string>& codes) {
    for (size_t i = 0; i < codes.size(); ++i) {
        for (size_t j = i + 1; j < codes.size(); ++j) {
            if (codes[i].substr(0, codes[j].size()) == codes[j] || // если в i-той подстроке размера j содержится j-тая подстрока 
                codes[j].substr(0, codes[i].size()) == codes[i]) { // если в j-той подстроке размера i содержится i-тая подстрока
                return false;  // Найден префиксный код
            }
        }
    }
    return true;  // Не найдено префиксного кода
}

int main() {
    std::vector<std::string> codes = {"10", "110", "1100", "01"};
    //std::vector<std::string> codes = {"10", "110", "1110", "01"};

    if (isPrefixCode(codes)) {
        std::cout << "DATA IS PREFIX" << std::endl;
    } else {
        std::cout << "DATA ISN'T PREFIX" << std::endl;
    }

    return 0;
}

