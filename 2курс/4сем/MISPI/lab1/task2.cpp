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
        if (codeDictionary.find(c) != codeDictionary.end()) { // проверяем наличие символа в словаре
            encodedMessage +=  " " + codeDictionary.at(c); // добавляем закодированную строку, если такая есть в словаре
        } else {
            // Обработка случая, когда символ отсутствует в кодовом словаре
            std::cerr << "Symbol '" << c << "' isn't find in code dict" << std::endl; // ошибка, если в словаре такого представления нет
        }
    }

    return encodedMessage;
}

int main() {
    setlocale(LC_ALL, "Russian");
    std::string message = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    //std::string message = "Машина или не трактор"; // строка для кодировки
    std::map<char, std::string> codeDictionary; // словарь с кодировкой
    std::set<char> Dict; // множество всех элементов строки

    std::for_each(message.begin(), message.end(), [&](char c) { // создаем множество из строки 
        Dict.insert(c); // Вставляем символ в множество
    });

    int codeLength = ceil(std::log2(size(Dict))); // по формуле находим количество бит, которое нужно для кодировки

    std::transform(message.begin(), message.end(), message.begin(), // приводим строку к нижнему регистру
                   [](unsigned char c){ return std::tolower(c); });


    std::cout << codeLength << std::endl; // выводим мксимальный размер закодированного символа

    std::cout << message << std::endl; // выводим строку
    
    for (size_t i = 0; i < message.size(); ++i) { // составляем кодовый словарь
        char c = message[i];
        codeDictionary[c] = std::bitset<8>(i).to_string().substr(8 - codeLength); // заполняем кодовый словарь
        // считаем, что максимальная длина закодированной строки 8 бит, преобразуем ее в двоичное представление, отсекая от нее передние нули
    }

    std::string encodedMessage = encodeMessage(message, codeDictionary); // кодируем сообщение

    std::cout << "Encoded Message: " << encodedMessage << std::endl; // выводим сообщение

    return 0;
}