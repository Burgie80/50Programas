% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que genera una lista de
% números primos en un rango dado.
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% import math
% 
% def is_prime(n):
%     if n < 2:
%         return False
%         
%     for i in range(2, int(math.sqrt(n)) + 1):
%         if n % i == 0:
%             return False
%     
%     return True
%     
% def prime_list(a, b):
%     primes = []
%     
%     for i in range(a, b + 1):
%         if is_prime(i):
%             primes.append(i)
%     
%     return primes
%     
% if __name__ == '__main__':
%     print(prime_list(10, 20))
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

% Función main para ejecutar el programa con ejemplos de uso
main :-
    print("Ejecutando programa 38..."),nl,
    print("Ejecutando: prime_list(10, 20, L)."),nl,
    prime_list(10, 20, L),
    format("Resultado: ~w~n", [L]).

% Ejemplo de uso:
% ?- prime_list(10, 20, Primes).
% Primes = [11, 13, 17, 19].
