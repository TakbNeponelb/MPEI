#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char nickname[50];
    int score;
} TestResult;

void processTestResults(TestResult* results, int *size) {
    int i;
    for (i = 0; i < *size; i++) {
        if (results[i].score < 20) {
            // Удаляем данные про тестируемых с баллом ниже 20
            memmove(&results[i], &results[i + 1], (*size - i - 1) * sizeof(TestResult));
            (*size)--;
            i--;
        } else if (results[i].score > 100) {
            // Исправляем балл на 100 у тех, кто набрал более 100 баллов
            results[i].score = 100;
        }
    }
}

int main() {
    // Пример использования
    int size = 5;
    TestResult* results = malloc(size * sizeof(TestResult));

    // Заполняем массив результатами тестов
    strcpy(results[0].nickname, "User1");
    results[0].score = 15;
    strcpy(results[1].nickname, "User2");
    results[1].score = 25;
    strcpy(results[2].nickname, "User3");
    results[2].score = 110;
    strcpy(results[3].nickname, "User4");
    results[3].score = 10;
    strcpy(results[4].nickname, "User5");
    results[4].score = 120;

    // Выводим исходные результаты
    printf("First Results: \n");
    for (int i = 0; i < size; i++) {
        printf("%s: %d \n", results[i].nickname, results[i].score);
    }

    // Обрабатываем результаты
    processTestResults(results, &size);

    // Выводим обработанные результаты
    printf("Final results: \n");
    for (int i = 0; i < size; i++) {
        printf("%s: %d \n", results[i].nickname, results[i].score);
    }

    free(results);
    return 0;
}
