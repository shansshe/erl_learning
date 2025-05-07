-module(rna_transcription).
-export([to_rna/1]).

to_rna(Strand) -> 
    convert_loop(Strand,[]).

convert_loop([], Acc) ->
    % reverse the list
    lists:reverse(Acc);
convert_loop([H|T], Acc) ->
    convert_loop(T,[char_convert(H) | Acc]).
    
char_convert(Char) ->
    case Char of
        $G -> $C;
        $C -> $G;
        $T -> $A;
        $A -> $U;
        _ -> Char
    end.

