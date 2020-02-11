Lemma add_assoc:
  forall n m o,
  (n + m) + o = n + (m + o).

Proof.
  intros.
  induction n. {
    simpl.
    reflexivity.
  }
  simpl.
  rewrite IHn.
  reflexivity.
Qed.

Lemma zero_in_middle:
  forall n m, n + 0 + m = n + m.
Proof.
  intros.
  assert (Hx := add_assoc n 0 m).
  generalize dependent n.
  rename m into x.
Admitted.
(*
Inductive natlist : Type :=
 | nil : natlist
 | cons : nat -> natlist -> natlist.
 *)
(*
Inductive list (T:Type) :=
 | nil : list T
 | cons : T -> list T -> list T.

Check nil.

Compute nil nat.
Compute (cons nat 1 (nil nat)).

Compute (cons _ 1 (nil _)).
*)

Check (cons 1 nil).
Check @nil.


Theorem eq_trans : forall (T:Type) (x a z : T),
  x = a -> a = z -> x = z.
Proof.
  (*
  intros T x y z eq1 eq2.
  rewrite eq1.
  apply eq2.
  *)
  intros T x y z eq1 eq2.
  rewrite eq1.
  assumption.
  (*
  intros T x y z eq1 eq2.
  rewrite eq1.
  apply eq2.
  rewrite eq2.
  reflexivity.
  *)
Qed.

Theorem eq_trans_2 : forall (T:Type) (x y z: T),
  (x = y -> y = z -> x = z) -> (* eq1 *)
  x = y ->                     (* eq2 *)
  y = z ->                     (* eq3 *)
  x = z.
Proof.
  (*
  intros T x y z eq1 eq2 eq3.
  assert (Hx := eq1 eq2 eq3).
  apply Hx.
  *)
  (*
  intros T x y z eq1 eq2 eq3.
  apply eq1.
  - apply eq2.
  - apply eq3.
  *)
  intros T x y z eq1 eq2 eq3.
  rewrite eq1.
  - reflexivity.
  - assumption.
  - assumption.
 (* List<T> *)
Qed.

Theorem eq_trans_nat : forall (x y z: nat),
  x = 1 ->
  x = y ->
  y = z ->
  z = 1.
Proof.
  intros x y z eq1 eq2 eq3.
  assert (eq4: x = z). {
    apply eq_trans with (a:=y) (x:=x) (z:=z).
    - assumption.
    - assumption.
  }
  rewrite <- eq4.
  assumption.
  (*
  intros x y z eq1 eq2 eq3.
  assert (eq4: x = z). {
    apply (eq_trans _ x y z).
    - assumption.
    - assumption.
  }
  rewrite <- eq4.
  assumption.*)
Qed.

Theorem S_injective : forall (n m : nat),
  S n = S m ->
  n = m.
Proof.
  intros n m eq1.
  inversion eq1.
  reflexivity.
Qed.

(*
Theorem asdfg : forall (n m : nat),
  m + n = n + m ->
  n = m.
Proof.
  intros.
  inversion H.
 *)
Theorem foo : forall (n m : nat),
  S n = O ->
  n < m /\ m > n /\ m = 0 /\ n = 10.
Proof.
  intros.
  inversion H.
Qed.

 
 
 
 
 
 
 
 
 
 