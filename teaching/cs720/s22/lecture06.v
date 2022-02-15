(* Import this module to load beq_nat_true *)
Require Import Coq.Arith.EqNat.

Check beq_nat_true.

Fixpoint double (n:nat) := match n with | O => O | S n' => S (S (double n')) end.

(*
P(n) := double n = double m -> n = m


P(0) <-> double 0 = double m -> 0 = m

P(n') -> P(S n') 

<->

IHn' :  double n' = double m -> n' = m
eq: double (S n') = double m
-------------------------------------
S n' = m




Q(n) := forall m, double n = double m -> n = m


Q(0) <-> forall m, double 0 = double m -> 0 = m

Q(n') -> Q(S n') 

<->

IHn': forall m, double n' = double m -> n' = m
----------------------------------------------
forall m, double S n' = double m -> S n' = m
*)

Theorem double_injective_FAILED : forall n m,
     double n = double m ->
     n = m.
Proof.
  intros n. induction n as [| n'].
  - (* n = O *) simpl. intros m eq. destruct m as [| m'].
    + (* m = O *) reflexivity.
    + (* m = S m' *) discriminate eq.
  - (* n = S n' *) intros m eq.
    simpl in eq.
    destruct m. {
      discriminate eq.
    }
    simpl in eq.
    injection eq as eq.
    rename m into m'.
    (* Attempt 1: using apply *)
    (* 
    apply IHn' in eq.
    (* Attempt 1.1. *)
    (* rewrite eq. reflexivity. *)
    (* Attempt 1.2.*)
    f_equal.
    (* assumption. *)
    apply eq.
     *)
    (* Attempt 2: 
    rewrite IHn' with (m:=m').
    + reflexivity.
    + assumption.
    *)
    f_equal.
    apply IHn'.
    assumption.
Qed.


Theorem double_injective : forall m n,
     double n = double m ->
     n = m.
Proof.
  intros m n eq1.
  (*
  generalize eq1. clear eq1.
  generalize m.
  clear m.
  *)
  generalize dependent m.
Abort.

Fixpoint even (n:nat) : bool :=
  match n with
  | O        => true
  | S O      => false
  | S (S n') => even n'
  end.

Definition oddb n := negb (even n).

Definition sillyfun (n : nat) : bool :=
  if Nat.eqb n 3 then false
  else if Nat.eqb n 5 then false
  else false.
Theorem sillyfun_false : forall (n : nat),
  sillyfun n = false.
Proof.
  intros n. unfold sillyfun.
  destruct (Nat.eqb n 3).
  - reflexivity.
  - destruct (Nat.eqb n 5); reflexivity.
Qed.



Definition sillyfun1 (n : nat) : bool :=
  if Nat.eqb n 3 then true
  else if Nat.eqb n 5 then true
  else false.


Theorem sillyfun1_odd : forall (n : nat),
     sillyfun1 n = true ->
     oddb n = true.
Proof.
  intros n eq1. unfold sillyfun1 in eq1.
  unfold oddb.
  destruct (Nat.eqb n 3) eqn : X.
  + (* Nat.eqb n 3 = true *)
    apply beq_nat_true in X.
    rewrite X.
    simpl.
    reflexivity.
  + destruct (Nat.eqb n 5) eqn : Y.
    * apply beq_nat_true in Y.
      rewrite Y.
      reflexivity.
    * discriminate eq1.
Qed.
