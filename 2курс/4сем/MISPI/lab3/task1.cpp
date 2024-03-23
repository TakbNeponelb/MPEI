#include <iostream>
#include <queue>
#include <vector>
#include <string>
#include <map>
#include <cmath>

using namespace std;

struct Node {
    char data;
    float probability;
    Node *left;
    Node *right;

    Node(char data, float probability) : data(data), probability(probability), left(nullptr), right(nullptr) {}

    Node(Node *left, Node *right) : data('\0'), probability(left->probability + right->probability), left(left), right(right) {}
};

struct CompareNodes {
    bool operator()(const Node* lhs, const Node* rhs) const {
        return lhs->probability > rhs->probability;
    }
};

void generateCodes(Node* root, string code, map<char, string>& codes) {
    if(root->left) {
        generateCodes(root->left, code + "0", codes);
    }
    if(root->right) {
        generateCodes(root->right, code + "1", codes);
    }
    if(root->data != '\0') {
        codes[root->data] = code;
    }
}

string decodeMessage(const string& encodedMessage, Node* root) {
    string decodedMessage;
    Node* current = root;
    for(char bit : encodedMessage) {
        if (bit == '0') {
            current = current->left;
        } else if (bit == '1') {
            current = current->right;
        }

        if (current->data != '\0') {
            decodedMessage += current->data;
            current = root;
        }
    }

    return decodedMessage;
}

string encodeMessage(const string& message, const map<char, string>& codes) {
    string encodedMessage;
    for(char c : message) {
        encodedMessage += codes.at(c);
    }
    return encodedMessage;
}

int main() {
    map<char, float> probabilities = {
        {'1', 0.3},
        {'2', 0.2},
        {'3', 0.2},
        {'4', 0.1},
        {'5', 0.1},
        {'6', 0.05},
        {'7', 0.05}
    };

    priority_queue<Node*, vector<Node*>, CompareNodes> pq;

    for(auto& pair : probabilities) {
        pq.push(new Node(pair.first, pair.second));
    }

    while(pq.size() > 1) {
        Node *left = pq.top();
        pq.pop();
        Node *right = pq.top();
        pq.pop();
        Node *combined = new Node(left, right);
        pq.push(combined);
    }

    Node* root = pq.top();
    map<char, string> codes;
    generateCodes(root, "", codes);

    string message = "1234571223";
    string encodedMessage = encodeMessage(message, codes);

    cout << "Encoded Message: " << encodedMessage << endl;

    string decodedMessage = decodeMessage(encodedMessage, root);
    cout << "Decoded Message: " << decodedMessage << endl;

    return 0;
}
