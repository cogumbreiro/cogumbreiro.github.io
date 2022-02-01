Inductive nat2 :=
| xS1 : nat2 -> nat2
| xS2 : nat2 -> nat2 -> nat2
| zero: nat2.

Check nat2_ind.

(*

 P(?) := 

      ?, n2 : nat2
      ______________________________________(1/1)
      ? = n2



P(n1) -> P(xS1 n1)


P(n1) = (
      n1, n2 : nat2
      ______________________________________(1/1)
      n1 = n2
) -> P(xS1 n1) = (

      n1, n2 : nat2
      ______________________________________(1/1)
      xS1 n1 = n2
)
======
P(n1) -> P(xS1 n1) :=

      IHn1: n1 = n2
      n1, n2 : nat2
      ______________________________________(1/1)
      xS1 n1 = n2



P(xS2 ? ?)


P(zero)

*)


Theorem plus_n_O : forall n1 n2:nat2,
  n1 = n2. 
Proof.
  intros n1 n2.
  induction n1.
  - admit.
  - admit.
  - 
Abort.

Theorem plus_n_O : forall n:nat,
  n = n + 0.
Proof.
  intros n.
  Print Nat.add.
  induction n.
  + simpl.
    reflexivity.
  + simpl.
    rewrite <- IHn.
    reflexivity.
Qed.


 Theorem mult_0_plus' : forall n m : nat,
   (0 + n) * m = n * m.
 Proof.
   intros n m.
   Print Nat.mul.
   Print Nat.add.
  assert (eq1: 0 + n = n). {
    simpl.
    reflexivity.
  }
  rewrite eq1.
  reflexivity.
Qed.










Print nat.

