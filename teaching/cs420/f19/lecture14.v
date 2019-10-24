Inductive day : Type :=
  | monday
  | tuesday
  | wednesday
  | thursday
  | friday
  | saturday
  | sunday.

 
Inductive suits := clubs
                  | hearts
                  | spades
                  | diamonds.
                  
Compute hearts.

Compute match wednesday with
  | monday => tuesday
  | tuesday => wednesday
  | wednesday => thursday
  | thursday => friday
  | friday => monday
  | saturday => monday
  | sunday => monday
  end.

Definition X := monday.
 
Compute X. 

Definition next_weekday d :=
  match d with
  | monday => tuesday
  | tuesday => wednesday
  | wednesday => thursday
  | thursday => friday
  | friday => monday
  | saturday => monday
  | sunday => monday
  end.

Definition f (x:day) (y:day) := X.

Compute (next_weekday friday).

Example test_next_weekday:
  next_weekday (next_weekday saturday) = tuesday.
Proof.
  simpl.       (* simplify left-hand side *)
  reflexivity. (* use reflexivity since we have tuesday = tuesday *)
Qed.

Check (next_weekday friday).

Inductive rgb : Type :=
   | red : rgb
   | green : rgb
   | blue : rgb.

 Inductive color : Type :=
   | black : color
   | white : color
   | primary : rgb -> color.

Compute black.
Compute (primary red).

 Inductive pair_rgb : Type :=
   | build_pair : rgb -> rgb -> pair_rgb.
   
Compute (build_pair red green).

 Definition monochrome (c : color) : bool :=
   match c with
   | black => true
   | white => true
   | primary _ => false
   end.
   
Compute monochrome black.
   
Compute monochrome (primary red).

Compute monochrome (primary blue).
(*
Inductive nat : Type :=
  | O : nat
  | S : nat -> nat.
  *) 
Compute (S (S (S O))).

Fixpoint evenb (n:nat) : bool :=
  match n with
  | O => true
  | S O => false
  | S (S n') => evenb n'
  end.

Compute (evenb 5).
Compute (evenb 4).
(*
Example plus_O_4 : 0 + 5 = 4.
Proof.
  
Qed.
  *) 

Fixpoint plus (n : nat) (m : nat) : nat :=
  match n with
    | 0 => m
    (* S n' + m *)
    | S n' => S (plus n' m)
    (* (1 + n) + m = 1 + (n + m) *)
  end.

Print plus.

Example plus_O_5 : 0 + 5 = 5.
Proof.
  (* Let us simplify the goal *)
  simpl.
  reflexivity.
Qed.

Example plus_O_6 : 0 + 6 = 6.
Proof.
  simpl.
  reflexivity.
Qed.

Theorem plus_O_n : forall n : nat, 0 + n = n.
Proof.
  intros n. (* introduce the variable n that is in the forall *)
  simpl.
  reflexivity.
Qed.

Compute plus_O_n 0.

Theorem plus_n_0 : forall n : nat, n + 0 = n.
Proof.
  intros n.
  simpl.
  (** TODO! *)
Qed.
