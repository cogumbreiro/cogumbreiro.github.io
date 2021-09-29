
Definition exactly_one (A:Type) (P: A -> Prop) :=
  (exists (x:A), P x /\ forall y, P y -> y = x).

Goal
  forall n, exists z, z + n = n.
Proof.
  intros.
  exists 0.
  reflexivity.
Qed.

(*
Goal
  forall n,
  exactly_one nat (fun z => z + n = n).
*)

Goal
  forall n,
  (exists m, m < n) ->
  n <> 0.
Proof.
  intros.
  destruct H as (z, Hz).
  intros N.
  subst.
  inversion Hz.
Qed.
  
(* Simple tests *)
Goal 1 <= 1. Proof.
  apply le_n.
Qed.

Goal 2 <= 10. Proof.
  repeat constructor.
Qed.


(* More interesting properties *)
Theorem le_is_reflexive: forall x,
  x <= x.
Proof.
  intros.
  constructor.
Qed. (* Proved in class *)

Theorem zero_is_smallest:
  forall y,
  0 <= y.
Proof.
  induction y.
  - constructor.
  - constructor.
    assumption.
Qed.

Lemma le_S_inv:
  forall x y,
  S x <= S y ->
  x <= y.
Proof.
  intros.
  induction y.
  - inversion H.
    + constructor.
    + subst.
      inversion H1.
  - inversion H.
    + subst.
      constructor.
    + subst.
      apply IHy in H1.
      constructor.
      assumption.
Qed.

Theorem le_is_anti_symmetric: forall x y,
  x <= y ->
  y <= x ->
  x = y.
Proof.
  (*
    This exercise was difficult to prove in class
    because we need to be careful on keeping variable y
    general when the induction principle is applied.
    
    Here's an example and further explanation of the problem:
    https://softwarefoundations.cis.upenn.edu/lf-current/Tactics.html#lab150
    
    This is something that will be discussed in class if
    need be --- but is not needed at this point.
   *)
  induction x.
  - intros.
    inversion H0.
    subst.
    reflexivity.
  - intros.
    destruct y. {
      inversion H.
    }
    (* When we reach the induction step, notice
       that IHx is expecting 'x', which hints that we need
       to change our assumptions so that we have 'x' there,
       not 'S x'.

       We therefore proved an auxiliary theorem to remove
       the successor on both sides of the inequality.

       It is important to remove both successors from both sides,
       and not just the successor on the left-hand side, as that
       would make the inequalities uneven (x <= S y on one hand, and y <= on
       the other, which aren't useful to IHx).
    *)
    apply le_S_inv in H.
    apply le_S_inv in H0.
    apply IHx in H.
    + rewrite H.
      reflexivity.
    + assumption.
Qed. (* Proved in class *)

Goal
  forall P : Prop, P.
Proof.
  intros.
Abort.

Goal forall (P:Prop)
  (H : ~ ~ P)
(H0 : P \/ ~ P),
P.
Proof.
  intros.
  destruct H0. {
    apply H0. (* assumption. *)
  }
  unfold not in H.
  unfold not in H0.
  apply H in H0.
  destruct H0. (* contradiction. *)
Qed.


Goal

  forall A B:Type, forall (f g: A -> B), f = g -> forall x, f x = g x.
Proof.
  intros.
  rewrite H.
  reflexivity.
Qed.

Goal
  forall n, n <> S n.
Proof.
  intros.
  destruct n. {
    unfold not.
    intros N.
    inversion N.
  }
  unfold not.
  intros.
  inversion H.
  (* Case analysis is not enough! *)
Abort.

Goal
  forall n m,
  S (n + m) = n + S m.
Proof.
  intros.
  Fail reflexivity.
Abort.

Theorem le_is_transitive: forall x y z,
  x <= y ->
  y <= z ->
  x <= z.
Proof. Admitted.














