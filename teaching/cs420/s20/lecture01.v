(*
(* Defining booleans *)

Inductive boolean := true | false.
*)

Compute true. Compute false. (* This evaluates true *)


Inductive color :=
  Red : color
| Blue : color
| Green : color.

Compute Red.

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
  (* reflexivity. *) (* use reflexivity since we have tuesday = tuesday *)
Qed.

















