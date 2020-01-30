(*
(* Defining booleans *)

Inductive boolean := true | false.
*)

Compute true. Compute false. (* This evaluates true *)

(*
Inductive color :=
  Red : color
| Blue : color
| Green : color.

Compute Red.
*)
Inductive day : Type :=
  | monday : day
  | tuesday : day
  | wednesday : day
  | thursday : day
  | friday : day
  | saturday : day
  | sunday : day.

Definition d := friday.

Compute match d with
| monday => tuesday
| tuesday => wednesday
| wednesday => thursday
| thursday => friday
| friday => monday
| saturday => monday
| sunday => monday
end.
(*
def next_weekday(d:day):
*)

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
  

Compute next_weekday ((monday)).
Compute (next_weekday (next_weekday friday)).

Example test_next_weekday:
  next_weekday (next_weekday saturday) = tuesday.
Proof.
  simpl.       (* simplify left-hand side *)
  reflexivity. (* use reflexivity since we have tuesday = tuesday *)
Qed.

Check test_next_weekday.

 Inductive rgb :=
   | red
   | green
   | blue.

 Inductive color : Type :=
   | black : color
   | white : color
   | primary : rgb -> color.


Definition r := red.

Definition C1 := primary red.

Definition rgb_inverse (r:rgb) : rgb :=
  match r with
  | red => green
  | green => blue
  | blue => red
  end.

Definition color_inverse c := match c with
| black => white
| white => black
| primary r => primary (rgb_inverse r)
end.

Compute color_inverse C1.
Inductive nat :=
  | O : nat
  | S: nat -> nat.

Compute O.
Compute S O.
Compute (S (S O)).
Check S.
Print primary.
Check primary.

Fixpoint add (n1:nat) (n2:nat) :=
  match n1 with
  | O => n2
  | S n => S (add n n2)
  end.

Compute add O (S (S O)).
Compute add (S O) (S (S O)).
Compute add (S (S O)) (S (S O)).
Compute add (S (S (S O))) (S (S O)).

(*
Definition evenb (n:nat) :=
  match 
*)
(*
Example plus_O_4 : 0 + 5 = 4.
Proof.
  simpl.
  reflexivity.
*)

Example plus_O_5 : 0 + 5 = 5.
Proof.
  simpl.
  reflexivity.
Qed.

Example plus_O_6 : 0 + 6 = 6.
Proof.
  simpl.
  reflexivity.
Qed.

Example plus_O_n : forall n, 0 + n = n.
  intros n.
  simpl.
  reflexivity.
Proof.
