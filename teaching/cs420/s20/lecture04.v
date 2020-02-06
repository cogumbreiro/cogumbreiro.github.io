Theorem zero_in_middle_1:
  forall n m, n + 0 + m = n + m.
Proof.
  intros.
  assert (H: n + 0 = n). {
    (* plus_n_O *)
    rewrite <- plus_n_O.
    reflexivity.
  }
  rewrite H.
  reflexivity.
Qed.

Theorem zero_in_middle_2:
  forall n m, (n + 0) + m = n + m.
Proof.
  intros.
  rename n into x.
  rewrite <- plus_n_O.
  reflexivity.
Qed.

Theorem zero_in_middle_3:
  forall n m, n + (0 + m) = n + m.
Proof.
  intros.
  simpl.
  reflexivity.
Qed.

Lemma add_assoc:
  forall n m o,
  (n + m) + o = n + (m + o).
Proof.
  Print Nat.add.
  intros.
  (*
      P(n) := n + m + o = n + (m + o)

    - P(0) := 0 + m + o = 0 + (m + o)

    - P(n) -> P(S n)
  
      IHn: n + m + o = n + (m + o)
      ---------------------------
      (S n) + m + o = (S n) + (m + o)
   *)
  induction n. {
    (* P(0) *)
    simpl.
    reflexivity.
  }
  simpl. (* enforces evaluation, which may be needed because n changed. *)
  rewrite -> IHn.
  reflexivity.
Qed.


Theorem zero_in_middle_4:
  forall n m, (n + 0) + m = n + m.
Proof.
  intros.
  (*
  assert (Hx := add_assoc).
  assert (Hy := Hx 99).
  assert (Hz := Hy 10).
  assert (Hw := Hz 70).
  *)
  assert (Ha := add_assoc n 0 m).
  (* this also works:
    simpl in Ha.
    rewrite Ha.
    reflexivity.
  *)
  rewrite Ha.
  simpl.
  reflexivity.
Qed.

Theorem plus_id_example : forall n m:nat,
  n = m ->
  n + n = m + m.
Proof.
  intros n.
  intros m.
  intros.
  rewrite H.
  reflexivity.
Qed.

Theorem exercise3:
  forall n,
  n = 0 ->
  n + n = 0 + 0.
Proof.
  intros.
  assert (Ha := plus_id_example n 0).
  assert (Hb := Ha H). 
  rewrite Hb.
  reflexivity.
Qed.

Inductive natural :=
| zero: natural
| successor: natural -> natural.

Inductive rgb := R | G | B.

Inductive color :=
  | black: color
  | white: color
  | primary: rgb -> color.
   

Print nat.

Inductive natprod :=
  | pair: nat -> nat -> natprod.


Notation "( x , y )" := (pair x y).

Compute (0, 10).


Inductive lnat :=
| empty: lnat
| lpair: nat -> lnat -> lnat.

Inductive lnat2 :=
| empty2 : lnat2
| one: nat -> lnat2
| concat: lnat2 -> lnat2 -> lnat2.

Compute empty.
Compute (lpair 0 empty).
Compute (lpair 10 (lpair 0 empty)).

Compute empty2.
Compute (one 0).
Compute (concat (one 0) (one 10)).


Definition fst (p : natprod) : nat :=
  match p with
  | pair x y => x
  end.

Definition snd (p : natprod) : nat :=
  match p with
  | (x, y) => y (* using notations in a pattern to be matched *)
   end.

Theorem fst_spec:
  forall x y,
  fst (x, y) = x.
Proof.
  intros.
  simpl.
  reflexivity.
Qed.


Theorem snd_spec:
  forall x y,
  snd ( x , y ) = y.
Proof.
  intros.
  simpl.
  reflexivity.
Qed.

Theorem surjective_pairing :
  forall (p : natprod),
  p = (fst p, snd p).
Proof.
  intros p.
  (*simpl.*)
  destruct p as (n, m).
  (*simpl.*)
  reflexivity.
Qed.
