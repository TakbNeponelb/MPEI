#include <iostream>
#include <vector>
using namespace std;

class Node { 
    public:
        int sym; // хранение символа
        float pro; // вероятность символа
        int arr[7]; // код символа
        int top; // индекс верхнего элемента массива кода символа
};

void shannon(int l, int h, vector<Node>& p) // кодируем строку от l до h элемента
{
	// 1. сумма вероятностей символа от l до k включительно, 2. вероятность символа h, 3. разница между pack1 и pack2, 4. хранение прошлой разности
	float pack1 = 0, pack2 = 0, diff1 = 0, diff2 = 0;
	// счетчики
	int i, d, k, j;
	if ((l + 1) == h || l == h || l > h) { // если осталось не больше одного элемента в строке
		if (l == h || l > h) // если осталось ноль элементов в строке
			return;
		p[h].arr[++(p[h].top)] = 0; // остался один элемент
		p[l].arr[++(p[l].top)] = 1; // Осталось ноль элементов
		return;
	}
	else {
		for (i = l; i <= h - 1; i++) pack1 = pack1 + p[i].pro; // Считаем сумму вероятностей слева и справа.
		pack2 = pack2 + p[h].pro;
		diff1 = pack1 - pack2; // Находим разницу и продолжаем разделять на группы с близкими суммами вероятностей.
		if (diff1 < 0)
			diff1 = diff1 * -1;
		j = 2;
		while (j != h - l + 1) {
			k = h - j;
			pack1 = pack2 = 0;
			for (i = l; i <= k; i++)
				pack1 = pack1 + p[i].pro;
			for (i = h; i > k; i--)
				pack2 = pack2 + p[i].pro;
			diff2 = pack1 - pack2;
			if (diff2 < 0)
				diff2 = diff2 * -1;
			if (diff2 >= diff1)
				break;
			diff1 = diff2;
			j++;
		}
		k++;
		for (i = l; i <= k; i++)
			p[i].arr[++(p[i].top)] = 1;
		for (i = k + 1; i <= h; i++)
			p[i].arr[++(p[i].top)] = 0;

		// Рекурсивно вызываем shannon для левой и правой части строки после разделения.
		shannon(l, k, p);
		shannon(k + 1, h, p);
	}
}

void sortByProbability(int n, vector<Node>& p) // сортировка по вероятностям
{
	int i, j;
	Node temp;
	for (j = 1; j <= n - 1; j++) {
		for (i = 0; i < n - 1; i++) {
			if ((p[i].pro) > (p[i + 1].pro)) {
				temp.pro = p[i].pro;
				temp.sym = p[i].sym;

				p[i].pro = p[i + 1].pro;
				p[i].sym = p[i + 1].sym;

				p[i + 1].pro = temp.pro;
				p[i + 1].sym = temp.sym;
			}
		}
	}
}

void display(int n, const vector<Node> p) // вывод 
{
	int i, j;
	cout << "Symbol\tProbability\tCode";
	for (i = n - 1; i >= 0; i--) {
		cout << "\n" << p[i].sym << "\t\t" << p[i].pro << "\t";
		for (j = 0; j <= p[i].top; j++)
			cout << p[i].arr[j];
	}
}

int main()
{
	int n, i, j;
	float total = 0;
	int ch;
    std::vector<Node> p;

	n = 7; // кол-во символов

	for (i = 0; i < n; i++) { // заполнение символами класс Node
        p.emplace_back();
		ch = i+1;
		p[i].sym += ch;
	}

	float x[] = { 0.3, 0.2, 0.2, 0.1, 0.1, 0.05, 0.05 };

	for (i = 0; i < n; i++) { // проверка, что полная группа вероятности меньше 1
		p[i].pro = x[i];
		total = total + p[i].pro;

		if (total > 1) {
			cout << "Invalid. Enter new values";
			total = total - p[i].pro;
			i--;
		}
	}

	p[i].pro = 1 - total;

	sortByProbability(n, p); // сортировка вероятностями

	for (i = 0; i < n; i++) p[i].top = -1;

	shannon(0, n - 1, p); // кодирование шеннон фоно

	display(n, p); // вывод
	return 0;
}
