Goal
  forall n, exists z, z + n = n.
Proof.
  intros.
  exists 0.
  reflexivity.
Qed.

Goal 0 = 1 -> 1 = 3.
Proof.
  intros.
  inversion H.
Qed.

Goal forall P:Prop,
  P ->
  ~ P ->
  False.
Proof.
  unfold not.
  intros.
  apply H0.
  assumption.
Qed.

Goal
  forall n, (exists m, m < n) -> n <> 0.
Proof.
  intros.
  (* unfold not. *)
  intros abs.
  destruct H as (x, H).
  rewrite abs in H.
  Print le.
  inversion H.
Qed.

Goal
  exists X:Type, exists v:X, v = v.
Proof.
  exists nat.
  exists 0.
  reflexivity.
Qed.

Goal
  exists X:Type, exists v:X, v = v.
Proof.
  exists True.
  Print True.
  exists I.
  reflexivity.
Qed.

Goal
  True ->
  ~ True ->
  False.
Proof.
  intros.
  contradiction.
Qed.

Goal
  1 = 0 ->
  1 <> 0 ->
  False.
Proof.
  intros.
  contradiction.
Qed.

Goal
  1 = 0 ->
  ~ (1 = 0) ->
  False.
Proof.
  intros.
  contradiction.
Qed.

Goal
  true = false -> False.
Proof.
  intros.
  Print bool.
  inversion H.
Qed.

Print Nat.add.

Fixpoint add (n m : nat) : nat :=
  match n with
  | 0 => m
  | S p => S (add p m)
  end.

Inductive foo : Type :=
  | factory: foo -> foo.
Print False.
Compute factory.

Goal
  forall (f:foo), False.
Proof.
  intros.
  induction f.
  assumption.
Qed.

Definition Silly := forall (X : Type), forall (Y : Type), forall (x : X), x = x.

Check Silly.

Compute Nat.eqb.
Check Nat.eqb.
Check Nat.eqb 56.
Check (Nat.eqb 56) 10.
Check Nat.eqb 56 10.

Goal
  forall n, n <> S n.
Proof.
  induction n.
  (* TODO: revisit this *)
  Admitted.
(*
  - intros N.
    inversion N.
  - simpl.
    intros N.
    inversion N.
    rewrite <- H0 in N.
Qed.
*)
(*Compute (mk_foo (mk_foo mk_foo)). *)
(*
Goal
  forall P:Prop,
  ~ ~ P ->
  P.
Proof.
  unfold not.
  intros.
  
Qed.
  *)
  
Goal
forall P:Prop,
  P ->
  ~ ~ P.
Proof.
  intros.
  intros N.
  contradiction.
Qed.
