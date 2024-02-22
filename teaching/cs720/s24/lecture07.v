Check true.
Check Nat.eqb 2 2.
Check Nat.eqb 2 2 = true.

Goal
  Nat.eqb 2 2 = true.
Proof.
  reflexivity.
Qed.

Check Nat.eqb 2 2 = false.

Goal 
  Nat.eqb 2 2 = false.
Proof.
  simpl.
  Fail reflexvity.
Abort.

Check  forall (n m : nat), n + m = m + n.

Definition ex0 := Nat.eqb 2 2.

Definition ex1 (n:nat) := Nat.eqb 2 n = true.

Definition ex1' : Prop := forall n, ex1 n.

Check ex1.

Lemma easy:
  forall n, n = 2 -> ex1 n.
Proof.
  intros.
  rewrite H.
  unfold ex1.
  reflexivity.
Qed.

Lemma confusing:
  nat -> nat.
Proof.
  exact (fun x => 2).
Qed.

Goal 3 + 4 = 7 /\ 2 * 2 = 4.
Proof.
  simpl.
  split.
  - reflexivity.
  - reflexivity.
Qed.

Goal forall P Q,
  P /\ Q ->
  Q /\ P.
Proof.
  intros.
  (* case analysis on H, gives me how H was proved *)
  destruct H as [proof_of_P proof_of_Q].
  split.
  - apply proof_of_Q.
  - apply proof_of_P.
Qed.

Lemma correct_2 : forall A B : Prop, A /\ B -> A.
Proof.
  intros.
  destruct H as [Ha _].
  assumption.
Qed.

Lemma correct_3 : forall A B : Prop, A /\ B -> B.
Proof.
  intros.
  destruct H as [_ Hb].
  assumption.
Qed.

Print and.


Goal
  forall n : nat, n = 5 -> n = 4 \/ n + 1 = 6.
Proof.
  intros.
  rewrite H.
  simpl.
  right.
  reflexivity.
Qed.



Goal
  forall n m : nat, Nat.eqb n m = true \/ Nat.eqb n m = false.
Proof.
  induction n.
  - intros.
    destruct m. { left. reflexivity. }
    simpl.
    right.
    reflexivity.
  - intros.
    simpl.
    destruct m.
    + right.
      reflexivity.
    + simpl.
      apply IHn.
Qed.

Inductive void : Type := .

Goal 1 = 2 -> False.
Proof.
  intros H.
  discriminate H. (* inversion H. *)
Qed.

Goal
  forall (P:Prop),
  False -> P.
Proof.
  intros.
  destruct H.
Qed.

Goal
  forall n,
  n = 0 \/ (n = 0 -> False).
Proof.
  intros.
  destruct n.
  - left. reflexivity.
  - right.
    intros N.
    discriminate N.
Qed.

Goal
  forall n,
  n = 0 \/ n <> 0.
Proof.
  intros.
  (* unfold not. *)
  destruct n.
  - left. reflexivity.
  - right.
    intros N.
    discriminate N.
Qed.

Goal 1 <> 0.
Proof.
  unfold not.
  intros N.
  discriminate N.
Qed.

Goal
   ~ False.
Proof.
  unfold not.
  intros N.
  apply N.
  (* destruct N. *)
Qed.

(* = axiom of choice *)
Axiom choice: forall (P:Prop), P \/ ~ P.

Goal
  forall P,
   ~ ~ P -> P.
Proof.
  unfold not.
  intros.
  destruct (choice P) as [choice1 | choice2].
  + apply choice1.
  + apply H in choice2.
    destruct choice2.
Qed.

Goal
  True.
Proof.
  apply I.
Qed.

Goal
  forall (P:Prop),
  P \/ True.
Proof.
  intros.
  right.
  apply I.
Qed.

Goal
  forall (P:Prop),
  P /\ False -> False.
Proof.
  intros.
  destruct H as [Hl Hr].
  apply Hr.
Qed.

Definition equiv (P:Prop) (Q:Prop) :=
  (P -> Q) /\ (Q -> P).

Goal
  forall P,
  P <-> P.
Proof.
  intros.
  unfold equiv.
  split.
  all: intros p.
  all: assumption.
Qed.

Theorem helper1:
  forall x y,
  x * y = 0 ->
  x = 0 \/ y = 0.
Proof.
  intros.
  destruct x, y.
  - left. reflexivity.
  - left. reflexivity.
  - right. reflexivity.
  - simpl in H.
    discriminate H.
Qed.

Require Import PeanoNat.

Goal
  forall x y z,
  x * (y * z) = 0 ->
  x * y = 0 \/ z = 0.
Proof.
  intros.
  apply helper1 in H.
  destruct H as [H|H]. { subst. left. reflexivity. }
  apply helper1 in H.
  destruct H as [H|H]. {
    subst. Search (_ * 0 = _). rewrite Nat.mul_0_r. 
    left. reflexivity.
  }
  right.
  assumption.
Qed.
  








