Require Import PeanoNat.


Fixpoint evenb (n:nat) : bool :=
  match n with
  | O        => true
  | S O      => false
  | S (S n') => evenb n'
  end.

Inductive ev : nat -> Prop :=
| ev_0 : ev 0
| ev_SS : forall n : nat, ev n -> ev (S (S n)).

Theorem evenb_to_ev:
  forall n,
  evenb n = true ->
  ev n.
Proof.
Admitted.

Theorem ev_to_evenb:
  forall n,
  ev n ->
  evenb n = true.
Proof.
  intros.
  induction H.
  - reflexivity.
  - simpl.
    assumption.
Qed.
 
Theorem ev_iff_evenb:
  forall n,
  ev n <-> evenb n = true.
Proof.
  intros.
  split.
  - apply ev_to_evenb.
  - apply evenb_to_ev.
Qed.

Lemma not_even:
  forall n,
  evenb n = false ->
  ~ ev n.
Proof.
  intros.
  intros N.
  apply ev_iff_evenb in N.
  rewrite H in N.
  inversion N.
Qed.

Goal ev 6.
Proof.
  apply ev_SS, ev_SS, ev_SS, ev_0.
Qed.

Theorem evenb_6: evenb 6 = true.
  simpl.
  reflexivity.
Qed.

Goal ev 6.
Proof.
  apply ev_iff_evenb.
  reflexivity.
Qed.

Inductive reflect (P : Prop) : bool -> Prop :=
| ReflectT : P -> reflect P true
| ReflectF : ~ P -> reflect P false.
Theorem iff_reflect : forall P b, (P <-> b = true) -> reflect P b.
Admitted.
Theorem reflect_iff : forall P b, reflect P b -> (P <-> b = true). (* Homework*)
Admitted.

Theorem reflect_ev:
  forall n,
  reflect (ev n) (evenb n).
Proof.
  intros.
  destruct (evenb n) eqn:eq1.
  - apply ReflectT.
    apply ev_iff_evenb.
    assumption.
  - apply ReflectF.
    apply not_even.
    assumption.
Qed.

Lemma reflect_true:
  forall P,
  reflect P true ->
  P.
Proof.
  intros.
  inversion H.
  assumption.
Qed.

Lemma reflect_false:
  forall P,
  reflect P false ->
  ~ P.
Proof.
  intros.
  inversion H.
  assumption.
Qed.

Goal ev 6.
Proof.
  apply reflect_true.
  assert (eq1: true = evenb 6) by reflexivity.
  rewrite eq1.
  apply reflect_ev.
Qed.

Lemma reflect_and:
  forall P b1 Q b2,
  reflect P b1 ->
  reflect Q b2 ->
  reflect (P /\ Q) (andb b1 b2).
Proof.
  intros.
  destruct b1, b2.
  - constructor.
    split.
    + apply reflect_true.
      assumption.
    + apply reflect_true.
      assumption.
  - apply ReflectF.
    intros N.
    destruct N as (N1, N2).
    inversion H0.
    contradiction.
  - apply ReflectF.
    intros N.
    destruct N as (N1, N2).
    inversion H.
    contradiction.
  - apply ReflectF.
    intros N.
    destruct N as (N1, N2).
    inversion H.
    contradiction.
Qed.

Lemma reflect_or:
  forall P b1 Q b2,
  reflect P b1 ->
  reflect Q b2 ->
  reflect (P \/ Q) (orb b1 b2).
Proof.
  intros.
  destruct b1, b2.
  all: inversion H.
  all: inversion H0.
  all: clear H H0.
  - apply ReflectT.
    left.
    assumption.
  - apply ReflectT.
    left.
    assumption.
  - apply ReflectT.
    right.
    assumption.
  - apply ReflectF.
    intros N.
    destruct N.
    all: contradiction.
Qed.

Goal
  ev 6 /\ ev 4.
Proof.
  apply reflect_true.
  assert (eq1: true = andb (evenb 6) (evenb 4)) by reflexivity.
  rewrite eq1.
  apply reflect_and.
  - apply reflect_ev.
  - apply reflect_ev.
Qed.

Inductive Lang :=
| Eq: nat -> nat -> Lang      (* x = n  *)
| Even: nat -> Lang           (* ev n   *)
| And: Lang -> Lang -> Lang   (* P /\ Q *)
| Or: Lang -> Lang -> Lang.   (* P \/ Q *)

Fixpoint eval (exp:Lang) :=
  match exp with
  | Eq n m => Nat.eqb n m
  | Even n => evenb n
  | And l r => andb (eval l) (eval r)
  | Or l r => orb (eval l) (eval r)
  end.

Fixpoint as_prop (exp:Lang) :=
  match exp with
  | Eq n m => n = m
  | Even n => ev n
  | And l r => as_prop l /\ as_prop r
  | Or l r => as_prop l \/ as_prop r
  end.


Goal eval (Or (Even 3) (Eq 3 3)) = true.
  reflexivity.
Qed.

Compute as_prop (Or (Even 3) (Eq 3 3)).

Goal as_prop (Or (Even 3) (Eq 3 3)).
  (* ev 3 \/ 3 = 3 *)
  simpl.
  right.
  reflexivity.
Qed.

Lemma reflect_lang:
  forall p,
  reflect (as_prop p) (eval p).
Proof.
Admitted.

Goal ev 3 \/ 3 = 3.
  assert (H:=reflect_lang (Or (Even 3) (Eq 3 3))).
  simpl in H.
  apply reflect_true.
  assumption.
Qed.

Ltac trans P :=
  match P with
    | ?P1 /\ ?P2 =>
      let t1 := trans P1 in
      let t2 := trans P2 in constr:(And t1 t2)
    | ev ?x => constr:(Even x)
    | ?P1 \/ ?P2 =>
      let t1 := trans P1 in
      let t2 := trans P2 in constr:(Or t1 t2)
    | ?x = ?y => constr:(Eq x y)
  end.

Goal ev 3 \/ 3 = 3.
Proof.
  let t := trans (ev 3 \/ 3 = 3) in
   assert (H:= reflect_lang t).
  simpl in H.
  apply reflect_true.
  assumption.
Qed.

Ltac solve :=
  match goal with
    | [ |- ?P ] =>
      let t := trans P in
      let H := fresh "H" in
      assert (H := reflect_lang t);
      apply reflect_true, H
  end.

Ltac invc H := inversion H; subst; clear H.

Goal ev 3 \/ (ev 4 /\ ev 2).
Proof.
  solve.
Qed.










  
  
  
