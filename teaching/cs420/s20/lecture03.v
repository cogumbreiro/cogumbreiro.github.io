

Theorem plus_id_example : forall n m:nat,
  n = m ->
  n + n = m + m.
Proof.
  intros n.
  intros m.
  intros Heq.
  simpl. (* does not help *)
  Print Nat.add. (* because it gets stuck in the match *)
  rewrite Heq.
  reflexivity.
Qed.

Theorem plus_id_exercise : forall n m o : nat,
  n = m -> m = o -> n + m = m + o.
Proof.
  intros.
  rewrite H.
  rewrite H0.
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

Goal
  beq_nat 1 0 = false.
Proof.
  simpl.
  reflexivity.
Qed.


Theorem plus_1_neq_0_firsttry : forall n : nat,
  beq_nat (n + 1) O = false.
Proof.
  intros n.
  simpl. (* simple fails, because beq_nat is stuck *)
  (* why is beq_nat stuck? because of Nat.add *)
  Print Nat.add.
  Print nat.
  destruct n.
  - reflexivity.
  - 
    Print Nat.add.
    (* Step 1:
      beq_nat (S (n + 1)) 0
      *)
    simpl.
    reflexivity.
Qed.

Theorem plus_n_O : forall n:nat,
  n = n + 0.
Proof.
  intros.
  simpl.
  Print Nat.add.
  destruct n.
  - (* n = 0 *) reflexivity.
  - (* n = S n' *) simpl.
    destruct n.
    + reflexivity.
    + simpl.
Abort.

Theorem plus_n_O : forall n:nat,
  n = n + 0.
Proof.
  intros.
  simpl.
  Print Nat.add.
  induction n as [ | n IH ]. (* as pattern is optional *)
  - (* n = 0 *)
    reflexivity.
  - simpl.
    rewrite <- IH.
    reflexivity.
Qed.

Print nat.

(* Deriving the induction principle. 

Inductive nat :=  0 : nat | S : nat -> nat

---
Show (1) that: P(0) 

0 : nat

P(0): 0 = 0 + 0

---
Show (2) that:

if P(n), then P(S n) hold.
n = n + 0 -> S n = (S n) + 0

S : nat -> nat

forall n, P n -> P (S n)

---
forall n, P(n)

let P(n) = n = n + 0 in
forall n : nat, P(n)

*)

 Theorem mult_0_plus' : forall n m : nat,
   (0 + n) * m = n * m.
 Proof.
   intros n m.
   assert (Hx: 0 + n = n). {
     (* here we create Hx. *)
     reflexivity.
   }
   (* creating local equations *)
   remember (2 + 3) as n3.
   (* here Hx is defined *)
   rewrite Hx.
   reflexivity.
Qed.
