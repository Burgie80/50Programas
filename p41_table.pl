% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que genera una tabla de verdad
% para una expresión lógica en dos variables.
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% def and_(A, B):
%     cases = []
%     for l_val in A:
%         for r_val in B:
%             cases.append([l_val, r_val])
%     
%     evals = []
%     for A, B in cases:
%         evals.append([A, B, (A and B)])
%     
%     return evals
% 
% def table(A, B, logical_op):
%     print(f"First Value    Second Value    Third Value")
%     for case in logical_op(A, B):
%         first_spacing = 15 - (4 if case[0] else 5)
%         second_spacing = 16 - (4 if case[1] else 5)
%         
%         print(f"{case[0]}{' ' * first_spacing}{case[1]}{' ' * second_spacing}{case[2]}")
% 
% if __name__ == '__main__':
%     table([True, False], [True, False], and_)
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Define el operador and para evaluaciones lógicas.
and(A, B) :- A, B.

% Genera la tabla de verdad para una expresión lógica en dos variables (A, B).
table(A, B, Expr) :- 
    (A = true; A = false), % Genera valores posibles para A
    (B = true; B = false), % Genera valores posibles para B
    write(A), write('    '), write(B), write('    '), 
    (call(Expr) -> write(true) ; write(false)), % Evalúa la expresión lógica
    nl, 
    fail.
table(_, _, _). % Evita que Prolog siga fallando y termine.

% Función main para ejecutar el programa con ejemplos de uso
main :-
        print("Ejecutando programa 41..."),nl,
        print("Ejecutando: table(A, B, and(A, B))."),nl,
        table(A, B, and(A, B)).

% Ejemplo de uso:
% ?- table(A, B, and(A, B)).
% true true true
% true false false
% false true false
% false false false
% true.
