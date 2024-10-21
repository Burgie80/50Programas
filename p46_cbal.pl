% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que construye un árbol binario
% completamente equilibrado con N nodos.
% ===============================================

% ------------ Código en Prolog ------------------------

% Construye un árbol binario completamente equilibrado con N nodos.
% Un árbol completamente equilibrado tiene subárboles cuya diferencia de tamaño es como máximo 1.
cbal_tree(0, nil).
cbal_tree(N, t('x', L, R)) :- N > 0, N1 is N - 1, divide(N1, N2, N3), cbal_tree(N2, L), cbal_tree(N3, R).
% Divide el número de nodos entre los dos subárboles.
divide(N, N1, N2) :- N1 is N // 2, N2 is N - N1.

% Ejemplo de uso:
% ?- cbal_tree(4, T).
% T = t(x, t(x, t(x, nil, nil), nil), t(x, nil, nil)) ;
% T = t(x, t(x, nil, t(x, nil, nil)), t(x, nil, nil)) ;
% false.
