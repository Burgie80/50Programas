% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que duplica los elementos
% de una lista.
% Se incluye un código comentado de Python.
% ===============================================

% ---------- Código en Python (Comentado) --------------
% def dupli(lst):
%     return [x for x in lst for _ in range(2)]
% 
% if __name__ == '__main__':
%     print(dupli(['a', 'b', 'c', 'd', 'a']))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Duplica los elementos de una lista.
% Caso base: la lista vacía se mantiene vacía.
dupli([], []).

% Caso recursivo: duplica el primer elemento y continúa con el resto.
dupli([H|T], [H,H|R]) :- dupli(T, R).

% Función main para ejecutar el programa con ejemplos de uso
main :-
    print("Ejecutando programa 14..."),nl,
    print("Ejecutando: dupli([a,b,c,c,d], R)."),nl,
    dupli([a,b,c,c,d], R),
    format("Resultado: ~s~n", [R]).

% Ejemplo de uso:
% ?- dupli([a,b,c,c,d], R).
% R = [a,a,b,b,c,c,c,c,d,d]
