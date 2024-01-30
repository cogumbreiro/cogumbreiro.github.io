Theorem plus_O_n : forall n:nat,
  n = 0 + n.
Proof.
  intros n.
  Print Nat.add.
  (* simpl. *) (* optional *)
  reflexivity.
Qed.

Theorem aux:
  forall n m,
  n = m -> (* A *)
  S n = S m. (* B *)
Proof.
  intros n m H.
  rewrite H.
  reflexivity.
Qed.

(*
Theorem plus_n_O : forall n:nat,
  n = n + 0.
Proof.
  intros n.
  simpl.
  Print Nat.add.
  destruct n.
  { (* n = 0 *)
    simpl.
    reflexivity.
  }
  { (* when n = S n' *)
    simpl.
    apply aux.
    Print Nat.add.
    Admitted.
*)

Theorem plus_n_O : forall n:nat,
  n = n + 0.
Proof.
  intros n.
  simpl.
  induction n.
  { (* P(0) *)
    simpl.
    reflexivity.
  }
  { (* P(n) -> P(n + 1) *)
    Print Nat.add.
    simpl.
    (* style that uses rewrites *)
    rewrite <- IHn.
    reflexivity.
    (* (* style that uses assumptions/theorems *) 
    apply aux.
    apply IHn.
    *)
  }
Qed.

 Theorem mult_0_plus' : forall n m : nat,
   (n + 0) * m = n * m.
 Proof.
   intros n m.
   rewrite <- plus_n_O.
   reflexivity.
   (*
   assert (H: n + 0 = n). {
    rewrite plus_n_O.
    reflexivity.
    (*
    (* proof of previous theorem *)
    induction n.
    { (* P(0) *)
      simpl.
      reflexivity.
    }
    { (* P(n) -> P(n + 1) *)
      simpl.
      rewrite IHn.
      reflexivity.
    }
    *)
   }
   rewrite -> H.
   reflexivity.
   *)
 Qed.


Inductive natprod : Type :=
| pair : nat -> nat -> natprod.

Notation "( x , y )" := (pair x y).

Compute (pair 1 ( 1 + 2)).

Compute (1, 1 + 2).

Definition pair_left (p:natprod) : nat :=
  match p with
  | pair x y => x
  end.

Definition pair_right (p:natprod) : nat :=
  match p with
  | pair x y => y
  end.

Theorem pair_correct:
  forall p,
  pair (pair_left p) (pair_right p) = p.
Proof.
  intros p.
  simpl.
  destruct p as [x y].
  simpl.
  reflexivity.
Qed.










