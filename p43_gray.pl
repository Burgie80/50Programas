% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que genera el código Gray de N bits.
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% def gray(n):
%     if n == 1:
%         return ['0', '1']
%     else:
%         prev_gray = gray(n - 1)
%         c0 = ['0' + code for code in prev_gray]
%         c1 = ['1' + code for code in reversed(prev_gray)]
%         return c0 + c1
% 
% if __name__ == '__main__':
%     print(gray(3))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Genera el código Gray de N bits.
% https://es.wikipedia.org/wiki/Código_Gray
% La secuencia de código Gray es una secuencia binaria en la que dos valores consecutivos difieren en solo un bit.
gray(1, ['0', '1']).
gray(N, C) :- N > 1, N1 is N - 1, gray(N1, C1), maplist(atom_concat('0'), C1, C0), reverse(C1, C1R), maplist(atom_concat('1'), C1R, C1G), append(C0, C1G, C).

% Función main para ejecutar el programa con ejemplos de uso
main :-
        print("Ejecutando programa 43..."),nl,
        print("Ejecutando: gray(3, C)."),nl,
        gray(3, C),
        format("Resultado: ~w~n", [C]).

% Ejemplo de uso:
% ?- gray(3, C).
% C = ['000', '001', '011', '010', '110', '111', '101', '100'].
