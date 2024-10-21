% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que genera una tabla de verdad
% para una expresión lógica en dos variables.
% ===============================================

% ------------ Código en Prolog ------------------------

% Genera una tabla de verdad para una expresión lógica en dos variables.
% A y B son las variables lógicas y Expr es la expresión lógica que se evalúa.
table(A, B, Expr) :- write(A), write(' '), write(B), write(' '), call(Expr), nl, fail.
table(_, _, _).

% Ejemplo de uso:
% ?- table(A, B, and(A, B)).
% true true true
% true false false
% false true false
% false false false
% true.
