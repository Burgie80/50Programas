% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que elimina el k-ésimo
% elemento de una lista. El índice K debe ser mayor que 0.
% Se incluye un código comentado de Python.
% ===============================================

% ---------- Código en Python (Comentado) --------------
% def remove_at(lst, k):
%     return lst[:k-1] + lst[k:], lst[k-1]
% 
% if __name__ == '__main__':
%     print(remove_at(['a', 'b', 'c', 'd'], 2))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Elimina el k-ésimo elemento de una lista.
% El índice K debe ser mayor que 0.
remove_at(X, [X|T], 1, T).
remove_at(X, [H|T], K, [H|R]) :- K > 1, K1 is K - 1, remove_at(X, T, K1, R).

main :-
    print("Ejecutando programa 20..."),nl,
    print("Ejecutando: remove_at(X, [a,b,c,d], 2, R)."),nl,
    remove_at(X, [a,b,c,d], 2, R),
    format("Resultado: ~s~n", [R]).

% Ejemplo de uso:
% ?- remove_at(X, [a,b,c,d], 2, R).
% X = b
% R = [a,c,d]
