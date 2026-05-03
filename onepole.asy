* schematico di un amplificatore operazionale ideale

.subckt ideal p m out params: Rin=1e9, Rout=1, A=1e9
Rin p m {Rin}   				; input resistance
Eout out1 0 value={A*v(p,m)}	; open-loop voltage gain
Rout out1 out {Rout}            ; output resistance
.ends ideal
