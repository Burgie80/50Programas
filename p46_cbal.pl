% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que construye un árbol binario
% completamente equilibrado con N nodos.
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% class TreeNode:
%     def __init__(self, value='x', left=None, right=None):
%         self.value = value
%         self.left = left
%         self.right = right
% 
%     def __repr__(self):
%         if self.left is None and self.right is None:
%             return f"t({self.value}, nil, nil)"
%         left_repr = repr(self.left) if self.left else "nil"
%         right_repr = repr(self.right) if self.right else "nil"
%         return f"t({self.value}, {left_repr}, {right_repr})"
% 
% def cbal_tree(n):
%     if n == 0:
%         return None
%     elif n == 1:
%         return TreeNode()
%     else:
%         left_size, right_size = divide(n - 1)
%         return TreeNode('x', cbal_tree(left_size), cbal_tree(right_size))
% 
% def divide(n):
%     left_size = n // 2
%     right_size = n - left_size
%     return left_size, right_size
% 
% if __name__ == '__main__':
%     print(cbal_tree(4))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Construye un árbol binario completamente equilibrado con N nodos.
% Un árbol completamente equilibrado tiene subárboles cuya diferencia de tamaño es como máximo 1.
cbal_tree(0, nil).
cbal_tree(N, t('x', L, R)) :- N > 0, N1 is N - 1, divide(N1, N2, N3), cbal_tree(N2, L), cbal_tree(N3, R).
% Divide el número de nodos entre los dos subárboles.
divide(N, N1, N2) :- N1 is N // 2, N2 is N - N1.

% Función main para ejecutar el programa con ejemplos de uso
main :-
    print("Ejecutando programa 46..."), nl,
    print("Ejecutando: cbal_tree(4, T)."), nl,
    cbal_tree(4, T),
    format("Resultado: ~w~n", [T]).

% Ejemplo de uso:
% ?- cbal_tree(4, T).
% T = t(x, t(x, t(x, nil, nil), nil), t(x, nil, nil)) ;
% T = t(x, t(x, nil, t(x, nil, nil)), t(x, nil, nil)) ;
% false.
