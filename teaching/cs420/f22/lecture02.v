 Inductive rgb : Type :=
   | red : rgb
   | green : rgb
   | blue : rgb.
   
Inductive color : Type :=
   | black : color
   | white : color
   | primary : rgb -> color.

Definition flip (r:rgb) : rgb :=
  match r with
  | red => green
  | green => blue
  | blue => red
  end.

Compute primary red.
Compute primary green.
Compute flip red.
Compute primary (flip red).
Compute flip (flip red).
Compute primary (flip (flip red)).

Definition color_to_rgb (c:color) : rgb :=
  match c with
  | black => red
  | white => red
  | primary x => x
  end.

Compute color_to_rgb (primary red).
Compute color_to_rgb (primary green).
Compute color_to_rgb (primary blue).
Compute color_to_rgb (primary (flip red)).

Definition f2 (c:color) : rgb :=
  match c with
  | black => red
  | white => red
  | primary red => green
  | primary green => blue
  | primary _ => red
  end.

Compute f2 (primary red).


Inductive vec3 : Type :=
| vector : rgb -> rgb -> rgb -> vec3.

Compute vector red (flip (flip red)) (flip red).

Definition add (v1:vec3) (v2:vec3) : rgb :=
  match v1 with
  | vector red _ _
  | vector _ red _
  | vector _ _ red => red
  | vector green _ _
  | vector _ green _
  | vector _ _ green => green
  | _ => blue
  end.

Inductive peano : Type :=
  | zero : peano
  | succ : peano -> peano.

Compute zero.
Compute succ zero.
Compute succ (succ zero).
Compute succ (succ (succ zero)).

Fixpoint evenb (n:peano) : bool :=
  match n with
  | zero => true
  | succ zero => false
  | succ (succ n') => evenb n'
  end.

Compute evenb zero.
Compute evenb (succ zero).
Compute evenb (succ (succ (zero))).
Compute evenb (succ (succ (succ (zero)))).
(*
Fixpoint bogus (n:peano) : bool :=
  match n with
  | zero => true
  | succ zero => false
  | _ => bogus n
  end.
*)
(*
Inductive nat := S : nat -> nat | O.
*)
Fixpoint plus (n : nat) (m : nat) : nat :=
  match n with
    | O => m
    | S n' => S (plus n' m)
  end.
(*
  plus (S (S 0)) x
= S (plus (S 0) x)
= S (S (plus 0 x))
= S (S x)
*)
Example plus_O_5 : plus 0 5 = 5.
Proof.
  simpl.
  reflexivity.
Qed.

Theorem plus_O_n : forall n : nat, 0 + n = n.
Proof.
  intros g.
  simpl.
  reflexivity.
Qed.

Theorem plus_n_O : forall n : nat, n + 0 = n.
Proof.
  intros n.
  simpl.
  (* Next lecture! *)
Admitted.
