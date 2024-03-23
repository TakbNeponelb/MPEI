#include <iostream>
#include <vector>
#include <string>

bool isPrefixCode(const std::vector<std::string>& codes) {
    for (size_t i = 0; i < codes.size(); ++i) {
        for (size_t j = i + 1; j < codes.size(); ++j) {
            if (codes[i].substr(0, codes[j].size()) == codes[j] || // �᫨ � i-⮩ �����ப� ࠧ��� j ᮤ�ন��� j-�� �����ப� 
                codes[j].substr(0, codes[i].size()) == codes[i]) { // �᫨ � j-⮩ �����ப� ࠧ��� i ᮤ�ন��� i-�� �����ப�
                return false;  // ������ ��䨪�� ���
            }
        }
    }
    return true;  // �� ������� ��䨪᭮�� ����
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

