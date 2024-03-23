class NodeTree:

    def __init__(self, left=None, right=None):
        self.left = left
        self.right = right

    def children(self):
        return self.left, self.right


def huffman_code_tree(node, bin_string=''):
    if type(node) is str:
        return {node: bin_string}
    l, r = node.children()
    d = dict()
    d.update(huffman_code_tree(l, bin_string + '0'))
    d.update(huffman_code_tree(r, bin_string + '1'))
    return d


def get_nodes(nods):
    while len(nods) > 1:
        key1, v1 = nods.pop()
        key2, v2 = nods.pop()
        nods.append([NodeTree(key1, key2), v1 + v2])
        nods = sorted(nods, key=lambda x: x[1], reverse=True)

    return nods


data = {
    "1": 0.3,
    "2": 0.2,
    "3": 0.2,
    "4": 0.1,
    "5": 0.1,
    "6": 0.05,
    "7": 0.05,
}

nodes = get_nodes([[i, j] for i, j in data.items()])
huffmanCode = huffman_code_tree(nodes[0][0])


def encoding(string):
    return "".join(huffmanCode[i] for i in string)


def decoding(string):
    answer = ''
    string = list(string)
    while len(string) > 0:
        now_str = string.pop(0)
        while now_str not in huffmanCode.values():
            now_str += string.pop(0)
        answer += list(huffmanCode.keys())[list(huffmanCode.values()).index(now_str)]

    return answer

s = input("Введите строку из цифр от 1-7 - ")
print("Закодировання версия -", encoding(s))
print("Раскодированная закодированная версия -", decoding(encoding(s)))
