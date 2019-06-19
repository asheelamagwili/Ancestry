% Asheela Magwili
% CSCI 315 Lab 5

% Includes the file royal.pl
:- consult(royal).

% Finds mother given a child
mother(M,C):- parent(M,C), female(M).

% Finds father given a child
father(F,C):- parent(F,C), male(F).

% Finds a spouse given wife or husband
% Symmetrical: husband H is married to wife W and wife W is married to husband H
spouse(H,W):- married(H,W).
spouse(H,W):- married(W,H).

% Finds child/children given mother or father
child(C,P):- parent(P,C).

% Finds son given mother or father
% Male child
son(S,P):- parent(P,S), male(S).

% Finds daughter given mother or father
% Female child
daughter(D,P):- parent(P,D), female(D).

% Finds siblings given a child
% A child with the same mother and father
sibling(S,C):- mother(M,S), mother(M,C), father(F,S), father(F,C), S \=C.

% Given a child checks for their brother(s)
% Male with the same mother and father as given child
brother(B,C):- male(B), father(F,B), father(F,C), mother(M,B), mother(M,C), B \= C.

% Given a child checks for their sister(s)
% Female with the same mother and father as given child
sister(S,C):- female(S), father(F,S), father(F,C), mother(M,S), mother(M,C), S \= C.

% Finds uncle by blood: the brother of child's parents
uncle(U,C):- parent(P,C), brother(U,P).
% Finds uncle by marraige: the husbands of the parent's siblings
uncle(U,C):- parent(P,C), sister(S,P), spouse(U,S).

% Finds aunt by blood: the sister of child's parents
aunt(A,C):- parent(P,C), sister(A,P).
% Finds aunt by marraige: the wives of the parent's siblings
aunt(A,C):- parent(P,C), brother(B,P), spouse(B,A).

% Finds grandparents
% C is a child of a parent P and P is a child of a parent G
grandparent(G,C):- parent(P,C), parent(G,P).

% Finds the grandfather
% A grandparent with gender male
grandfather(G,C):- grandparent(G,C), male(G).

% Finds grandmother
% A grandparent with gender female
grandmother(G,C):- grandparent(G,C), female(G).

% Finds grandchild
% G is child of a parent P and that parent P is the child of a parent G
grandchild(C,G):- child(P,G), child(C,P).

% Finds the ancestors of X
% Recursively finds the ancestors using given descendant as children
ancestor(A,D):- parent(A,D).
ancestor(A,D):- parent(A,X), ancestor(X,D).

% Finds descendants given the ancestors
% Recursively finds the descendants using ancestors as parents
descendant(D,A):- parent(A,D).
descendant(D,A):- parent(A,X), descendant(D,X).

% Determines if X is older than Y
% Takes birthdate of persons X and Y and compares which one is less (older/less recent)
older(X,Y):- born(X,D1), born(Y,D2), D1 < D2.

% Determines if X is younger than Y
% Takes birthdate of person X and Y and compares which one is greater (greater is younger/more recent)
younger(X,Y):- born(X,D1), born(Y,D2), D1 > D2.

% Determines who was king or queen (X) when person Y was born
% Takes when person Y was born D, a start S and end E of a king/queen's reign and compares if its in between
regentWhenBorn(X,Y):- born(Y,D), reigned(X,S,E), D >= S, D =< E. 
