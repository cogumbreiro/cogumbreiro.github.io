Inductive Even : nat -> Prop :=
| even_0 : Even 0
| even_s_s : forall n,
    Even n ->
    Even (S (S n)).

Require Import PeanoNat.

Goal forall n,
    Even n ->
    exists m, n = 2 * m.
Proof.
  intros.
  induction H.
  - exists 0.
    reflexivity.
  - destruct IHEven as (x, IH).
    exists (S x).
    simpl.
    rewrite Nat.add_0_r.
    f_equal.
    rewrite IH.
    simpl.
    rewrite Nat.add_0_r.
    rewrite Nat.add_succ_r.
    reflexivity.
Qed.
Goal forall n,
    Even n ->
    exists m, n = 2 * m.
Proof.
  induction n.
  intros.
  { exists 0. reflexivity. }
  intros is_even.
Abort.

Inductive bit : Type := on | off.

Definition bool_to_bit (b:bool) : bit :=
    match b with
    | true => on
    | false => off
    end.

Definition bit_to_bool (b:bit) : bool :=
  match b with
  | on => true
  | off => false
  end.

Goal
    forall b,
    bool_to_bit (bit_to_bool b) = b.
Proof.
  destruct b.
  all: reflexivity.
Qed.

Inductive Bit : Prop := On | Off.

Definition bool_to_Bit (b:bool) : Bit :=
  match b with
  | true => On
  | false => Off
  end.
(*
Definition Bit_to_bool (b:Bit) : bool :=
  match b with
  | On => true
  | Off => false
  end.
*)

Goal Bit.
Proof. apply On. Qed.

Require Import List.
Import ListNotations.

Inductive In {A:Type} : A -> list A -> Prop :=  

| in_eq:
    forall x l,
    In x (x::l)
| in_cons:
    forall x y l,
    In x l ->
    In x (y::l).

Goal
  In 3 [1; 2; 3].
Proof.
  simpl.
  apply in_cons.
  apply in_cons.
  apply in_eq.
Qed.


Goal
  forall (T:Type) (x:T) (l: list T),
  In x l ->
  l <> [].
Proof.
  intros.
  intros N.
  subst.
  inversion H.
Qed.

Goal
  forall (T:Type) (x:T) (l1 l2: list T),
  In x (l1 ++ l2) ->
  In x l1 \/ In x l2.
Proof.
  Print app.
  intros.
  induction l1.
  - simpl in H.
    right.
    assumption.
  - simpl in H.
    inversion H.
    all: subst.
    all: clear H.
    + left. apply in_eq.
    + apply IHl1 in H2.
      destruct H2 as [Ha|Ha].
      * left. apply in_cons. assumption.
      * right. assumption.
Qed.

(*
Fixpoint mc_carthy91 (n:nat) :=
  if Nat.ltb 100 n then (* 100 < n *)
    n - 10
  else
    mc_carthy91 (mc_carthy91 (n + 11)).
*)

Inductive McCarthy91: nat -> nat -> Prop :=
| mc_carthy_91_gt:
  forall n,
  n > 100 ->
  McCarthy91 n (n - 10)
| mc_carthy_91_le:
  forall n o m,
  n <= 100 ->
  McCarthy91 (n + 11) m ->
  McCarthy91 m o ->
  McCarthy91 n o.
  
Theorem evSS : forall n,
  Even (S (S n)) -> Even n.
Proof.
  intros.
  inversion H.
  subst.
  assumption.
Qed.

Goal ~ Even 3.
Proof.
  unfold not.
  intros N.
  inversion N.
  subst.
  inversion H0.
Qed.

Print Even_ind.

Goal forall n, Even n -> ~ Even (S n).
Proof.
  intros.
  induction H.
  - intros N. inversion N.
  - unfold not in IHEven. intros N.
    apply IHEven.
    clear IHEven.
    apply evSS in N.
    assumption.
Qed.



