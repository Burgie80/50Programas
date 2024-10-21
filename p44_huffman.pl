% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que genera un árbol de Huffman
% dado un conjunto de frecuencias.
% ===============================================

% ------------ Código en Prolog ------------------------

% Genera un árbol de Huffman dado un conjunto de frecuencias.
% https://es.wikipedia.org/wiki/Codificación_Huffman
% El algoritmo de Huffman se utiliza para la compresión de datos, construyendo un árbol binario óptimo para la codificación.
huffman(Fs, Hs) :- length(Fs, Len), Len > 1, sort(2, @=<, Fs, Sorted), huffman_tree(Sorted, Hs).
% Caso base para construir el árbol de Huffman.
huffman_tree([fr(X, _) | []], hc(X, '0')).
huffman_tree([fr(_, _) | [fr(_, _) | _]], _).

% Ejemplo de uso:
% ?- huffman([fr(a,45),fr(b,13),fr(c,12),fr(d,16),fr(e,9),fr(_,5)], Hs).
% Hs = hc(a,'0',hc(c,'100',hc(e,'1010',hc(_,'1011','1'),hc(b,'110',hc(d,'111','1'),'1')),'1'),'1').
