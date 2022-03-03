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

Definition ex1: bit := on.
Definition ex1' : bit.
Proof.
  apply on.
Defined.

Goal
  ex1 = ex1'.
Proof.
  unfold ex1.
  unfold ex1'.
  reflexivity.
Qed.

Definition ex2: bit -> bit := fun b => b.
Definition ex3: bool -> bit := fun b => if b then on else off.

Inductive Bit : Prop := On | Off.

Definition bool_to_Bit (b:bool) : Bit :=
  match b with
  | true => On
  | false => Off
  end.

Fail Definition Bit_to_bool (b:Bit) : bool :=
  match b with
  | On => true
  | Off => false
  end.

Lemma ex4: Bit.
Proof.
  apply On.
Qed.

Print ex1.
Print ex4.

Lemma ex5: Bit -> Bit.
Proof.
  intros.
  apply H.
Qed.

Definition ex5' : Bit -> Bit := fun b => b.
Goal forall b:Bit, b = On. Abort.
Lemma ex6: forall b:Bit, Bit. Proof.
  intros.
  apply b.
Qed.

Lemma ex7: Bit <-> True.
Proof.
  split; constructor.
Qed.

Inductive Bar : nat -> Prop :=
| C : Bar 1
| D : Bar 2.

Goal
  exists n,
  Bar n.
Proof.
  exists 1.
  apply C.
Qed.

Inductive Baz : nat -> Prop :=
| E : Baz 1
| F : forall n,
    Baz (S n).

Goal exists x, x = 0.
Proof.
  Print ex.
  apply ex_intro with (x:=0).
  reflexivity.
Qed.

Print nat.

Inductive In' {A:Type} (x: A) : list A -> Prop :=  
| in'_eq:
    forall l,
    In' x (x::l)
| in'_cons:
    forall y l,
    In' x l ->
    In' x (y::l).
Require Import List.
Import ListNotations.

Lemma in_in'_1:
  forall (A:Type) (x:Type) l,
  In' x l ->
  In x l.
Proof.
  intros.
  induction l. {
    inversion H.
  }
  simpl.
  inversion_clear H.
  - left. reflexivity.
  - right. apply IHl. assumption.
Qed.

Lemma in_in'_2:
  forall (A:Type) (x:Type) l,
  In' x l ->
  In x l.
Proof.
  intros.
  induction H.
  - left. reflexivity.
  - right. assumption.
Qed.
  
Require Import Lia.
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

Lemma correctness:
  forall n m,
  McCarthy91 n m ->
  (n > 100 /\ m = n - 10) \/ (n <= 100 /\ m = 91).
Proof.
  intros.
  induction H. {
    intuition.
  }
  destruct IHMcCarthy91_1 as [(Ha, Hb)|(Ha,Hb)]. {
    subst.
    destruct IHMcCarthy91_2 as [(Hc,Hd)|(Hc,Hd)]. {
      subst.
      lia.
    }
    subst.
    lia.
  }
  subst.
  destruct IHMcCarthy91_2 as [(Hc,Hd)|(Hc,Hd)]. {
    subst.
    simpl in *.
    left.
    lia.
  }
  subst.
  lia.
Qed.

Goal 3 <= 6.
Proof.
  Print le.
  apply le_S.
  apply le_S.
  apply le_S.
  apply le_n.
Qed.

Lemma ex: 3 <= 6.
Proof.
  repeat constructor.
Qed.



