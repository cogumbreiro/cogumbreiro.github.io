Theorem plus_id_example : forall n m:nat,
  n = m ->
  n + n = m + m.
Proof.
  intros n m.
  intros n_m_eq.
  rewrite -> n_m_eq.
  reflexivity.
Qed.

Theorem plus_id_exercise : forall n m o : nat,
  n = m -> m = o -> n + m = m + o.
Proof.
  intros n m o.
  intros n_m_eq.
  intros m_o_eq.
  rewrite <- m_o_eq.
  rewrite <- n_m_eq.
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

Theorem try1:
   beq_nat 3 3 = true.
Proof.
   simpl.
   reflexivity.
Qed.

Theorem plus_1_neq_0_firsttry : forall n : nat,
  beq_nat (plus n 1) O = false.
Proof.
  intros n.
  simpl.
  Print Nat.add.
  destruct n as [ (* no var declared *) | x ].
  * (* n = O *)
    simpl.
    reflexivity.
  * (* n = S x *)
    simpl.
    reflexivity.
Qed.
Print nat.
Check nat_ind.

Check bool_ind.

Theorem plus_n_O : forall n:nat,
  n = n + 0.
Proof.
  intros n.
  simpl.
  Print Nat.add.
  induction n as [ | n' IH].
  - simpl.
    reflexivity.
  - simpl.
    rewrite <- IH.
    reflexivity.
Qed.
