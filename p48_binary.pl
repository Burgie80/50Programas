% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que construye un árbol binario
% de búsqueda a partir de una lista de enteros.
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% class TreeNode:
%     def __init__(self, value, left=None, right=None):
%         self.value = value
%         self.left = left
%         self.right = right
% 
%     def __repr__(self):
%         return f"t({self.value}, {'nil' if not self.left else self.left}, {'nil' if not self.right else self.right})"
% 
% def add(value, node):
%     if node is None:
%         return TreeNode(value)
%     elif value < node.value:
%         return TreeNode(node.value, add(value, node.left), node.right)
%     else:
%         return TreeNode(node.value, node.left, add(value, node.right))
% 
% def construct(values):
%     tree = None
%     for value in reversed(values):
%         tree = add(value, tree)
%     return tree
% 
% if __name__ == '__main__':
%     values = [3, 2, 5, 7, 1]
%     tree = construct(values)
%     print(tree)
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Construye un árbol binario de búsqueda a partir de una lista de enteros.
% Un árbol binario de búsqueda es un árbol en el cual, para cada nodo, todos los elementos en el subárbol izquierdo son menores y en el subárbol derecho son mayores.
construct([], nil).
construct([X|Xs], T) :- construct(Xs, T1), add(X, T1, T).
% Añade un nodo a un árbol binario de búsqueda.
add(X, nil, t(X, nil, nil)).
add(X, t(Root, L, R), t(Root, NL, R)) :- X < Root, add(X, L, NL).
add(X, t(Root, L, R), t(Root, L, NR)) :- X >= Root, add(X, R, NR).

% Función main para ejecutar el programa con ejemplos de uso
main :-
        print("Ejecutando programa 48..."),nl,
        print("Ejecutando: construct([3, 2, 5, 7, 1], T)."),nl,
        construct([3, 2, 5, 7, 1], T),
        format("Resultado: ~w~n", [T]).

% Ejemplo de uso:
% ?- construct([3, 2, 5, 7, 1], T).
% T = t(1, nil, t(7, t(5, t(2, nil, t(3, nil, nil)), nil), nil)).
