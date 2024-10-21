% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que encuentra los factores
% primos de un número entero positivo.
% ===============================================

% ------------ Código en Prolog ------------------------
% Encuentra los factores primos de un número entero positivo.
prime_factors(N, L) :- N > 1, prime_factors(N, 2, L).

prime_factors(1, _, []).
prime_factors(N, F, [F|L]) :- N > 1, 0 is N mod F, N1 is N // F, prime_factors(N1, F, L).
prime_factors(N, F, L) :- N > 1, F * F =< N, next_factor(F, F1), prime_factors(N, F1, L).
prime_factors(N, F, [N]) :- F * F > N, N > 1.

next_factor(2, 3).
next_factor(F, F1) :- F > 2, F1 is F + 2.

% Ejemplo de uso:
% ?- prime_factors(315, L).
% L = [3, 3, 5, 7].
