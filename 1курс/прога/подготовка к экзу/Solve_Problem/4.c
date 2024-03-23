#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Структура для хранения информации о прохождении тестов
typedef struct {
    char name[50];  // Фамилия И.О.
    int score;      // Набранные баллы
} TestResult;

// Структура для представления элемента двусвязного линейного списка
typedef struct Node {
    TestResult data;
    struct Node* prev;
    struct Node* next;
} Node;

// Функция для создания нового элемента списка
Node* createNode(TestResult data) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->data = data;
    newNode->prev = NULL;
    newNode->next = NULL;
    return newNode;
}

// Функция для вставки нового элемента в список в порядке убывания набранных баллов
void insertNode(Node** head, TestResult data) {
    Node* newNode = createNode(data);

    // Если список пустой, новый элемент становится головой списка
    if (*head == NULL) {
        *head = newNode;
        return;
    }

    // Если новый элемент имеет большее количество баллов, чем голова списка,
    // он становится новой головой списка
    if (data.score > (*head)->data.score) {
        newNode->next = *head;
        (*head)->prev = newNode;
        *head = newNode;
        return;
    }

    Node* current = *head;

    // Находим позицию для вставки нового элемента
    while (current->next != NULL && current->next->data.score > data.score) {
        current = current->next;
    }

    // Вставляем новый элемент после текущего элемента
    newNode->next = current->next;
    newNode->prev = current;
    if (current->next != NULL) {
        current->next->prev = newNode;
    }
    current->next = newNode;
}

// Функция для чтения информации из файла и создания двусвязного линейного списка
Node* createLinkedListFromFile(const char* filename) {
    FILE* file = fopen(filename, "rb");
    if (file == NULL) {
        printf("Ошибка открытия файлаn");
        return NULL;
    }

    Node* head = NULL;
    TestResult data;

    // Читаем информацию из файла и вставляем ее в список
    while (fread(&data, sizeof(TestResult), 1, file) == 1) {
        insertNode(&head, data);
    }

    fclose(file);
    return head;
}

// Функция для вывода содержимого двусвязного линейного списка
void printLinkedList(Node* head) {
    Node* current = head;
    while (current != NULL) {
        printf("%s, %d \n", current->data.name, current->data.score);
        current = current->next;
    }
}

int main() {
    Node* head = createLinkedListFromFile("test_results.bin");
    if (head != NULL) {
        printf("Содержимое списка: \n");
        printLinkedList(head);
    }
    return 0;
}