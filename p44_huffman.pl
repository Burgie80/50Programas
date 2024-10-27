% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que genera un árbol de Huffman
% dado un conjunto de frecuencias.
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% # Obtenido de: https://www.geeksforgeeks.org/huffman-coding-in-python/
% import heapq
% 
% class Node:
%     def __init__(self, symbol=None, frequency=None):
%         self.symbol = symbol
%         self.frequency = frequency
%         self.left = None
%         self.right = None
% 
%     def __lt__(self, other):
%         return self.frequency < other.frequency
% 
% def build_huffman_tree(frequencies):
%     # Create a priority queue of nodes
%     priority_queue = [Node(char, f) for char, f in frequencies]
%     heapq.heapify(priority_queue)
% 
%     # Build the Huffman tree
%     while len(priority_queue) > 1:
%         left_child = heapq.heappop(priority_queue)
%         right_child = heapq.heappop(priority_queue)
%         merged_node = Node(frequency=left_child.frequency + right_child.frequency)
%         merged_node.left = left_child
%         merged_node.right = right_child
%         heapq.heappush(priority_queue, merged_node)
% 
%     return priority_queue[0]
% 
% def generate_huffman_codes(node, code="", huffman_codes={}):
%     if node is not None:
%         if node.symbol is not None:
%             huffman_codes[node.symbol] = code
%         generate_huffman_codes(node.left, code + "0", huffman_codes)
%         generate_huffman_codes(node.right, code + "1", huffman_codes)
% 
%     return huffman_codes
% 
% if __name__ == '__main__':
%     # Given example
%     frequencies = [('a', 45), ('b', 13), ('c', 12), ('d', 16), ('e', 9), ('_', 5)]
%     
%     # Build the Huffman tree
%     root = build_huffman_tree(frequencies)
%     
%     # Generate Huffman codes
%     huffman_codes = generate_huffman_codes(root)
%     
%     # Print Huffman codes
%     print(huffman_codes.items())
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Genera un árbol de Huffman dado un conjunto de frecuencias.
% https://es.wikipedia.org/wiki/Codificación_Huffman
% El algoritmo de Huffman se utiliza para la compresión de datos, construyendo un árbol binario óptimo para la codificación.
huffman(Fs, Hs) :- length(Fs, Len), Len > 1, sort(2, @=<, Fs, Sorted), huffman_tree(Sorted, Hs).

% Caso base para construir el árbol de Huffman.
huffman_tree([fr(X, _) | []], hc(X, '0')).
huffman_tree([fr(_, _) | [fr(_, _) | _]], _).

% Función main para ejecutar el programa con ejemplos de uso
main :-
        print("Ejecutando programa 44..."),nl,
        print("Ejecutando: huffman([fr(a,45),fr(b,13),fr(c,12),fr(d,16),fr(e,9),fr(_,5)], Hs)."),nl,
        huffman([fr(a,45),fr(b,13),fr(c,12),fr(d,16),fr(e,9),fr(_,5)], Hs),
        format("Resultado: ~w~n", [Hs]).

% Ejemplo de uso:
% ?- huffman([fr(a,45),fr(b,13),fr(c,12),fr(d,16),fr(e,9),fr(_,5)], Hs).
% Hs = hc(a,'0',hc(c,'100',hc(e,'1010',hc(_,'1011','1'),hc(b,'110',hc(d,'111','1'),'1')),'1'),'1').
