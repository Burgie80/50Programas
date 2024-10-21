% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que verifica si un término dado
% representa un árbol binario.
% ===============================================

% ------------ Código en Prolog ------------------------

% Verifica si un término dado representa un árbol binario.
% Un árbol binario está compuesto por un nodo raíz y dos subárboles.
istree(nil).
istree(t(_, L, R)) :- istree(L), istree(R).

% Ejemplo de uso:
% ?- istree(t(a, t(b, nil, nil), t(c, nil, t(d, nil, nil)))).
% true.
% ?- istree(t(a, nil, t(b, nil))).
% false.% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que verifica si un término dado
% representa un árbol binario.
% ===============================================

% ------------ Código en Prolog ------------------------

% Verifica si un término dado representa un árbol binario.
% Un árbol binario está compuesto por un nodo raíz y dos subárboles.
istree(nil).
istree(t(_, L, R)) :- istree(L), istree(R).

% Ejemplo de uso:
% ?- istree(t(a, t(b, nil, nil), t(c, nil, t(d, nil, nil)))).
% true.
% ?- istree(t(a, nil, t(b, nil))).
% false.
