Definition z : nat := 5.



Theorem add_n_0 : forall x, x + 0 = x.
Proof.
Admitted.

Theorem g' :
  10 + 0 = 10.
Proof.
  apply add_n_0.
Qed.

Definition g : 10 + 0 = 10 := add_n_0 10.


Check Nat.eqb.

Theorem is_correct:
  Nat.eqb 2 3 = false.
Proof. reflexivity. Qed.


Inductive prod (T1 T2:Type) :=
  | pair : T1 -> T2 -> prod T1 T2.

Inductive twoproofs (P Q:Prop) :=
  | proof_pair : P -> Q -> twoproofs P Q.

Goal
  twoproofs (forall (x:nat), x = x) (1 = 1).
Proof.
  apply proof_pair.
  - intros. reflexivity.
  - reflexivity.
Qed.

Goal forall (P Q:Prop),
  twoproofs P Q ->
  P.
Proof.
  intros.
  destruct H.
  apply p.
Qed.

Example and_example : 3 + 4 = 7 /\ 2 * 2 = 4.
Proof.
  apply conj.
  - reflexivity.
  - reflexivity.
Qed.

Inductive l_or (P Q:Prop) : Prop :=
| is_left: P -> l_or P Q
| is_right: Q -> l_or P Q.

Goal
  l_or (1 = 10) (0 = 0).
Proof.
  apply is_right.
  reflexivity.
Qed.

Goal 
  l_or (1 = 10) (l_or (3 + 4 = 7) (2 * 2 = 4)).
Proof.
  apply is_right.
  apply is_left.
  reflexivity.
Qed.

Lemma or_example :
  forall n m : nat, n = 0 \/ m = 0 -> n * m = 0.
Proof.
  intros n m Hor.
  destruct Hor as [l | r].
  - rewrite l. reflexivity.
  - rewrite r.
Admitted.

Lemma or_example2 :
  forall n m : nat, n = 0 \/ m = 0 \/ n = m -> n * m = 0.
Proof.
  intros.
  destruct H as [ p1 | [ p2 | p3 ]].
  - 
Admitted.

Inductive Truth : Prop :=
  | proof_of_truth: Truth.
  
Goal
  Truth.
Proof.
  apply proof_of_truth.
Qed.

Inductive Falsehood : Prop :=
  | bogus : 0 = 1 -> Falsehood.

Goal
  Falsehood -> 10 = 0.
Proof.
  intros.
  destruct H.
  inversion H.
Qed.

Goal
  Falsehood -> 10 = 10.
Proof.
  intros.
  destruct H.
  inversion H.
Qed.

(* Inductive False : Prop :=. *)


Goal
  False -> 0 = 1.
Proof.
  intros.
  destruct H.
Qed.

Definition neg P := P -> False.

Goal
  neg (0 = 1).
Proof.
  unfold neg.
  intros.
  inversion H.
Qed.





