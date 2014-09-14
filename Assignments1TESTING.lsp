  i i i i i i i       ooooo    o        ooooooo   ooooo   ooooo
  I I I I I I I      8     8   8           8     8     o  8    8
  I  \ `+' /  I      8         8           8     8        8    8
   \  `-+-'  /       8         8           8      ooooo   8oooo
    `-__|__-'        8         8           8           8  8
        |            8     o   8           8     o     8  8
  ------+------       ooooo    8oooooo  ooo8ooo   ooooo   8

Welcome to GNU CLISP 2.49 (2010-07-07) <http://clisp.cons.org/>

Copyright (c) Bruno Haible, Michael Stoll 1992, 1993
Copyright (c) Bruno Haible, Marcus Daniels 1994-1997
Copyright (c) Bruno Haible, Pierpaolo Bernardi, Sam Steingold 1998
Copyright (c) Bruno Haible, Sam Steingold 1999-2000
Copyright (c) Sam Steingold, Bruno Haible 2001-2010

Type :h and hit Enter for context help.

[1]> 
;; Loading file assignments1.lsp ...
** - Continuable Error
DEFUN/DEFMACRO(NTH): #<PACKAGE COMMON-LISP> is locked
If you continue (by typing 'continue'): Ignore the lock and proceed
The following restarts are also available:
SKIP           :R1      skip (DEFUN NTH # ...)
RETRY          :R2      retry (DEFUN NTH # ...)
STOP           :R3      stop loading file /Users/matthewmcguire/Documents/MSUD/Fall_14/CS_3210/LispClass/Lisp/assignments1.lsp
ABORT          :R4      Abort main loop
Break 1 [2]> 
WARNING: DEFUN/DEFMACRO: redefining function NTH in
         /Users/matthewmcguire/Documents/MSUD/Fall_14/CS_3210/LispClass/Lisp/assignments1.lsp,
         was defined in C
;; Loaded file assignments1.lsp
T
[3]> 
(A B D E)
[4]> 
(M N O P Q)
[5]> 
[6]> 
(D E F G)
[7]> 
(L M N O Q R)
[8]> 
36
[9]> 
27
[10]> 
0
[11]> 
(A NIL C NIL E NIL)
[12]> 
*** - READ: input stream #<INPUT CONCATENATED-STREAM> ends within an object
The following restarts are available:
ABORT          :R1      Abort main loop
Break 1 [13]> 
[14]> 
*** - READ: input stream #<INPUT CONCATENATED-STREAM> ends within an object
The following restarts are available:
ABORT          :R1      Abort main loop
Break 1 [15]> 
(Q Y NIL (T V) NIL)
Break 1 [15]> 
(NIL NIL NIL Z)
Break 1 [15]> 
(A C D E X (A C) R L)
Break 1 [15]> 
(Z X (E D) Y (D E))
Break 1 [15]> 
NIL
Break 1 [15]> 
*** - EVAL: undefined function LASEELEMENT
The following restarts are available:
USE-VALUE      :R1      Input a value to be used instead of (FDEFINITION 'LASEELEMENT).
RETRY          :R2      Retry
STORE-VALUE    :R3      Input a new value for (FDEFINITION 'LASEELEMENT).
ABORT          :R4      Abort debug loop
ABORT          :R5      Abort main loop
Break 2 [16]> 
D
Break 2 [16]> 
Z
Break 2 [16]> 
NIL
Break 2 [16]> 
(A B C D E)
Break 2 [16]> 
((X Y) Z A B C)
Break 2 [16]> 
(A (B C) C D)
Break 2 [16]> 
*** - READ: input stream #<INPUT CONCATENATED-STREAM> ends within an object
The following restarts are available:
ABORT          :R1      Abort debug loop
ABORT          :R2      Abort debug loop
ABORT          :R3      Abort main loop
Break 3 [17]> 
(SUE DAVE JOE PAT)
Break 3 [17]> 
(A 1 X YES)
Break 3 [17]> 
Break 2 [16]> 
Break 1 [15]> 
[18]> 
Bye.
