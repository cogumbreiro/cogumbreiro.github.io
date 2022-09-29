Goal
  forall
  (a b c: nat)
  (P Q: Prop)
  (H: P -> a = b)
  (H0: Q \/ P)
  (H1: b = c),
  a = c.
Proof.
  intros.
Abort.

Goal
  forall
  (a b c: nat)
  (P Q: Prop),
  (P -> a = b) ->
  Q \/ P ->
  b = c ->
  a = c.
Proof.
  intros.
Abort.

Goal
  exists n, n * 5 = n.
Proof.
  exists 0.
  reflexivity.
Qed.
Require Import Coq.Lists.List.

Goal
  forall n,
  (exists m, m < n) ->
  n <> 0.
Proof.
  intros.
  destruct H as [x x_lt_n].
Abort.


Goal
  forall n m (E:Nat.eqb n m = true),
  m = n.
Proof.
  intros.
  Fail apply E.
Abort.

Goal
 forall n, S n <> n.
Proof.
  intros.
  unfold not.
  intros.
  induction n.
  - inversion H.
  - inversion H.
    contradiction.
    (*
    apply IHn.
    apply H1.
    *)
Qed.

Goal
  forall n,
  5 + n <= 6 + n.
Proof.
  intros.
  simpl.
  apply le_S.
  apply le_n.
Qed.

Goal
  forall n,
  n + 5 <= n + 6.
Proof.
  intros.
  simpl.
Abort.

Goal
  forall (P:Prop),
  ~ ~ P ->
  P \/ ~ P ->
  P.
Proof.
  intros.
  destruct H0.
  - assumption.
  - unfold not in *.
    apply H in H0.
    inversion H0.
Qed.

Goal
  forall P Q : Prop,
  (P -> Q) ->
  (P \/ ~ P) ->
  ~ P \/ Q.
Proof.
  intros.
  destruct H0 as [Ha | Hb].
  - right.
    apply H.
    assumption.
  - left.
    assumption.
Qed.

Goal forall P Q : Prop,
  (P -> Q) ->
  ~ Q ->
  P ->
  False.
Proof.
  intros.
  unfold not in H0.
  apply H in H1.
  contradiction.
  (*
  unfold not in H0.
  apply H in H1.
  apply H0 in H1.
  assumption.
  *)  
  (*
  apply H0.
  apply H.
  assumption.
  *)
Qed.







