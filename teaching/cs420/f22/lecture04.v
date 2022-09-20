
Theorem plus_n_O : forall n:nat,
  n = n + 0.
Proof.
  intros x.
  (*
      P(x) := x = x + 0
   
   - P(0) :=
      --------- (1/2)
      0 = 0 + 0
   - P(x) := x = x + 0
     --------- (2/2)
     P(S x) := S x = S x + 0
   --------
   forall x. P(x)
   *)
  Print Nat.add.
  induction x. {
    Print Nat.add.
    simpl.
    reflexivity.
  }
  Print Nat.add.
  simpl.
  rewrite <- IHx.
  reflexivity.
Qed.

Lemma zero_in_middle1:
  forall n m, n + 0 + m = n + m.
Proof.
  intros.
  rewrite <- plus_n_O.
  reflexivity.
Qed.

Lemma zero_in_middle2:
  forall n m, n + 0 + m = n + m.
Proof.
  intros.
  assert (Hx: n + 0 = n). {
    rewrite <- plus_n_O.
    reflexivity.
  }
  rewrite Hx.
  reflexivity.
Qed.

Lemma add_assoc:
  forall x y z,
  (x + y) + z = x + (y + z).
Proof.
  intros.
  induction x.
  - simpl.
    reflexivity.
  - simpl.
    rewrite IHx.
    reflexivity.
Qed.

Lemma zero_in_middle4:
  forall n m, n + 0 + m = n + m.
Proof.
  intros.
  rewrite add_assoc.
  simpl.
  reflexivity.
Qed.

Lemma zero_in_middle5:
  forall n m, n + 0 + m = n + m.
Proof.
  intros.
  
  (*
  assert ( Hy := Hx 0).
  assert ( Hz := Hy m).
  rewrite Hz.
  *)
  (*  
  assert ( Hx := add_assoc n 0 m).
  rewrite Hx.
  *)
  (* rewrite (add_assoc n 0 m). *)
  rewrite add_assoc with (x:=n) (y:=0) (z:=m).
  simpl.
  reflexivity.
Qed.

Lemma zero_in_middle3:
  forall n m, n + 0 + m = n + m.
Proof.
  intros.
  simpl.
  Print Nat.add.
  induction n. {
    simpl.
    reflexivity.
  }
  Print Nat.add.
  (* S ((n + 0) + m)) = S (n + m) *)
  simpl.
  rewrite <- IHn.
  reflexivity.
Qed.

Inductive natprod :=
  | pair : nat -> nat -> natprod.

Definition fst (p:natprod) :=
  match p with
  | pair l r => l
  end.

Definition snd (p:natprod) :=
  match p with
  | pair _ r => r
  end.

Lemma fst_correct:
  forall x y,
  fst (pair x y) = x.
Proof.
  intros.
  simpl.
  reflexivity.
Qed.

Lemma fst_correct_2:
  forall p,
  p = pair (fst p) (snd p).
Proof.
  intros.
  destruct p as [x y].
  simpl.
  reflexivity.
Qed.

Inductive natlist : Type :=
| Nil: natlist
| Cons: nat -> natlist -> natlist.
 Fixpoint app (l1 l2 : natlist) : natlist :=
  match l1 with
  | Nil => l2
  | Cons h t => Cons h (app t l2)
  end.

Compute Nil.
Compute (Cons 1 Nil).
Compute (Cons (10 + 1) (Cons 2 Nil)).
(*
Require Import Coq.Lists.List.
Import ListNotations.
Compute [1; 2; 3].
*)

Print Nat.add.

Theorem app_n_nil :
  forall n:natlist,
  n = app n Nil.
Proof.
  intros x.
  (* P(x) := x = app x Nil *)
  induction x. {
    (* P(Nil) := Nil = app Nil Nil *)
    simpl.
    reflexivity.
  }
  (* P(x) -> forall n, P(Cons n x)
    IHx: x = app x Nil
    n: nat
    -----------------
    Cons n x = app (Cons n x) Nil
    
   *)
  simpl.
  rewrite <- IHx.
  reflexivity.
Qed.

Print nat_ind.
Print nat.
Print natlist_ind.
