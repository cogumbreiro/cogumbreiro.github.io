Inductive suite :=
  | hearts
  | clubs
  | spades
  | diamonds
  .

Compute hearts.

Inductive boolean :=
 | true
 | false.

Inductive nibble :=
 | one
 | two
 | three
 | zero
 .

Inductive day : Type :=
  | monday : day
  | tuesday : day
  | wednesday : day
  | thursday : day
  | friday : day
  | saturday : day
  | sunday : day.
  
 
Definition next_week_day (d : day) : day :=
  match d with
  | monday => tuesday
  | tuesday => wednesday
  | wednesday => thursday
  | thursday => friday
  (*
  | friday => monday
  | saturday => monday
  | sunday => monday
  *)
  (*
  | friday | saturday | sunday => monday
  *)
  | _ => monday
  end.

Compute (next_week_day monday).
Compute next_week_day tuesday.
Compute next_week_day saturday.

Goal
  next_week_day monday = tuesday.
Proof.
  simpl.
  reflexivity.
Qed.

Goal
  next_week_day monday = wednesday.
Proof.
  simpl.
  Fail reflexivity.
Abort.



 