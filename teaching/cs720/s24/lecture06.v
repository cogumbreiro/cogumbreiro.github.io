Fixpoint double (n:nat) :=
  match n with
  | O => O
  | S n' => S (S (double n'))
  end.

Theorem double_injective_FAILED : forall n m,
     double n = double m ->
     n = m.
Proof.
  intros n m. induction n as [| n'].
  - (* n = O *) simpl. intros eq.
    destruct m as [| m'].
    + (* m = O *) reflexivity.
    + simpl in eq. (* m = S m' *) discriminate eq.
  - (* n = S n' *) intros eq.
    simpl in eq.
    destruct m.
    + (* m = 0 *)
      discriminate eq.
    + simpl in eq.
      injection eq as eq.
Abort.

Theorem double_injective : forall n m,
     double n = double m ->
     n = m.
Proof.
  intros n.
  induction n.
  - intros m eq.
    destruct m.
    + reflexivity.
    + simpl in eq.
      discriminate eq.
  - intros m eq.
    destruct m.
    + simpl in eq.
      discriminate eq.
    + simpl in eq.
      injection eq as eq.
      (* proof 2 *)
      rewrite IHn with (m:=m).
      * reflexivity.
      * assumption.
      (* (* proof 1 *)
      f_equal.
      apply IHn.
      assumption.
      *)
Qed.

Theorem double_injective_short : forall n m,
     double n = double m ->
     n = m.
Proof.
  intros n.
  induction n.
  all: intros m eq.
  all: destruct m.
  all: simpl in eq.
  all: inversion eq.
  - reflexivity.
  - f_equal.
    apply IHn.
    assumption.
Qed.



Theorem double_injective_by_m : forall n m,
     double n = double m ->
     n = m.
Proof.
  intros n m.
  generalize dependent n.
  induction m.
  all: intros n eq.
  all: destruct n.
  all: simpl in eq.
  all: inversion eq.
  - reflexivity.
  - f_equal.
    apply IHm.
    assumption.
Qed.

Definition sillyfun (n : nat) : bool :=
  if Nat.eqb n 3 then false
  else if Nat.eqb n 5 then false
  else false.


Theorem sillyfun_false_1 : forall (n : nat),
  sillyfun n = false.
Proof.
  intros n. unfold sillyfun.
  destruct n.
  all: simpl.
  - reflexivity.
  - destruct n.
    all: simpl.
    + reflexivity.
    + destruct n.
      all: simpl.
      * reflexivity.
      * destruct n.
        all: simpl.
        -- reflexivity.
        -- destruct n.
           all: simpl.
           ++ reflexivity.
           ++ destruct n.
              all: simpl.
              all: reflexivity.
Qed.
  
Theorem sillyfun_false3 : forall (n : nat),
  sillyfun n = false.
Proof.
  intros n. unfold sillyfun.
  destruct (Nat.eqb n 3).
  - reflexivity.
  - destruct (Nat.eqb n 5).
    + reflexivity.
    + reflexivity.
Qed.

Definition sillyfun1 (n : nat) : bool :=
  if Nat.eqb n 3 then true
  else if Nat.eqb n 5 then true
  else false.
  
Require Import PeanoNat.

Theorem sillyfun1_odd : forall (n : nat),
     sillyfun1 n = true ->
     Nat.odd n = true.
Proof.
  intros n eq1. unfold sillyfun1 in eq1.
  destruct (Nat.eqb n 3) eqn:eq2.
  + rewrite Nat.eqb_eq in eq2.
    rewrite eq2.
    reflexivity.
  + destruct (Nat.eqb n 5) eqn:eq3.
    * rewrite Nat.eqb_eq in eq3.
      rewrite eq3.
      reflexivity.
    * discriminate eq1.
Qed.


Theorem sillyfun1_odd_no_eqn : forall (n : nat),
     sillyfun1 n = true ->
     Nat.odd n = true.
Proof.
  intros n eq1. unfold sillyfun1 in eq1.
  destruct (Nat.eqb n 3).
Abort.

Definition square n := n * n.

Lemma square_mult : forall n m, square (n * m) = square n * square m.
Proof.
  intros n m.
  unfold square.
Abort.

Definition e := 5.
Definition f (x:nat) := 5.
Definition g (x:nat) := x.
Definition i (x:nat) := match x with _ => x end.
Definition h (x:nat) :=
  match x with
  | S _ => x
  | 0 => x
  end.
  
Goal h 3 = 3.
Proof.
  simpl.
  
Abort.




