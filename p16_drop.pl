% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que elimina cada n-ésimo
% elemento de una lista.
% Se incluye un código comentado de Python.
% ===============================================

% ---------- Código en Python (Comentado) --------------
% def drop(lst, n):
%     return [x for i, x in enumerate(lst, 1) if i % n != 0]
% 
% if __name__ == '__main__':
%     print(drop(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'k'], 3))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Elimina cada n-ésimo elemento de una lista.
% Utiliza un contador para determinar cuándo eliminar un elemento.
drop(L, N, R) :- drop(L, N, N, R).

% Caso base: cuando la lista está vacía, el resultado es vacío.
drop([], _, _, []).

% Si el contador llega a 1, omite el primer elemento y reinicia el contador.
drop([_|T], 1, N, R) :- drop(T, N, N, R).

% Caso recursivo: disminuye el contador y conserva el elemento.
drop([H|T], K, N, [H|R]) :- K > 1, K1 is K - 1, drop(T, K1, N, R).

% Función main para ejecutar el programa con ejemplos de uso
main :-
    print("Ejecutando programa 16..."),nl,
    print("Ejecutando: drop([a,b,c,d,e,f,g,h,i,k], 3, R)."),nl,
    drop([a,b,c,d,e,f,g,h,i,k], 3, R),
    format("Resultado: ~s~n", [R]).

% Ejemplo de uso:
% ?- drop([a,b,c,d,e,f,g,h,i,k], 3, R).
% R = [a,b,d,e,g,h,k]
