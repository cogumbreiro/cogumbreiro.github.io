(*
Inductive existential (T:Type) (P:T -> Prop) : Prop :=
  | make_existential:
    forall x,
    P x ->
    existential T P.
    
    *)
    
Goal exists x, x = 0.
Proof.
  exists 0.
  reflexivity.
Qed.

Definition IsEven x := exists y, x = y + y. 

Goal
  forall x,
  IsEven x ->
  x <> 1.
Proof.
  unfold IsEven.
  intros x x_is_even.
  unfold not.
  intros H.
  subst.
  destruct x_is_even as (y, x_is_even).
  destruct y. {
    discriminate x_is_even.
  }
  simpl in x_is_even.
  inversion x_is_even.
  destruct y. {
    inversion H0.
  }
  simpl in H0.
  inversion H0.
Qed.

Fixpoint up_to (n:nat) (P:nat -> Prop) : Prop :=
  match n with
  | 0 => True
  | S n => P n /\ up_to n P
  end.

Compute up_to 3 (fun n => n = 0).
(*
Lemma proof_of_1:
  up_to 1 (fun x => exists y, y + 3 = x).
Proof.
  simpl.
  split. { exists 3. reflexivity. }
  apply I.
Qed.

Lemma proof_of_2:
  up_to 2 (fun x => exists y, y = x + 3).
Proof.
  simpl.
  split. { exists 4. reflexivity. }
  apply proof_of_1.
Qed.

Goal
  up_to 3 (fun x => exists y, y = x + 3).
Proof.
  simpl.
  split. { exists 3. reflexivity. }
  apply I.
Qed.

*)
Fixpoint replicate (P:Prop) (n:nat) :=
  match n with
  | 0 => True
  | S m => P /\ replicate P m
  end.

Compute replicate (1 = 0) 3.
Require Import Coq.Classes.RelationClasses .

Goal forall P,
replicate P 0 <-> True. 
Proof.
  simpl.
  intros.
  reflexivity.
Qed.


Lemma part1: forall P n,
  P -> replicate P (S n).
Proof.
  intros.
  simpl.
  induction n. {
    split.
    - assumption.
    - apply I.
  }
  simpl.
  split. { assumption. }
  assumption.
Qed.

Lemma part2: forall P n,
  replicate P (S n) -> P.
Proof.
  intros.
  simpl in H.
  destruct H as [proof_of_P proof_of_r].
  assumption.
Qed.

Goal forall P n,
  P <-> replicate P (S n).
Proof.
  intros.
  split.
  - apply part1.
  - apply part2.
Qed.

Require Import Coq.Lists.List.
Import ListNotations.

Goal
  In 3 [1; 2; 3].
Proof.
  simpl.
  right.
  right.
  left.
  reflexivity.
Qed.


Goal
  forall (T:Type) (x:T) (l: list T),
  In x l ->
  l <> [].
Proof.
  intros.
  intros N.
  subst.
  simpl in H.
  assumption.
Qed.

Goal
  forall (T:Type) (x:T) (l1 l2: list T),
  In x (l1 ++ l2) ->
  In x l1 \/ In x l2.
Proof.
  Print app.
  intros.
  induction l1.
  - simpl in H.
    right.
    assumption.
  - simpl in H.
    destruct H as [H | H]. {
      subst.
      simpl.
      left.
      left.
      reflexivity.
    }
    apply IHl1 in H.
    clear IHl1.
    destruct H.
    + left.
      simpl.
      right.
      assumption.
    + right.
      assumption.
Qed.

Inductive Foo : Prop :=
  | A : Foo
  | B : Foo.

Goal
  Foo <-> True.
Proof.
  split.
  all: intros H.
  - apply I.
  - apply B.
Qed.

Goal
  1 = 1 /\ 2 = 2.
Proof.
  Print and.
  apply conj.
  - reflexivity.
  - reflexivity.
Qed.

Inductive Bar : nat -> Prop :=
| C : Bar 1
| D :
  forall n,
  n + 2 = 3 ->
  Bar n.

Import PeanoNat.

Goal
  forall n,
  Bar n ->
  n = 1 \/ n = 2.
Proof.
  intros.
  destruct H.
  - left. reflexivity.
  - destruct n. { inversion H. }
    simpl in H.
    inversion H.
    assert (n = 0) . {
        Search (_ + _ = _ + _).
        rewrite Nat.add_comm in H1.
        simpl in H1.
        inversion H1.
        reflexivity.
    }
    subst.
    left.
    reflexivity.
Qed.

Inductive In {A:Type} : A -> list A -> Prop :=  

| in_eq:
    forall x l,
    In x (x::l)
| in_cons:
    forall x y l,
    In x l ->
    In x (y::l).
    
Goal
  In 2 [1; 2; 3].
Proof.
  apply in_cons.
  apply in_eq.
Qed.

Goal
  forall (T:Type) (x:T) l,
  In x l ->
  l <> [].
Proof.
  intros.
  intros N.
  subst.
  inversion H.
Qed.





