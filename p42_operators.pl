% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que utiliza operadores lógicos
% para definir expresiones y generar tablas de verdad.
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% def group_values(A, B):
%     cases = []
%     for l_val in A:
%         for r_val in B:
%             cases.append([l_val, r_val])
% 
%     return cases
% 
% def and_(A, B):
%     evals = []
%     for A, B in group_values(A, B):
%         evals.append([A, B, (A and B)])
%     return evals
% 
% def or_(A, B):
%     evals = []
%     for A, B in group_values(A, B):
%         evals.append([A, B, (A or B)])
%     return evals
%     
% def nand_(A, B):
%     evals = []
%     for A, B in group_values(A, B):
%         evals.append([A, B, not(A and B)])
%     return evals
%     
% def nor_(A, B):
%     evals = []
%     for A, B in group_values(A, B):
%         evals.append([A, B, not(A or B)])
%     return evals
%     
% def xor_(A, B):
%     evals = []
%     for A, B in group_values(A, B):
%         evals.append([A, B, (A or B) and not(A and B)])
%     return evals
% 
% def impl_(A, B):
%     evals = []
%     for A, B in group_values(A, B):
%         evals.append([A, B, not(A) or B])
%     return evals
% 
% def equ_(A, B):
%     evals = []
%     for A, B in group_values(A, B):
%         evals.append([A, B, (A and B) or (not A and not B)])
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
%     print()
%     table([True, False], [True, False], xor_)
%     print()
%     table([True, False], [True, False], equ_)
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Genera la tabla de verdad para una expresión lógica en dos variables (A, B).
table(A, B, Expr) :- 
    (A = true; A = false), % Genera valores posibles para A
    (B = true; B = false), % Genera valores posibles para B
    write(A), write('    '), write(B), write('    '), 
    (call(Expr) -> write(true) ; write(false)), % Evalúa la expresión lógica
    nl, 
    fail.
table(_, _, _). % Evita que Prolog siga fallando y termine.

% Utiliza operadores lógicos para definir expresiones y generar tablas de verdad.
% Definición de los operadores básicos AND, OR, NAND, NOR, XOR, IMPLICACIÓN, EQUIVALENCIA.
and(A, B) :- A, B.
or(A, _) :- A.
or(_, B) :- B.
nand(A, B) :- \+ (A, B).
nor(A, B) :- \+ (A; B).
xor(A, B) :- A, \+ B; \+ A, B.
impl(A, B) :- \+ A; B.
equ(A, B) :- A, B; \+ A, \+ B.

% Función main para ejecutar el programa con ejemplos de uso
main :-
        print("Ejecutando programa 42..."),nl,
        print("Ejecutando: table(A, B, and(A, B))."),nl,
        table(A, B, and(A, B)),nl,

        print("Ejecutando: table(A, B, or(A, B))."),nl,
	table(A, B, or(A, B)),nl,

	print("Ejecutando: table(A, B, xor(A, B))."),nl,
	table(A, B, xor(A, B)).

% Ejemplo de uso:
% ?- table(A, B, xor(A, B)).
% true true false
% true false true
% false true true
% false false false
% true.
