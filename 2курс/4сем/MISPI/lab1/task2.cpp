#include <iostream>
#include <string>
#include <map>
#include <set>
#include <bitset>
#include <cmath>
#include <algorithm>

std::string encodeMessage(const std::string& message, const std::map<char, std::string>& codeDictionary) {
    std::string encodedMessage = "";

    for (char c : message) {
        if (codeDictionary.find(c) != codeDictionary.end()) { // ��������� ������� ������� � �������
            encodedMessage +=  " " + codeDictionary.at(c); // ��������� �������������� ������, ���� ����� ���� � �������
        } else {
            // ��������� ������, ����� ������ ����������� � ������� �������
            std::cerr << "Symbol '" << c << "' isn't find in code dict" << std::endl; // ������, ���� � ������� ������ ������������� ���
        }
    }

    return encodedMessage;
}

int main() {
    setlocale(LC_ALL, "Russian");
    std::string message = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    //std::string message = "������ ��� �� �������"; // ������ ��� ���������
    std::map<char, std::string> codeDictionary; // ������� � ����������
    std::set<char> Dict; // ��������� ���� ��������� ������

    std::for_each(message.begin(), message.end(), [&](char c) { // ������� ��������� �� ������ 
        Dict.insert(c); // ��������� ������ � ���������
    });

    int codeLength = ceil(std::log2(size(Dict))); // �� ������� ������� ���������� ���, ������� ����� ��� ���������

    std::transform(message.begin(), message.end(), message.begin(), // �������� ������ � ������� ��������
                   [](unsigned char c){ return std::tolower(c); });


    std::cout << codeLength << std::endl; // ������� ����������� ������ ��������������� �������

    std::cout << message << std::endl; // ������� ������
    
    for (size_t i = 0; i < message.size(); ++i) { // ���������� ������� �������
        char c = message[i];
        codeDictionary[c] = std::bitset<8>(i).to_string().substr(8 - codeLength); // ��������� ������� �������
        // �������, ��� ������������ ����� �������������� ������ 8 ���, ����������� �� � �������� �������������, ������� �� ��� �������� ����
    }

    std::string encodedMessage = encodeMessage(message, codeDictionary); // �������� ���������

    std::cout << "Encoded Message: " << encodedMessage << std::endl; // ������� ���������

    return 0;
}