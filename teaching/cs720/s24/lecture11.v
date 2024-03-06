Require Import String.

Inductive aexp : Type :=
  | ANum: nat -> aexp
  | AId: string -> aexp
  | APlus: aexp -> aexp -> aexp
  | AMinus: aexp -> aexp -> aexp
  | AMult: aexp -> aexp -> aexp.

(* x + 1 *)
Compute (APlus (AId "x") (ANum 1)).

Inductive bexp : Type :=
  | BTrue : bexp               
  | BFalse: bexp               
  | BEq: aexp -> aexp -> bexp 
  | BLt: aexp -> aexp -> bexp  
  | BNot: bexp -> bexp         
  | BAnd: bexp -> bexp -> bexp.
  
  Inductive com : Type :=
    | CSkip
    | CAsgn (x : string) (a : aexp)
    | CSeq (c1 c2 : com)
    | CIf (b : bexp) (c1 c2 : com)
    | CWhile (b : bexp) (c : com).

Definition a1 := APlus (AId "x") (ANum 1).

(* Z := X; *)
Definition c1 := CAsgn "z" (AId "x").
(* A := X + 1 *)
Definition c2 := CAsgn "a" a1.

Definition state := string -> nat.

Definition empty : state := fun x => 0.

Definition put (k:string) (v:nat) (st:state) : state :=
  fun x =>
    if String.eqb k x then v
    else st x
  .
Local Open Scope string_scope.

Definition st1 := put "z" 3 (put "x" 1 empty).
Compute st1 "x".
Compute st1 "a".
Compute st1 "b".
Compute st1 "z".

  Fixpoint aeval (st: state) (a: aexp) : nat :=
    match a with
    | ANum n => n
    | AId x => st x
    | APlus  a1 a2 => (aeval st a1) + (aeval st a2)
    | AMinus a1 a2 => (aeval st a1) - (aeval st a2)
    | AMult  a1 a2 => (aeval st a1) * (aeval st a2)
    end.

Compute a1.
Goal aeval empty a1 = 1.
Proof. reflexivity. Qed.

Goal  aeval st1 a1 = 2.
Proof.  reflexivity. Qed.

Inductive aevalR (st:state): aexp -> nat -> Prop :=
| E_ANum : forall n,
  aevalR st (ANum n) n
| E_AId (x : string) :
  aevalR st (AId x) (st x)
| E_APlus (e1 e2 : aexp) (n1 n2 : nat) :
    aevalR st e1 n1 ->
    aevalR st e2 n2 ->
    aevalR st (APlus e1 e2) (n1 + n2)
| E_AMinus (e1 e2 : aexp) (n1 n2 : nat) :
    aevalR st e1 n1 ->
    aevalR st e2 n2 ->
    aevalR st (AMinus e1 e2) (n1 - n2)
| E_AMult (e1 e2 : aexp) (n1 n2 : nat) :
    aevalR st e1 n1 ->
    aevalR st e2 n2 ->
    aevalR st (AMult e1 e2) (n1 * n2).
Lemma E_APlus_eq :
  forall st (e1 e2 : aexp) (n1 n2 n3: nat),
    aevalR st e1 n1 ->
    aevalR st e2 n2 ->
    n3 = n1 + n2 ->
    aevalR st (APlus e1 e2) n3.
Proof.
  intros.
  subst.
  constructor.
  all: assumption.
Qed.

Lemma E_AId_eq:
  forall st x n,
  n = st x ->
  aevalR st (AId x) n.
Proof.
  intros.
  subst.
  constructor.
Qed.

Goal  aevalR st1 a1 2.
Proof.
  unfold a1.
  apply E_APlus_eq with (n1:=1) (n2:=1).
  + apply E_AId_eq.
    reflexivity.
  + constructor.
  + reflexivity.
Qed.

Lemma aeval_iff_aevalR_1 : forall st a n,
  aevalR st a n -> aeval st a = n.
Proof.
  intros.
  induction H.
  all: simpl.
  - reflexivity.
  - reflexivity.
  - rewrite IHaevalR1.
    rewrite IHaevalR2.
    reflexivity.
  - rewrite IHaevalR1.
    rewrite IHaevalR2.
    reflexivity.
  - rewrite IHaevalR1.
    rewrite IHaevalR2.
    reflexivity.
Qed.

Lemma aeval_iff_aevalR_2 : forall st a n,
  aeval st a = n -> aevalR st a n.
Proof.
  induction a.
  all: intros n_out H.
  all: simpl in H.
  all: subst.
  - constructor.
  - constructor.
  - constructor.
    + apply IHa1. reflexivity.
    + apply IHa2. reflexivity.
  - constructor.
    + apply IHa1. reflexivity.
    + apply IHa2. reflexivity.
  - constructor.
    + apply IHa1. reflexivity.
    + apply IHa2. reflexivity.
Qed. 

Lemma aeval_iff_aevalR : forall st a n,
  aevalR st a n <-> aeval st a = n.
Proof.
  intros.
  split.
  - apply aeval_iff_aevalR_1.
  - apply aeval_iff_aevalR_2.
Qed.

Fixpoint beval (st: state) (e: bexp) : bool :=
  match e with
  | BTrue => true
  | BFalse => false              
  | BEq a1 a2 =>
    let n1 := aeval st a1 in
    let n2 := aeval st a2 in
    Nat.eqb n1 n2 
  | BLt a1 a2 =>
    let n1 := aeval st a1 in
    let n2 := aeval st a2 in
    Nat.ltb n1 n2
  | BNot e =>
    let b := beval st e in
    if b then false else true
  | BAnd e1 e2 =>
    let b1 := beval st e1 in
    let b2 := beval st e2 in
    andb b1 b2
  end.

Inductive bevalR : state -> bexp -> bool -> Prop :=
| bevalR_True:
  forall st,
  bevalR st BTrue true
| bevalR_False:
  forall st,
  bevalR st BFalse false
| bevalR_Eq_true:
  forall st n a1 a2,
  aevalR st a1 n ->
  aevalR st a2 n ->
  bevalR st (BEq a1 a2) true
| bevalR_Eq_false:
  forall st n1 n2 a1 a2,
  aevalR st a1 n1 ->
  aevalR st a2 n2 ->
  n1 <> n2 ->
  bevalR st (BEq a1 a2) false.


Fail Fixpoint ceval (st: state) (c: com) : state :=
  match c with
  | CSkip => st
  | CAsgn x a =>
    let n := aeval st a in
    put x n st
  | CSeq c1 c2 =>
    let st2 := ceval st c1 in
    let st3 := ceval st2 c2 in
    st3
  | CIf e then_c else_c =>
    let b := beval st e in
    if b then
      ceval st then_c
    else
      ceval st else_c

  | CWhile e c =>
    let b := beval st e in
    if b then 
      ceval st (CSeq c (CWhile e c))
    else
      st
end.






    
    
    
    
    