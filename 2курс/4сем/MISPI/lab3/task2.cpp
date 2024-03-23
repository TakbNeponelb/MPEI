#include <iostream>
#include <vector>
#include <string>
#include <map>

using namespace std;

string encodeString(const string& input, const map<char, string>& encodingMap) {
    string encodedString;
    for(char c : input) {
        encodedString += encodingMap.at(c);
    }
    return encodedString;
}

string decodeString(const string& encodedString, const map<string, char>& decodingMap) {
    string decodedString;
    string currentCode;
    for(char bit : encodedString) {
        currentCode += bit;
        if (decodingMap.find(currentCode) != decodingMap.end()) {
            decodedString += decodingMap.at(currentCode);
            currentCode = "";
        }
    }
    return decodedString;
}

int main() {
    map<char, string> encodingMap = {
        {'1', "11"},
        {'2', "00"},
        {'3', "01"},
        {'4', "101"},
        {'5', "1001"},
        {'6', "10000"},
        {'7', "10001"}
    };

    map<string, char> decodingMap; // Обратный словарь

    for(auto& pair : encodingMap) {
        decodingMap[pair.second] = pair.first;
    }

    string inputString;
    cout << "Enter the string: " ;
    cin >> inputString;
    string encodedString = encodeString(inputString, encodingMap);

    cout << "Encoded String: " << encodedString << endl;

    string decodedString = decodeString(encodedString, decodingMap);
    cout << "Decoded String: " << decodedString << endl;

    return 0;
}
