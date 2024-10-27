% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que determina si dos
% números positivos son coprimos.
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
% if __name__ == '__main__':
%     print(coprime(35, 64))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% Dos números son coprimos si su máximo común divisor es 1.
coprime(X, Y) :- gcd(X, Y, 1).

% Función main para ejecutar el programa con ejemplos de uso
main :-
        print("Ejecutando programa 32..."),nl,
        print("Ejecutando: coprime(35, 64)."),nl,
        (coprime(35, 64) -> Resultado1 = "true"; Resultado1 = "false"),
        format("Resultado: ~s~n", [Resultado1]),nl,

	print("Ejecutando: coprime(32, 16)."),nl,
	(coprime(32, 16) -> Resultado2 = "true"; Resultado2 = "false"),
	format("Resultado: ~s~n", [Resultado2]).

% Ejemplo de uso:
% ?- coprime(35, 64).
% true.
