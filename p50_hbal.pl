% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que construye un árbol binario
% equilibrado en altura con una altura dada.
% ===============================================

% ------------ Código en Prolog ------------------------
% Construye un árbol binario equilibrado en altura con una altura dada.
% Un árbol equilibrado en altura tiene subárboles cuya diferencia de altura es como máximo 1.
hbal_tree(0, nil).
hbal_tree(H, t('x', L, R)) :- H > 0, H1 is H - 1, H2 is H1 - 1, hbal_tree(H1, L), hbal_tree(H2, R).

% Ejemplo de uso:
% ?- hbal_tree(3, T).
% T = t(x, t(x, t(x, nil, nil), t(x, nil, nil)), t(x, t(x, nil, nil), nil)) ;
% T = t(x, t(x, t(x, nil, nil), t(x, nil, nil)), t(x, nil, t(x, nil, nil))) ;
% T = t(x, t(x, t(x, nil, nil), nil), t(x, t(x, nil, nil), nil)) ;
% T = t(x, t(x, nil, t(x, nil, nil)), t(x, t(x, nil, nil), nil)) ;
% false.
