% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que divide una lista en
% dos partes. La longitud de la primera parte está dada
% por el segundo argumento.
% Se incluye un código comentado de Python.
% ===============================================

% ---------- Código en Python (Comentado) --------------
% def split(lst, n):
%     return lst[:n], lst[n:]
% 
% if __name__ == '__main__':
%     print(split(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'k'], 3))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Divide una lista en dos partes.
% La longitud de la primera parte está dada por el segundo argumento.
split(L, 0, [], L).
split([H|T], N, [H|L1], L2) :- N > 0, N1 is N - 1, split(T, N1, L1, L2).

% Función main para ejecutar el programa con ejemplos de uso
main :-
    print("Ejecutando programa 17..."),nl,
    print("Ejecutando: split([a,b,c,d,e,f,g,h,i,k], 3, L1, L2)."),nl,
    split([a,b,c,d,e,f,g,h,i,k], 3, L1, L2),
    format("Primera mitad: ~s~n", [L1]),
    format("Segunda mitad: ~s~n", [L2]).

% Ejemplo de uso:
% ?- split([a,b,c,d,e,f,g,h,i,k], 3, L1, L2).
% L1 = [a,b,c]
% L2 = [d,e,f,g,h,i,k]
