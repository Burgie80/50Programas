% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que verifica si un término dado
% representa un árbol binario.
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% class TreeNode:
%     def __init__(self, value, left=None, right=None):
%         self.value = value
%         self.left = left
%         self.right = right
% 
% def is_tree(node):
%     if node is None:
%         return True
%     if isinstance(node, TreeNode):
%         return is_tree(node.left) and is_tree(node.right)
%     return False
% 
% if __name__ == '__main__':
%     tree1 = TreeNode('a', TreeNode('b'), TreeNode('c', None, TreeNode('d')))
%     print(is_tree(tree1))
% 
%     tree2 = TreeNode('a', None, TreeNode('b'))
%     print(is_tree(tree2))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Verifica si un término dado representa un árbol binario.
% Un árbol binario está compuesto por un nodo raíz y dos subárboles.
istree(nil).
istree(t(_, L, R)) :- istree(L), istree(R).

% Función main para ejecutar el programa con ejemplos de uso
main :-
        print("Ejecutando programa 45..."),nl,
        print("Ejecutando: istree(t(a, t(b, nil, nil), t(c, nil, t(d, nil, nil))))."),nl,
        (istree(t(a, t(b, nil, nil), t(c, nil, t(d, nil, nil)))) -> Resultado = "true"; Resultado = "false"),
        format("Resultado: ~s~n", [Resultado]).

% Ejemplo de uso:
% ?- istree(t(a, t(b, nil, nil), t(c, nil, t(d, nil, nil)))).
% true.
% ?- istree(t(a, nil, t(b, nil))).
% false.
