Lemma zero_in_middle_v0:
  forall n m, n + 0 + m = n + m.
Proof.
  intros.
  induction n.
  - simpl.
    reflexivity.
  - simpl.
    rewrite IHn.
    reflexivity.
Qed. (* Qed. *)

Lemma zero_in_middle_v1:
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

Lemma n_plus_zero_eq_n:
  forall n,
  n + 0 = n.
Proof.
  intros.
  rewrite <- plus_n_O.
  reflexivity.
Qed.

Lemma zero_in_middle_v2:
  forall n m, n + 0 + m = n + m.
Proof.
  intros.
  rewrite n_plus_zero_eq_n.
  reflexivity.
Qed.

Lemma add_assoc_v1:
  forall n m o,
  (n + m) + o = n + (m + o).
Proof.
  intros.
  induction m. {
    simpl.
    rewrite zero_in_middle_v0.
    reflexivity.
  }
  simpl.
  (*
      ________ (1/2)
      P(0) := 0 + S b = S (0 + b)




      H: P(a) := a + S b = S (a + b)
      _________ (2/2)
      P (S a) := (S a) + S b = S ((S a) + b)
  *)
  assert (forall a b, a + S b = S (a + b)). {
    intros.
    induction a.
    - admit.
    - admit. 
  }
  clear H.
  (*
      0 + m + o = 0 + (m + o)
      ________ (1/2)
      P(0) := 0 + S m = S (0 + m)





      H: P(n) := n + m + o = n + (m + o) ->
              n + S m = S (n + m)
      _________ (2/2)
      P (S n) := (S n) + m + o = (S n) + (m + o) ->
              (S n) + S m = S (S n + m)
  *) 
  assert (n + S m = S (n + m)). {
    induction n.
    - admit.
    - admit.
  }
  (* you should prove first that: a + S b = S (a + b) *)
Admitted.


Lemma add_assoc_v2:
  forall n m o,
  (n + m) + o = n + (m + o).
Proof.
  intros.
  induction n.
  - simpl.
    reflexivity.
  - simpl.
    rewrite IHn.
    reflexivity.
Qed.
  
  
Lemma zero_in_middle_v3:
  forall n m, n + 0 + m = n + m.
Proof.
  intros.
  assert (Ha := add_assoc_v2).
  assert (Ha1 := Ha n).
  assert (Ha2 := Ha1 0).
  assert (Ha3 := Ha2 m).
  (* rewrite Ha3. *)
  rewrite (add_assoc_v2 n 0 m).
  (* rewrite add_assoc_v2. *)
  simpl.
  reflexivity.
Qed.

Goal
  forall (a b c:nat),
  a = b ->
  (a = b -> b = c) ->
  b = c.
Proof.
  intros.
  assert (Ha := H0 H).
  rewrite Ha.
  reflexivity.
Qed.

(*
Inductive natprod :=
 | one: nat -> nat -> natprod.

Compute one 1 2.

Definition get_left (p:natprod) :=
  match p with
  | one x y => x
  end.

Compute (get_left (one 1 2)).
*)

Inductive natprod : Type :=
| pair : nat -> nat -> natprod.
Notation "( x , y )" := (pair x y).

Compute (1, 2).

Definition fst (p : natprod) : nat :=
  match p with
  | pair x y => x
  end.
Definition snd (p : natprod) : nat :=
  match p with
  | (x, y) => y (* using notations in a pattern to be matched *)
   end.

Theorem surjective_pairing : forall (p : natprod),
  p = (fst p, snd p).
Proof.
  intros p.
  destruct p.
  simpl.
  reflexivity.
Qed.

  
  
  
  
  
  
  
  
  
  
  
  
  






