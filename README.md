# Compilation

Summary:

Left To Do:
 - lowercase!
 - handle failures in halili tests
 - handle the following case: (test-string \<sexpr> "##5 / 2") ==> ((match 5/2) (remaining ""))
   supposed to be: ((match (/ 5 2)) (remaining ""))
 - handle the big problem with InfixArrayGet and InfixFuncall, the first in order in the BasicExpression will be parsed, but the other will not.
 - Add: InfixNeg
 - Add InfixSexprEscape
 - StringMetaChar is supposed to return \t (when input is t) but it returns t..

Updates:
Maayan 21/11 - 22/11-
 - added comments and whitespaces
 - fixed InfixArrayGet (later it was broken by InfixFuncall)
 - fixed many things

Maayan 21/11 - 
	Problem with InfixArrayGet, InfixFuncall, etc..
	The problem is that when we execute (test-string \<InfixExpression> "A[1]")
	the result is that A is matched using  \<InfixSymbol> but the rest of the expression can't be matched, we should have gone to \<InfixArrayGet> first, but we didn't becuase \<InfixSymbol>
	was first.
	On the other hand if we switch their order, (test-string <InfixArrayGet> "A[1]") will enter an infinite loop, becuase it will constantly search for infixExpression, and then enter INfixArrayGet, 		and then InfixExpression and there will never be an end to it..

Maayan 20/11-
  - Added the comments tokens from Mayer's uploaded file.
  - Wrote the definitions for almost all the infix terminals.
  - Changed \<Symbol> to return a string.
  
Maayan 19/11 - 
- Wrote a file including tests to all terminals.
- Tested and corrected (including packing).

Problems:
- In Symbol, if i attempt to make sure the returned value is a symbol then the following scenario occurs:
(test-string \<Symbol> "1")
==>  \x31
Should we return a string then?
- Problem when testing vector:
(test-string <sexpr> "#(#\\Lambda1abc)")
((match #(#\λ 1 (#\a #\b #\c))) (remaining ""))
there is some type symbol, char or string that causes the returned value of abc to be (#\a #\b #\c), something isn't packed properly..

