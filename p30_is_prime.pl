% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que determina si un 
% número entero dado es primo.
% Se incluye un programa comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% def is_prime(n):
%     if n in (2, 3):
%         return True
%     if n % 2 == 0 or n < 2:
%         return False
%     return not has_factor(n, 3)
% 
% def has_factor(n, factor):
%     if factor * factor > n:
%         return False
%     if n % factor == 0:
%         return True
%     return has_factor(n, factor + 2)
% 
% if __name__ == '__main__':
%     print(is_prime(17))
%     print(is_prime(24))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Verifica si un número entero dado es primo.
is_prime(2).
is_prime(3).
is_prime(P) :- P > 3, P mod 2 =\= 0, \+ has_factor(P, 3).

% Verifica si un número tiene factores.
has_factor(N, L) :- N mod L =:= 0.
has_factor(N, L) :- L * L < N, L2 is L + 2, has_factor(N, L2).

% Ejemplo de uso:
% ?- is_prime(17).
% true.
% ?- is_prime(24).
% false.
