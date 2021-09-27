Definition x : nat := 5.

Check 5.
Check x.
Compute x.
Print x.
Compute Nat.eqb 2 2.
Compute Nat.eqb 2 3.
Compute Nat.eqb 3 3.

Definition proof1:
  x = 5.
Proof.
  reflexivity.
Qed.

Inductive natprod :=
  nat_pair: nat -> nat -> natprod.

Compute nat_pair 1 2.

Inductive prod1 (X:Type) :=
  pair1: X -> X -> prod1 X.

Compute pair1 nat 1 2.

Inductive prod (X:Type) (Y:Type) :=
  pair2: X -> Y -> prod X Y.

Compute pair2 _ _ 1 true.

Inductive LAnd (P:Prop) (Q:Prop) : Prop :=
| conj2: P -> Q -> LAnd P Q.


Goal
  2 = 2 /\ 3 = 3.
Proof.
  apply conj.
  - reflexivity.
  - reflexivity.
Qed.


Goal
  2 = 2 /\ 3 = 3.
Proof.
  split.
  - reflexivity.
  - reflexivity.
Qed.

Goal
  2 = 2 /\ 3 = 3 ->
  2 = 2.
Proof.
  intros H.
  destruct H.
  apply H.
Qed.


Theorem get_left_of_and:
  forall P Q,
  P /\ Q ->
  P.
Proof.
  intros.
  destruct H.
  apply H.
Qed.

Inductive result (O:Type) (E:Type) : Type :=
| ok: O -> result O E
| err: E -> result O E.

Compute ok nat nat 1.
Compute err nat bool true.

Theorem or_1: forall A B : Prop,
  A -> A \/ B.
Proof.
  intros.
  (* left. *)
  apply or_introl.
  apply H.
Qed.

Theorem or_2: forall A B : Prop,
  B -> A \/ B.
Proof.
  intros.
  right.
  apply H.
Qed.


Lemma or_example :
  forall n m : nat, n = 0 \/ m = 0 -> n * m = 0.
Proof.
  intros n m Hor.
  destruct Hor as [Hleft | Hright].
  - admit.
  - admit.
Admitted.


Goal
  True.
Proof.
  Print True.
  apply I.
Qed.

Goal
  True ->
  1 = 2.
Proof.
  intros.
  destruct H.
Abort.

Goal False.
  Print False.
Abort.

Goal
  1 = 2 -> False.
Proof.
  intros.
  inversion H.
Qed.













