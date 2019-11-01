
Theorem eq_trans : forall (T:Type) (a b c : T),
  a = b -> b = c -> a = c.
Proof.
  intros T x y z eq1 eq2.
  (* rewrite <- eq1 in eq2. *)
  rewrite -> eq1.
  apply eq2.
  (* Alternative solution:
  rewrite -> eq2.
  reflexivity.
  *)
  (* Alternative solution:  
  assumption. *)
  
Qed.

Theorem eq_trans_2 : forall (T:Type) (x y z: T),
  (x = y -> y = z -> x = z) -> (* eq1 *)
  x = y ->                     (* eq2 *)
  y = z ->                     (* eq3 *)
  x = z.
Proof.
  intros T x y z eq1 Hx eq3.
  (* Version 2:
  rewrite eq1.
  - reflexivity.
  - assumption.
  - assumption.
  *)
  (* Version 1: *)
  apply eq1.
  - apply Hx.
  - apply eq3.
Qed.


Theorem eq_trans_nat : forall (x y z: nat),
  x = 1 ->
  x = y ->
  y = z ->
  z = 1.
Proof.
  intros x y z eq1 eq2 eq3.
  assert (eq4: x = z). {
    (* assert (X := eq_trans nat x y z eq2 eq3). *)
    apply eq_trans with (b:=y).
    - assumption.
    - assumption.
  }
  rewrite <- eq4.
  assumption.
Qed.

Theorem eq_trans_nat' : forall (x y z: nat),
  x = 1 ->
  x = y ->
  y = z ->
  1 = z.
Proof.
  intros x y z eq1 eq2 eq3.
  assert (eq4: x = z). {
    apply eq_trans with (b:=y).
    - assumption.
    - assumption.
  }
  rewrite <- eq4.
  symmetry.
  (* symmetry in eq1. *)
  assumption.
Qed.

(* --------------------------------- *)

(* 
Inductive nat : Type :=
  | O : nat
  | S : nat -> nat.
*)

Theorem S_injective : forall (n m : nat),
  S n = S m ->
  n = m.
Proof.
  intros n m eq1.
  inversion eq1.
  reflexivity.
Qed.

Fixpoint beq_nat (n m : nat) : bool :=
  match n with
  | O => match m with
         | O => true
         | S m' => false
         end
  | S n' => match m with
            | O => false
            | S m' => beq_nat n' m'
            end
  end.

Theorem beq_nat_0_l : forall n,
   beq_nat 0 n = true -> n = 0.
Proof.
  intros n eq1.
  simpl in eq1.
  destruct n.
  - reflexivity.
  - inversion eq1.
Qed.

Lemma zero_not_one:
  0 <> 1.
Proof.
  unfold not.
  intros h1.
  inversion h1.
Qed.

Lemma absorb_exists:
  forall y,
  exists x:nat, x + y = y.
Proof.
  intros y.
  exists 0.
  reflexivity.
Qed.

Theorem exists_in_assume : forall n,
  (exists m, n = 4 + m) ->
  (exists o, n = 2 + o).
Proof.
  intros.
  destruct H as (m, H).
  rewrite H.
  (* Search(0 + _  = _ ). *)
  exists (m + 2).
  simpl.
  (* 
  exists (2 + m).
  reflexivity.
  *)
Qed.
