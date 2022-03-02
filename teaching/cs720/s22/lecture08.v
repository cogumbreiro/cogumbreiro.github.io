Goal True.
Proof.
  apply I.
Qed.


(*
Definition iff (A B:Prop) : Prop :=
  (A -> B) /\ (B -> A).
  
  *)


Goal (1 = 1 <-> True).
Proof.
  split; intros.
  - apply I.
  - reflexivity.
Qed.

Lemma part1:
  forall n m,
  n * m = 0 ->
  n = 0 \/ m = 0.
Proof.
  intros [] m Hn.
  - left.
    reflexivity.
  - simpl in *.
    destruct m. {
      right.
      reflexivity.
    }
    discriminate Hn.
Qed.

Theorem mult_0 :
  forall n m, n * m = 0 <-> n = 0 \/ m = 0.
Proof.
  split; intros.
  - apply part1.
    assumption.
Admitted.

Goal
  forall x y z,
  x * (y * z) = 0 ->
  x * y = 0 \/ z = 0.
Proof.
  intros.
  apply mult_0 in H.
  destruct H. {
    left.
    rewrite H.
    reflexivity.
  }
  apply mult_0 in H.
  destruct H. {
    left.
    apply mult_0.
    right.
    assumption.
  }
  right. assumption.
Qed.


Goal
  forall x y z,
  x * (y * z) = 0 ->
  x * y = 0 \/ z = 0.
Proof.
  intros.
  apply mult_0.
Admitted.

Require Import Coq.Setoids.Setoid.

Goal
  forall x y z,
  x * (y * z) = 0 <-> x = 0 \/ (y = 0 \/ z = 0).
Proof.
  intros.
  symmetry.
  rewrite mult_0.
  rewrite mult_0.
  reflexivity.
Qed.

Goal
  forall y,
  exists x, Nat.eqb x y = true.
Proof.
  intros.
  exists 1.
Admitted.

Goal
    exists x y,
    3 + x = y.
Proof.
  exists (0 * 0).
  exists 3.
  reflexivity.
Qed.

Goal
    forall n,
    (exists m, n = 4 + m) ->
    (exists o, n = 2 + o).
Proof.
  intros.
  destruct H as (x, H).
  rewrite H.
  exists (2 + x).
  reflexivity.
Qed.







