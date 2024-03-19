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

Fixpoint optimize_0plus (a:aexp) : aexp :=
  match a with
  | AId x => AId x
  | ANum n => ANum n
  | APlus (ANum 0) e2 => optimize_0plus e2
  | APlus e1 e2 => APlus (optimize_0plus e1) (optimize_0plus e2)
  | AMinus e1 e2 => AMinus (optimize_0plus e1) (optimize_0plus e2)
  | AMult e1 e2 => AMult (optimize_0plus e1) (optimize_0plus e2)
  end.

(* A terrible optimization that only works for one expression *)
Definition opt1 (a:aexp) := ANum 0.

Lemma optimize_opt1_spec:
  forall s,
  exists e,
  aeval s e = aeval s (opt1 e).
Proof.
  intros.
  exists (ANum 0).
  reflexivity. 
Qed.

Lemma plus_neq_0:
  forall e1 e2 s,
  e1 <> ANum 0 ->
  aeval s (optimize_0plus (APlus e1 e2)) =
  aeval s (optimize_0plus e1) + aeval s (optimize_0plus e2).
Proof.
  intros.
  destruct e1.
  all: simpl.
  all: try reflexivity.
  destruct n. { contradiction. }
  reflexivity.
Qed.

Lemma plus_eq_0:
  forall e s,
  aeval s (optimize_0plus (APlus (ANum 0) e)) =
  aeval s (optimize_0plus e).
Proof.
  intros.
  reflexivity.
Qed.

Lemma aexp_is_0:
  forall e,
  e = ANum 0 \/ e <> ANum 0.
Proof.
  intros.
  destruct e.
  1:{ destruct n.
    + left. reflexivity.
    + right. intros N. inversion N.
  }
  all: right.
  all: intros N.
  all: inversion N.
Qed.

Lemma optimize_0plus_spec:
  forall e s,
  aeval s e = aeval s (optimize_0plus e).
Proof.
  intros.
  induction e.
  - reflexivity.
  - reflexivity.
  - assert (X: e1 = ANum 0 \/ e1 <> ANum 0). {
      apply aexp_is_0.
    }
    destruct X.
    + subst.
      rewrite plus_eq_0.
      rewrite <- IHe2.
      reflexivity.
    + rewrite plus_neq_0.
      * rewrite <- IHe2.
        simpl.
        rewrite <- IHe1.
        reflexivity.
      * assumption.
  - simpl.
    rewrite <- IHe1.
    rewrite <- IHe2.
    reflexivity.
  - simpl.
    rewrite <- IHe1.
    rewrite <- IHe2.
    reflexivity.
Qed.


Inductive Opt (O : aexp -> aexp -> Prop) : aexp -> aexp -> Prop :=
(* No optimization *)
| opt_skip : forall a, (forall a', ~ O a a') -> Opt O a a
(* Optimize code *)
| opt_do : forall a a', O a a' -> Opt O a a'
(* Recurse *)
| opt_plus : forall a1 a2 a1' a2' : aexp,
              Opt O a1 a1' ->
              Opt O a2 a2' -> Opt O (APlus a1 a2) (APlus a1' a2')
| opt_minus : forall a1 a2 a1' a2' : aexp,
              Opt O a1 a1' ->
              Opt O a2 a2' -> Opt O (AMinus a1 a2) (AMinus a1' a2')
| opt_mult : forall a1 a2 a1' a2' : aexp,
              Opt O a1 a1' ->
              Opt O a2 a2' -> Opt O (AMult a1 a2) (AMult a1' a2').

Definition a_eq (a a': aexp) : Prop :=
  forall s n, aevalR s a n <-> aevalR s a' n.

Definition preserves_eq (R:aexp -> aexp -> Prop) : Prop :=
  forall a a', R a a' -> a_eq a a'.

Lemma a_eq_refl:
  forall a,
  a_eq a a.
Proof.
  intros.
  unfold a_eq.
  intros.
  reflexivity.
Qed.

Ltac invc H := inversion H; subst; clear H. 

Lemma a_eq_plus:
  forall a1 a1' a2 a2',
  a_eq a1 a1' ->
  a_eq a2 a2' ->
  a_eq (APlus a1 a2) (APlus a1' a2').
Proof.
  unfold a_eq.
  intros a1 a1' a2 a2' Ha Hb s n.
  split.
  all: intros Hc.
  - invc Hc.
    rewrite Ha in *.
    rewrite Hb in *.
    apply E_APlus.
    all: assumption.
  - invc Hc.
    rewrite <- Ha in *.
    rewrite <- Hb in *.
    apply E_APlus.
    all: assumption.
Qed.


Lemma a_eq_mult:
  forall a1 a1' a2 a2',
  a_eq a1 a1' ->
  a_eq a2 a2' ->
  a_eq (AMult a1 a2) (AMult a1' a2').
Proof.
  unfold a_eq.
  intros a1 a1' a2 a2' Ha Hb s n.
  split.
  all: intros Hc.
  - invc Hc.
    rewrite Ha in *.
    rewrite Hb in *.
    apply E_AMult.
    all: assumption.
  - invc Hc.
    rewrite <- Ha in *.
    rewrite <- Hb in *.
    apply E_AMult.
    all: assumption.
Qed.


Lemma a_eq_minus:
  forall a1 a1' a2 a2',
  a_eq a1 a1' ->
  a_eq a2 a2' ->
  a_eq (AMinus a1 a2) (AMinus a1' a2').
Proof.
  unfold a_eq.
  intros a1 a1' a2 a2' Ha Hb s n.
  split.
  all: intros Hc.
  - invc Hc.
    rewrite Ha in *.
    rewrite Hb in *.
    apply E_AMinus.
    all: assumption.
  - invc Hc.
    rewrite <- Ha in *.
    rewrite <- Hb in *.
    apply E_AMinus.
    all: assumption.
Qed.

Lemma correctness_alt:
  forall f,
  preserves_eq f ->
  preserves_eq (Opt f).
Proof.
Admitted.

Lemma correctness:
  forall f,
  (forall a a', f a a' -> a_eq a a') ->
  forall a a',
  Opt f a a' ->
  a_eq a a'.
Proof.
  intros f f_preserves a a' H.
  induction H.
  - apply a_eq_refl.
  - apply f_preserves.
    assumption.
  - rename a2 into a1.
    rename a0 into a2.
    apply a_eq_plus.
    all: assumption.
  - apply a_eq_minus.
    all: assumption.
  - apply a_eq_mult.
    all: assumption.
Qed.


Inductive LocalPlus : aexp -> aexp -> Prop :=
  | local_plus:
    forall n1 n2,
    LocalPlus (APlus (ANum n1) (ANum n2)) (ANum (n1 + n2)).

Theorem local_plus_correct:
  forall a a',
  Opt LocalPlus a a' ->
  a_eq a a'.
Proof.
  apply correctness.
  intros.
  invc H.
  unfold a_eq.
  intros.
  split.
  all: intros H.
  - invc H.
    invc H2.
    invc H4.
    apply E_ANum.
  - invc H.
    apply E_APlus.
    + apply E_ANum.
    + apply E_ANum.
Qed.


Definition optimizer_step (rec:aexp -> aexp) (f:aexp -> option aexp) (a:aexp) : aexp :=
  match f a with
  | Some a' => a'
  | None =>
    match a with
    | AId x => AId x
    | ANum n => ANum n
    | APlus e1 e2 => APlus (rec e1) (rec e2)
    | AMinus e1 e2 => AMinus (rec e1) (rec e2)
    | AMult e1 e2 => AMult (rec e1) (rec e2)
    end
  end.

    
    
    