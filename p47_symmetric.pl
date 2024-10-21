% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que comprueba si un árbol binario
% es simétrico.
% ===============================================

% ------------ Código en Prolog ------------------------

% Comprueba si un árbol binario es simétrico.
% Un árbol es simétrico si sus subárboles izquierdo y derecho son espejos entre sí.
symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).
% Verifica si un árbol es el espejo de otro.
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- mirror(L1, R2), mirror(R1, L2).

% Ejemplo de uso:
% ?- symmetric(t(x, t(x, nil, t(x, nil, nil)), t(x, t(x, nil, nil), nil))).
% true.
% ?- symmetric(t(x, t(x, nil, nil), t(x, nil, t(x, nil, nil)))).
% false.
