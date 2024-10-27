% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que construye un árbol binario
% equilibrado en altura con una altura dada.
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% class Node:
%     def __init__(self, value='x', left=None, right=None):
%         self.value = value
%         self.left = left
%         self.right = right
% 
%     def __repr__(self):
%         return f"t({self.value}, {'nil' if not self.left else self.left}, {'nil' if not self.right else self.right})"
% 
% def hbal_tree(height):
%     if height == 0:
%         return None
%     elif height > 0:
%         h1 = height - 1
%         h2 = h1 - 1
%         left_subtree = hbal_tree(h1)
%         right_subtree = hbal_tree(h2)
%         return Node('x', left_subtree, right_subtree)
% 
% if __name__ == '__main__':
%     height = 3
%     tree = hbal_tree(height)
%     print(tree)
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Construye un árbol binario equilibrado en altura con una altura dada.
% Un árbol equilibrado en altura tiene subárboles cuya diferencia de altura es como máximo 1.
hbal_tree(0, nil).
hbal_tree(H, t('x', L, R)) :- H > 0, H1 is H - 1, H2 is H1 - 1, hbal_tree(H1, L), hbal_tree(H2, R).

% Función main para ejecutar el programa con ejemplos de uso
main :-
        print("Ejecutando programa 50..."),nl,
        print("Ejecutando: hbal_tree(3, T)."),nl,
        findall(T, hbal_tree(3, T), Ts),
        format("Resultado: ~w~n", [Ts]).

% Ejemplo de uso:
% ?- hbal_tree(3, T).
% T = t(x, t(x, t(x, nil, nil), t(x, nil, nil)), t(x, t(x, nil, nil), nil)) ;
% T = t(x, t(x, t(x, nil, nil), t(x, nil, nil)), t(x, nil, t(x, nil, nil))) ;
% T = t(x, t(x, t(x, nil, nil), nil), t(x, t(x, nil, nil), nil)) ;
% T = t(x, t(x, nil, t(x, nil, nil)), t(x, t(x, nil, nil), nil)) ;
% false.
