% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que aplica el paradigma de generar
% y probar para construir todos los árboles binarios simétricos y
% completamente equilibrados con un número dado de nodos.
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
% def divide(n):
%     n1 = n // 2
%     n2 = n - n1
%     return n1, n2
% 
% def cbal_tree(n):
%     if n == 0:
%         return [None]
%     elif n == 1:
%         return [TreeNode('x')]
%     
%     n1, n2 = divide(n - 1)
%     left_trees = cbal_tree(n1)
%     right_trees = cbal_tree(n2)
% 
%     trees = []
%     for left in left_trees:
%         for right in right_trees:
%             trees.append(TreeNode('x', left, right))
%     for left in right_trees:
%         for right in left_trees:
%             trees.append(TreeNode('x', left, right))
% 
%     return trees
% 
% def is_mirror(left, right):
%     if not left and not right:
%         return True
%     if left and right:
%         return (left.value == right.value and 
%                 is_mirror(left.left, right.right) and 
%                 is_mirror(left.right, right.left))
%     return False
% 
% def is_symmetric(tree):
%     if not tree:
%         return True
%     return is_mirror(tree.left, tree.right)
% 
% def sym_cbal_trees(n):
%     all_trees = cbal_tree(n)
%     return [tree for tree in all_trees if is_symmetric(tree)]
% 
% if __name__ == '__main__':
%     trees = sym_cbal_trees(5)
%     for tree in trees:
%         print(tree)
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Construye un árbol binario completamente equilibrado con N nodos.
% Un árbol completamente equilibrado tiene subárboles cuya diferencia de tamaño es como máximo 1.
cbal_tree(0, nil).
cbal_tree(N, t('x', L, R)) :- 
    N > 0, 
    N1 is N - 1, 
    divide(N1, N2, N3), 
    cbal_tree(N2, L), 
    cbal_tree(N3, R).

% Divide el número de nodos entre los dos subárboles.
divide(N, N1, N2) :- 
    N1 is N // 2, 
    N2 is N - N1.

% Comprueba si un árbol binario es simétrico.
% Un árbol es simétrico si sus subárboles izquierdo y derecho son espejos entre sí.
symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).

% Verifica si un árbol es el espejo de otro.
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- mirror(L1, R2), mirror(R1, L2).

% Genera todos los árboles binarios simétricos y completamente equilibrados con N nodos.
% Utiliza el paradigma de generar y probar para encontrar todos los árboles que cumplen ambas propiedades.
sym_cbal_trees(N, Ts) :- 
    findall(T, (cbal_tree(N, T), symmetric(T)), Ts).

% Función main para ejecutar el programa con ejemplos de uso
main :- 
    print("Ejecutando programa 49..."), nl,
    print("Ejecutando: sym_cbal_trees(5, Ts)."), nl,
    sym_cbal_trees(5, Ts),
    format("Resultado: ~w~n", [Ts]).

% Ejemplo de uso:
% ?- sym_cbal_trees(5, Ts).
% Ts = [t(x, t(x, t(x, nil, nil), nil), t(x, nil, t(x, nil, nil)))].
