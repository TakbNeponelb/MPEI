#include <stdio.h>
#include <stdlib.h>
#include <string.h>


// Структура для хранения информации о прохождении тестов
typedef struct TestResult {
    char nickname[50]; // Ник
    int score; // Набранные баллы
    struct TestResult* next; // Указатель на следующий элемент списка
} TestResult;

void processTestResults(TestResult* head) {
    TestResult* current = head;
    TestResult* previous = NULL;

    while (current != NULL) {
        if (current->score < 20) {
            // Удаляем текущий элемент из списка
            if (previous == NULL) {
                // Если текущий элемент - первый в списке
                current = head->next;
                free(head);     
                head = current;
            } else {
                // Если текущий элемент - не первый в списке
                previous->next = current->next;
                free(current);
                current = previous->next;
            }
        } else if (current->score > 100) {
            // Исправляем балл на 100
            current->score = 100;
            previous = current;
            current = current->next;
        } else {
            // Просто переходим к следующему элементу
            previous = current;
            current = current->next;
        }
    }
}

int main() {
    // Создаем тестовый список
    TestResult* head = NULL;
    TestResult* current = NULL;

    // Добавляем элементы в список
    TestResult* result1 = (TestResult*)malloc(sizeof(TestResult));
    strcpy(result1->nickname, "User1");
    result1->score = 15;
    result1->next = NULL;

    TestResult* result2 = (TestResult*)malloc(sizeof(TestResult));
    strcpy(result2->nickname, "User2");
    result2->score = 50;
    result2->next = NULL;

    TestResult* result3 = (TestResult*)malloc(sizeof(TestResult));
    strcpy(result3->nickname, "User3");
    result3->score = 120;
    result3->next = NULL;

    TestResult* result4 = (TestResult*)malloc(sizeof(TestResult));
    strcpy(result4->nickname, "User4");
    result4->score = 10;
    result4->next = NULL;

    TestResult* result5 = (TestResult*)malloc(sizeof(TestResult));
    strcpy(result5->nickname, "User5");
    result5->score = 110;
    result5->next = NULL;

    TestResult* result6 = (TestResult*)malloc(sizeof(TestResult));
    strcpy(result6->nickname, "User6");
    result6->score = 90;
    result6->next = NULL;

    TestResult* result7 = (TestResult*)malloc(sizeof(TestResult));
    strcpy(result7->nickname, "User7");
    result7->score = 5;
    result7->next = NULL;

    // Связываем элементы списка
    head = result1;
    result1->next = result2;
    result2->next = result3;
    result3->next = result4;
    result4->next = result5;
    result5->next = result6;
    result6->next = result7;

    // Выводим исходный список
    printf("First List: \n");
    current = head;
    while (current != NULL) {
        printf("Name: %s, Score: %d\n", current->nickname, current->score);
        current = current->next;
    }

    // Обрабатываем список
    processTestResults(head);

    // Выводим обработанный список
    printf("Second List: \n");
    current = head;
    while (current != NULL) {
        printf("Name: %s, Score: %d\n", current->nickname, current->score);
        current = current->next;
    }

    // Освобождаем память, выделенную для списка
    current = head;
    while (current != NULL) {
        TestResult* next = current->next;
        free(current);
        current = next;
    }

    return 0;
}