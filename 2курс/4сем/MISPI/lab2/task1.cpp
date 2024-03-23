#include <iostream>
#include <vector>
using namespace std;

class Node { 
    public:
        int sym; // �࠭���� ᨬ����
        float pro; // ����⭮��� ᨬ����
        int arr[7]; // ��� ᨬ����
        int top; // ������ ���孥�� ����� ���ᨢ� ���� ᨬ����
};

void shannon(int l, int h, vector<Node>& p) // �����㥬 ��ப� �� l �� h �����
{
	// 1. �㬬� ����⭮�⥩ ᨬ���� �� l �� k �����⥫쭮, 2. ����⭮��� ᨬ���� h, 3. ࠧ��� ����� pack1 � pack2, 4. �࠭���� ��諮� ࠧ����
	float pack1 = 0, pack2 = 0, diff1 = 0, diff2 = 0;
	// ���稪�
	int i, d, k, j;
	if ((l + 1) == h || l == h || l > h) { // �᫨ ��⠫��� �� ����� ������ ����� � ��ப�
		if (l == h || l > h) // �᫨ ��⠫��� ���� ����⮢ � ��ப�
			return;
		p[h].arr[++(p[h].top)] = 0; // ��⠫�� ���� �����
		p[l].arr[++(p[l].top)] = 1; // ��⠫��� ���� ����⮢
		return;
	}
	else {
		for (i = l; i <= h - 1; i++) pack1 = pack1 + p[i].pro; // ��⠥� �㬬� ����⭮�⥩ ᫥�� � �ࠢ�.
		pack2 = pack2 + p[h].pro;
		diff1 = pack1 - pack2; // ��室�� ࠧ���� � �த������ ࠧ������ �� ��㯯� � �������� �㬬��� ����⭮�⥩.
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

		// �����ᨢ�� ��뢠�� shannon ��� ����� � �ࠢ�� ��� ��ப� ��᫥ ࠧ�������.
		shannon(l, k, p);
		shannon(k + 1, h, p);
	}
}

void sortByProbability(int n, vector<Node>& p) // ���஢�� �� ����⭮���
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

void display(int n, const vector<Node> p) // �뢮� 
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

	n = 7; // ���-�� ᨬ�����

	for (i = 0; i < n; i++) { // ���������� ᨬ������ ����� Node
        p.emplace_back();
		ch = i+1;
		p[i].sym += ch;
	}

	float x[] = { 0.3, 0.2, 0.2, 0.1, 0.1, 0.05, 0.05 };

	for (i = 0; i < n; i++) { // �஢�ઠ, �� ������ ��㯯� ����⭮�� ����� 1
		p[i].pro = x[i];
		total = total + p[i].pro;

		if (total > 1) {
			cout << "Invalid. Enter new values";
			total = total - p[i].pro;
			i--;
		}
	}

	p[i].pro = 1 - total;

	sortByProbability(n, p); // ���஢�� ����⭮��ﬨ

	for (i = 0; i < n; i++) p[i].top = -1;

	shannon(0, n - 1, p); // ����஢���� 襭��� 䮭�

	display(n, p); // �뢮�
	return 0;
}
