% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que compara dos métodos
% para calcular la función totiente de Euler.
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% from math import isqrt
% 
% def gcd(x, y):
%     while y != 0:
%         x, y = y, x % y
%     return x
% 
% def coprime(x, y):
%     return gcd(x, y) == 1
% 
% def totient(m):
%     if m == 1:
%         return 1
%     return sum(1 for k in range(1, m) if coprime(m, k))
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
% def compare_totient(n):
%     phi_basic = totient(n)
%     phi_improved = totient_improved(n)
%     print(f"Phi (método básico): {phi_basic}")
%     print(f"Phi (método mejorado): {phi_improved}")
% 
% if __name__ == '__main__':
%     compare_totient(1000)
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% Dos números son coprimos si su máximo común divisor es 1.
coprime(X, Y) :- gcd(X, Y, 1).

% Calcula la función totiente de Euler, que cuenta cuántos números menores que M son coprimos con M.
% https://es.wikipedia.org/wiki/Función_φ_de_Euler
totient(1, 1).
totient(M, Phi) :- M > 1, totient_acc(M, M, 0, Phi).

totient_acc(_, 0, Acc, Acc).
totient_acc(M, K, Acc, Phi) :- 
    K > 0, 
    coprime(M, K), 
    Acc1 is Acc + 1, 
    K1 is K - 1, 
    totient_acc(M, K1, Acc1, Phi).
totient_acc(M, K, Acc, Phi) :- 
    K > 0, 
    \+ coprime(M, K), 
    K1 is K - 1, 
    totient_acc(M, K1, Acc, Phi).

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

% Compara los dos métodos para calcular la función totiente.
compare_totient(N) :- 
    totient(N, Phi1), 
    totient_improved(N, Phi2), 
    write('Phi (método básico): '), write(Phi1), nl, 
    write('Phi (método mejorado): '), write(Phi2), nl.

% Función main para ejecutar el programa con ejemplos de uso
main :-
    print("Ejecutando programa 37..."),nl,
    print("Ejecutando: compare_totient(1000)."),nl,
    (compare_totient(1000) -> Resultado = "true"; Resultado = "false"),
    format("Resultado: ~s~n", [Resultado]).

% Ejemplo de uso:
% ?- compare_totient(1000).
% Phi (método básico): 400
% Phi (método mejorado): 400
% true.
