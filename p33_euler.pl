% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que calcula la función
% totiente de Euler phi(m).
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% def gcd(a, b):
%     if b == 0:
%         return abs(a)
%     return gcd(b, a % b)
%     
% def coprime(x, y):
%     return gcd(x, y) == 1
% 
% def totient(m):
%     if m == 1:
%         return 1
%     count = 0
%     for k in range(1, m):
%         if coprime(m, k):
%             count += 1
%     return count
% 
% if __name__ == '__main__':
%     print(totient(10))
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

% Función main para ejecutar el programa con ejemplos de uso
main :-
        print("Ejecutando programa 33..."),nl,
        print("Ejecutando: totient(10, P)."),nl,
        totient(10, P),
        format("Resultado: ~d~n", [P]).


% Ejemplo de uso:
% ?- totient(10, Phi).
% Phi = 4.
