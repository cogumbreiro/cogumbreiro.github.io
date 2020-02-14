Definition x1 := 10.

Check x1.
Check nat.

Compute x1.
Print x1.


Check 0 = 0.

Compute Nat.eqb 2 2.
Check (Nat.eqb 2 2).
Check 2 = 2.

Lemma ex1: 0 = 0.
Proof.
  reflexivity.
Qed.

Check ex1.
Print ex1.

Print list.

Theorem and_example : 3 + 4 = 7 /\ 2 * 2 = 4.
Proof.
  Print and.
  apply conj.
  - reflexivity.
  - reflexivity.
Qed.

Example and_in_conj :
  forall x y,
  3 + x = y /\ 2 * 2 = x ->
  x = 4 /\ y = 7.
Proof.
  intros.
  Print and.
  destruct H.
  simpl in *.
  apply conj.
  - rewrite H0.
    reflexivity.
  - rewrite <- H0 in H.
    rewrite H.
    reflexivity.
Qed.

Print list.
Print and.

Print or.
(*
Inductive or (A B: Prop) : Prop :=
| or1: A -> B -> or A B
| or2: A -> or A B
| or3: B -> or A B.
*)

Lemma or_example :
  forall n m : nat, n = 0 \/ m = 0 -> n * m = 0.
Proof.
  intros n m Hor.
  destruct Hor as [Heq | Heq1].
  - subst.
    simpl.
    reflexivity.
  - subst.
Admitted.

Lemma or_example2:
  forall x,
  x = 2 ->
  x = 2 \/ x = 1.
Proof.
  intros.
  Print or.
  left.
  assumption.
  (*
  apply or_introl.
  assumption.
  *)
Qed.

(*
Lemma don_do_this:
  0 = 1.
Proof.
Admitted.

Lemma this_is_still_wrong:
  3 = 4.
Proof.
  assert (H:= don_do_this).
  inversion H.
Qed.
*)

Lemma boring:
  True.
Proof.
  Print True.
  apply I.
Qed.


Print boring.


Theorem foo:
  True /\ True.
Proof.
  split.
  - apply I.
  - apply I.
Qed.

Print foo.
(*
Inductive True := I : True.

Inductive False := .
*)
Print False.

Goal False -> 1 = 2.
Proof.
  intros.
  destruct H.
Qed.

Goal not (1 = 2).
Proof.
  unfold not.
  intros.
  inversion H.
Qed.
  


