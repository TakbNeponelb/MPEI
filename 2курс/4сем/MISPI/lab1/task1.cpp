#include <iostream>
#include <cmath>
#include <map>

int main()
{
    std::map<std::string, int> dictTime // словарь времени
    {
        {"red",108}, 
        {"yellow",4}, 
        {"green",16}, 
    };
    std::map<std::string, double> dictP // словарь вероятности
    {
        {"red",static_cast<double>(dictTime["red"]) / (dictTime["red"] + dictTime["yellow"] + dictTime["green"])}, 
        {"yellow",static_cast<double>(dictTime["yellow"]) / (dictTime["red"] + dictTime["yellow"] + dictTime["green"])}, 
        {"green",static_cast<double>(dictTime["green"]) / (dictTime["red"] + dictTime["yellow"] + dictTime["green"])}, 
    };
    std::map<std::string, double> dictInf // словарь информации
    {
        {"red",std::log2(1./dictP["red"])}, 
        {"yellow",std::log2(1./dictP["yellow"])}, 
        {"green",std::log2(1./dictP["green"])}, 
    };

    std::cout << "Color Time" << std::endl; // вывод времени
    for(const auto& [color, time] : dictTime) std::cout << color << ": " << time << " | ";
    std::cout << std::endl;

    std::cout << "Color Probability" << std::endl; // вывод вероятности
    for(const auto& [color, prob] : dictP) std::cout << color << ": " << prob << " | ";
    std::cout << std::endl;

    std::cout << "Color Information" << std::endl; // вывод информации
    for(const auto& [color, i] : dictInf) std::cout << color << ": " << i << " | ";
    std::cout << std::endl;

    std::cout << "Red and Yellow: " << dictP["red"] * dictInf["red"] + dictP["yellow"] * dictInf["yellow"] << std::endl;

    double H;
    std::cout << "Entropy" << std::endl; // расчет энтропии
    for (const auto& [color, prob] : dictP) H += prob * std::log2(1./prob);
    std::cout << H << std::endl;
    return 0;
}