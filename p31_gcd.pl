% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que determina el máximo
% común divisor de dos números positivos usando el
% algoritmo de Euclides.
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% def gcd(a, b):
%     if b == 0:
%         return abs(a)
%     return gcd(b, a % b)
% 
% if __name__ == '__main__':
%     print(gcd(48, 18))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% Función main para ejecutar el programa con ejemplos de uso
main :-
	print("Ejecutando programa 31..."),nl,
	print("Ejecutando: gcd(48, 18, G)."),nl,
	gcd(48, 18, G),
	format("Resultado: ~d~n", [G]).

% Ejemplo de uso:
% ?- gcd(48, 18, G).
% G = 6.
