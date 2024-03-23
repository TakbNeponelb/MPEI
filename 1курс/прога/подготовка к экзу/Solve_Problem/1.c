#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Структура для хранения информации о прохождении тестов
typedef struct {
    char nickname[50];
    int score;
} TestResult;

void createBinaryFile(const char* textFilename, const char* binaryFilename) {
    FILE* textFile = fopen(textFilename, "r");
    if (textFile == NULL) {
        printf("Error \n");
        return;
    }

    FILE* binaryFile = fopen(binaryFilename, "wb");
    if (binaryFile == NULL) {
        printf("Error \n");
        fclose(textFile);
        return;
    }

    char line[100];
    while (fgets(line, sizeof(line), textFile) != NULL) {
        TestResult result;
        sscanf(line, "%s %d", result.nickname, &result.score);
        fwrite(&result, sizeof(TestResult), 1, binaryFile);
    }

    fclose(textFile);
    fclose(binaryFile);
}

// Функция для обработки двоичного файла
void processBinaryFile(const char* filename) {
    FILE* file = fopen(filename, "rb+");
    if (file == NULL) {
        printf("Error\n");
        return;
    }

    TestResult result;
    while (fread(&result, sizeof(TestResult), 1, file) == 1) {
        if (result.score < 20) {
            // Удаление данных про тестируемых с баллом ниже 20
            fseek(file, -sizeof(TestResult), SEEK_CUR);
            TestResult emptyResult;
            memset(&emptyResult, 0, sizeof(TestResult));
            fwrite(&emptyResult, sizeof(TestResult), 1, file);
        } else if (result.score > 100) {
            // Исправление балла на 100 у тех, кто набрал более 100 баллов
            fseek(file, -sizeof(TestResult), SEEK_CUR);
            result.score = 100;
            fwrite(&result, sizeof(TestResult), 1, file);
        }
    }

    fclose(file);
}

int main() {
    const char* filetext = "1.txt";
    const char* filename = "test_results.bin";
    createBinaryFile(filetext, filename);
    processBinaryFile(filename);
    printf("The End! \n");
    return 0;
}