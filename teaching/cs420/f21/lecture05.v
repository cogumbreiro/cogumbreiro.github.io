
Inductive list (X:Type) : Type :=
 | nil 
 | cons : X -> list X -> list X.

Check nil.
Check (nil nat).
Check cons nat 1 (nil nat).
Check cons _ true (cons _ true (nil _)).
Check cons _ 1 (nil _).
Fail Check cons nat 1 (nil bool).

Compute cons _ 1 (cons _ 2 (nil _)). 

Check list.

(* How do I define a list of booleans or naturals? *)
Inductive bool_or_nat:=
| a_bool : bool -> bool_or_nat
| a_nat : nat -> bool_or_nat.
Check list bool_or_nat.

Fixpoint app {X:Type} (l1 l2 : list X) : list X :=
 match l1 with
 | nil _ => l2
 | cons _ h t => cons X h (app t l2)
 end.

Inductive list2 (X:Type) : Type :=
 | nil2 
 | cons2 : X -> list2 X -> list2 X.

Arguments nil2 {_}.
Arguments cons2 {X} x y.

Fixpoint app2 {X:Type} (l1 l2 : list2 X) : list2 X :=
 match l1 with
 | nil2 => l2
 | cons2 h t => cons2 h (app2 t l2)
 end.


Compute nil2.

Compute @nil2 nat.

Theorem eq_trans : forall (T:Type) (x y z : T),
  x = y -> y = z -> x = z.
Proof.
  intros T x y z eq1 eq2.
  rewrite -> eq1.
  apply eq2.
Qed.

Theorem eq_trans_2 : forall (T:Type) (x y z: T),
  (x = y -> y = z -> x = z) -> (* eq1 *)
  x = y ->                     (* eq2 *)
  y = z ->                     (* eq3 *)
  x = z.
Proof.
  intros T x y z eq1 eq2 eq3.
(*   assert (A := eq1 eq2 eq3).
  apply A.
 *) 
(*  rewrite eq1. *)
   apply eq1.   (* x = y -> y = z -> x = z *)
   - apply eq2.
   - apply eq3.
Qed.


Theorem eq_trans_nat : forall (x y z: nat),
  x = 1 ->
  x = y ->
  y = z ->
  z = 1.
Proof.
  intros x y z eq1 eq2 eq3.
  assert (eq4: x = z). {
    apply eq_trans with (y:=y).
    - apply eq2.
    - apply eq3.
    (*
    apply (eq_trans _ _ y).
    - apply eq2.
    - apply eq3.
*)
    (*
    apply (eq_trans nat x y).
    - apply eq2.
    - apply eq3.
    *)
    (*
    assert (A := eq_trans nat x y z eq2 eq3).
    apply A. *)
  }
  rewrite <- eq4.
  apply eq1.
Qed.

Theorem eq_trans_nat56 : forall (x y z: nat),
  x = 1 ->
  x = y ->
  y = z ->
  z = 1.
Proof.
  intros.
  symmetry in H1.
  rewrite H1.
  rewrite <- H0.
  apply H.
Qed.
  

Theorem eq_trans_nat43 : forall (x y z: nat),
  x = 1 ->
  x = y ->
  z = y ->
  z = 1.
Proof.
  intros x y z eq1 eq2 eq3.
  assert (eq4: x = z). {
    apply eq_trans with (y:=y).
    - apply eq2.
    - symmetry.
      apply eq3.
   }
 Admitted.


Theorem S_injective : forall (n m : nat),
  S n = S m ->
  n = m.
Proof.
  intros n m eq1.
  inversion eq1.
  reflexivity.
Qed.

Goal
  false = true -> False.
Proof.
  intros.
  inversion H.
Qed.

(*
Theorem eq_trans_nat3 : forall (x y z: nat),
  x = 1 ->
  x = y ->
  z = y ->
  1 = z.
Proof.
  intros x y z eq1 eq2 eq3.
  assert (
  apply eq_trans with (y:=y) (x:=x) (z:=z).
  - 
  assert (eq4: x = z). {
    symmetry in eq3.
  }

*)











