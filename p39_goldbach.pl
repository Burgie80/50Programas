% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que encuentra dos números
% primos que sumen un número par dado según la conjetura
% de Goldbach.
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% from math import isqrt
% 
% def is_prime(n):
%     if n in (2, 3):
%         return True
%     if n < 2 or n % 2 == 0:
%         return False
%     return not has_factor(n, 3)
% 
% def has_factor(n, factor):
%     while factor * factor <= n:
%         if n % factor == 0:
%             return True
%         factor += 2
%     return False
% 
% def prime_list(low, high):
%     return [n for n in range(low, high + 1) if is_prime(n)]
% 
% def goldbach(n):
%     if n <= 2 or n % 2 != 0:
%         return None
%     primes = prime_list(2, n)
%     for p1 in primes:
%         p2 = n - p1
%         if is_prime(p2):
%             return [p1, p2]
%     return None
% 
% if __name__ == '__main__':
%     print(goldbach(28))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Verifica si un número entero dado es primo.
is_prime(2).
is_prime(3).
is_prime(P) :- P > 3, P mod 2 =\= 0, \+ has_factor(P, 3).

% Verifica si un número tiene factores.
has_factor(N, L) :- N mod L =:= 0.
has_factor(N, L) :- L * L < N, L2 is L + 2, has_factor(N, L2).

% Genera una lista de números primos en un rango dado.
prime_list(Low, High, Primes) :- findall(P, (between(Low, High, P), is_prime(P)), Primes).

% Encuentra dos números primos que sumen un número par dado según la conjetura de Goldbach.
% https://es.wikipedia.org/wiki/Conjetura_de_Goldbach
goldbach(N, [P1, P2]) :- 
    N > 2, 
    N mod 2 =:= 0, 
    prime_list(2, N, Primes), 
    member(P1, Primes), 
    P2 is N - P1, 
    is_prime(P2).

% Función main para ejecutar el programa con ejemplos de uso
main :-
        print("Ejecutando programa 39..."),nl,
        print("Ejecutando: goldbach(28, L)."),nl,
        goldbach(28, L),
        format("Resultado: ~w~n", [L]).

% Ejemplo de uso:
% ?- goldbach(28, L).
% L = [5, 23].
