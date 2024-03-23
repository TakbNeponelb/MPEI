#include <stdio.h>

typedef struct Node
{
    int data;
    struct Node *next; 
}Node;

void push(Node **head, int dat)
{
    Node *temp = malloc(sizeof(Node));
    temp->data = dat;
    temp->next = *head;
    *head = temp;
}


int main(){

    Node *head = NULL;

    push(head, 5);
    push(head, 8);
    push(head, 7);
    Node* tmp = head;
    while (tmp != NULL)
    {
        printf("%d", tmp->data);
        tmp = tmp->next;
    }

    return 0;
}