Require Import Nat.
Check Nat.eqb.
Check Nat.eqb 2.
Check Nat.eqb 2 2.

Check Nat.eqb 2 2 = true.

Definition a := true.

Definition b' := true = true.

Check Nat.eqb 2 3 = true.

Goal 0 = 1.
Proof.
Abort.

Definition ex0 : bool := Nat.eqb 2 2.

Check ex0.
Compute ex0.

Definition ex1' := Nat.eqb 2 2 = true.
Check ex1'.
Compute ex1'.

Lemma prove_ex1':
  ex1'.
Proof.
  unfold ex1'.
  simpl.
  reflexivity.
Qed.  


Definition ex1 n : Prop := Nat.eqb 2 n = true.

Theorem ex2 :  forall n, n = 2 -> Nat.eqb 2 n = true.
Proof.
  intros.
  subst.
  reflexivity.
Qed.

Goal ex1 2.
Proof.
  reflexivity.
Qed.

Goal ex1 3.
Proof.
 unfold ex1.
 simpl.
Abort.

Goal 3 + 4 = 7 /\ 2 * 2 = 4.
Proof.
  simpl.
  split; reflexivity.
Qed.


Goal forall A B : Prop, A -> B -> A /\ B.
Proof.
  intros.
  split.
  - apply H.
  - assumption.
Qed.

Goal
  forall x y,
  3 + x = y /\ 2 * 2 = x ->
  x = 4 /\ y = 7.
Proof.
  intros x y Hconj.
  simpl in *.
  destruct Hconj as (lhs, rhs).
  split.
  - subst.
    reflexivity.
  - subst.
    reflexivity.
Qed.


Lemma correct_2 : forall A B : Prop, A /\ B -> A.
Proof.
  intros.
  destruct H.
  assumption.
Qed.

Definition type1 : Type := bool.
Definition value_of_type1 : type1 := true.

Definition prop1 : Prop := 0 = 0.
Definition proof_of_prop1 : prop1 := eq_refl.

Lemma correct_3 : forall A B : Prop, A /\ B -> B.
Proof.
  intros.
  destruct H.
  assumption.
Qed.

Goal
  forall n m : nat,
    Nat.eqb n m = true \/ Nat.eqb n m = false.
Proof.
  intros.
  destruct (Nat.eqb n m).
  - left.
    reflexivity.
  - right.
    reflexivity.
Qed.

Lemma or_example :
  forall n m : nat, n = 0 \/ m = 0 -> n * m = 0.
Proof.
  intros n m Hor.
  destruct Hor as [Heq | Heq].
  - subst.
    reflexivity.
  - subst.
    Search (_ * 0).
    rewrite <- mult_n_O.
    reflexivity.
Qed.

Goal
  1 = 2 ->
  False.
Proof.
  intros.
  discriminate H.
Qed.

Goal
  forall (P:Prop),
  False ->
  P.
Proof.
  intros.
  destruct H.
Qed.

Goal
  forall (P:Prop),
  False ->
  P.
Proof.
  intros.
  contradiction.
Qed.

Print not.

Goal
  ~ False.
Proof.
  unfold not.
  intros N.
  (* apply N *)
  contradiction.
Qed.

Goal
  ~ (1 = 2).
Proof.
  unfold not.
  intros.
  discriminate H.
Qed.

Theorem contradiction_implies_anything : forall P Q : Prop,
  (P /\ ~ P) -> Q.
Proof.
  intros.
  destruct H.
  (* contradiction. *)
  unfold not in H0.
  apply H0 in H.
  contradiction.
Qed.


Theorem not_true_is_false : forall b : bool,
  b <> true -> b = false.
Proof.
  intros.
  destruct b. {
    contradiction.
  }
  reflexivity.
Qed.


Lemma True_is_true : True.
Proof. apply I. Qed.


Fixpoint replicate (P:Prop) (n:nat) :=
  match n with
  | S m => P /\ replicate P m
  | 0 => True
  end.

Goal
  forall (P:Prop),
  P ->
  replicate P 3.
Proof.
  intros.
  simpl.
  split; try assumption.
  split; try assumption.
  split; try assumption.
  apply I.
Qed.

Goal
  forall (P:Prop),
  P ->
  forall n,
  replicate P n.
Proof.
Admitted.

(* Build a replicate that joins propositions with \/ rather than ands. *)



