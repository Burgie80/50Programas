% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que calcula la función
% totiente de Euler phi(m) de manera mejorada usando
% factores primos.
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% from math import isqrt
% 
% def pack(lst):
%     if not lst:
%         return []
%     grouped = []
%     current_group = [lst[0]]
%     for elem in lst[1:]:
%         if elem == current_group[-1]:
%             current_group.append(elem)
%         else:
%             grouped.append(current_group)
%             current_group = [elem]
%     grouped.append(current_group)
%     return grouped
% 
% def encode(lst):
%     packed_list = pack(lst)
%     return [(len(group), group[0]) for group in packed_list]
% 
% def prime_factors(n):
%     factors = []
%     factor = 2
%     while factor * factor <= n:
%         while (n % factor) == 0:
%             factors.append(factor)
%             n //= factor
%         factor = next_factor(factor)
%     if n > 1:
%         factors.append(n)
%     return factors
% 
% def next_factor(f):
%     if f == 2:
%         return 3
%     return f + 2
% 
% def prime_factors_mult(n):
%     factors = prime_factors(n)
%     return encode(factors)
% 
% def totient_improved(n):
%     prime_mult = prime_factors_mult(n)
%     result = 1
%     for p, m in prime_mult:
%         result *= (p - 1) * (p ** (m - 1))
%     return result
% 
% if __name__ == '__main__':
%     print(totient_improved(56))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Agrupa duplicados consecutivos de una lista en sublistas.
% Caso base: una lista vacía se agrupa como una lista vacía.
pack([], []).
% Caso recursivo: transfiere todos los elementos consecutivos iguales a una sublista.
pack([X|Xs], [[X|Ys]|Zs]) :- transfer(X, Xs, Ys, Rest), pack(Rest, Zs).

% Transfiere los elementos duplicados consecutivos a una sublista.
transfer(X, [], [], []).
% Si el siguiente elemento es diferente, termina la transferencia.
transfer(X, [Y|Ys], [], [Y|Ys]) :- X \= Y.
% Si el siguiente elemento es igual, agrégalo a la sublista.
transfer(X, [X|Xs], [X|Ys], Rest) :- transfer(X, Xs, Ys, Rest).

% Codifica una lista usando codificación Run-Length.
% Primero agrupa los duplicados y luego transforma las sublistas en parejas (N, X).
encode(L, R) :- pack(L, P), transform(P, R).

% Transforma sublistas en parejas (N, X), donde N es la cantidad de elementos.
transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- length([X|Xs], N), transform(Ys, Zs).

% Encuentra los factores primos de un número entero positivo.
prime_factors(N, L) :- N > 1, prime_factors(N, 2, L).

prime_factors(1, _, []).
prime_factors(N, F, [F|L]) :- N > 1, 0 is N mod F, N1 is N // F, prime_factors(N1, 2, L).
prime_factors(N, F, L) :- N > 1, F * F =< N, next_factor(F, F1), prime_factors(N, F1, L).
prime_factors(N, F, [N]) :- N > 1, F * F > N.

next_factor(2, 3).
next_factor(F, F1) :- F > 2, F1 is F + 2.

% Determina los factores primos con su multiplicidad.
prime_factors_mult(N, L) :- prime_factors(N, F), encode(F, L).

% Calcula la función totiente usando los factores primos con multiplicidad para mejorar la eficiencia.
% https://es.wikipedia.org/wiki/Función_φ_de_Euler
totient_improved(N, Phi) :- prime_factors_mult(N, F), totient_phi(F, Phi).

totient_phi([], 1).
totient_phi([[P, M]|T], Phi) :- totient_phi(T, Phi1), Phi is Phi1 * (P - 1) * P ** (M - 1).

% Función main para ejecutar el programa con ejemplos de uso
main :-
    print("Ejecutando programa 36..."),nl,
    print("Ejecutando: totient_improved(56, P)."),nl,
    totient_improved(56, P),
    format("Resultado: ~d~n", [P]).

% Ejemplo de uso:
% ?- totient_improved(56, Phi).
% Phi = 24.
