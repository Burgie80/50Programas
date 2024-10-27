% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que comprueba si un árbol binario
% es simétrico.
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
%         left_repr = repr(self.left) if self.left else "nil"
%         right_repr = repr(self.right) if self.right else "nil"
%         return f"t({self.value}, {left_repr}, {right_repr})"
% 
% def mirror(tree1, tree2):
%     if not tree1 and not tree2:
%         return True
%     if tree1 and tree2:
%         return mirror(tree1.left, tree2.right) and mirror(tree1.right, tree2.left)
%     return False
% 
% def is_symmetric(tree):
%     if not tree:
%         return True
%     return mirror(tree.left, tree.right)
% 
% if __name__ == '__main__':
%     symmetric_tree = TreeNode('x', TreeNode('x', None, TreeNode('x')), TreeNode('x', TreeNode('x'), None))
%     
%     non_symmetric_tree = TreeNode('x', TreeNode('x', None, None), TreeNode('x', None, TreeNode('x', None, None)))
% 
%     print(is_symmetric(symmetric_tree))
%     print(is_symmetric(non_symmetric_tree))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Comprueba si un árbol binario es simétrico.
% Un árbol es simétrico si sus subárboles izquierdo y derecho son espejos entre sí.
symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).
% Verifica si un árbol es el espejo de otro.
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- mirror(L1, R2), mirror(R1, L2).

% Función main para ejecutar el programa con ejemplos de uso
main :-
        print("Ejecutando programa 47..."),nl,
        print("Ejecutando: symmetric(t(x, t(x, nil, t(x, nil, nil)), t(x, t(x, nil, nil), nil)))."),nl,
        (symmetric(t(x, t(x, nil, t(x, nil, nil)), t(x, t(x, nil, nil), nil))) -> Resultado1 = "true"; Resultado1 = "false"),
        format("Resultado: ~s~n", [Resultado1]),nl,

	print("Ejecutando: symmetric(t(x, t(x, nil, nil), t(x, nil, t(x, nil, nil))))."),nl,
	(symmetric(t(x, t(x, nil, nil), t(x, nil, t(x, nil, nil)))) -> Resultado2 = "true"; Resultado2 = "false"),
	format("Resultado: ~s~n", [Resultado2]).

% Ejemplo de uso:
% ?- symmetric(t(x, t(x, nil, t(x, nil, nil)), t(x, t(x, nil, nil), nil))).
% true.
% ?- symmetric(t(x, t(x, nil, nil), t(x, nil, t(x, nil, nil)))).
% false.
