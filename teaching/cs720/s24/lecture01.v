Inductive day : Type :=
  | monday : day
  | tuesday : day
  | wednesday : day
  | thursday : day
  | friday : day
  | saturday : day
  | sunday : day.

Compute monday.

(*

(* Here we just define an alias. *)

*)
Definition MONDAY := monday.

Compute MONDAY.

Definition next_weekday (d:day) := match d with
  | monday => tuesday
  | tuesday => wednesday
  | wednesday => thursday
  | thursday => friday
  | friday => monday
  | saturday => monday
  | sunday => monday
  end.

Compute next_weekday saturday.
Compute next_weekday (next_weekday saturday).


Example test_next_weekday:
               (* = monday          *)
  next_weekday (next_weekday saturday) = tuesday.
  (* = tuesday *)
Proof.
  simpl.
  reflexivity.
Qed.

Check next_weekday.

(*
Example test_next_weekday_wrong:
  next_weekday saturday = tuesday.
Proof.
  simpl.
  reflexivity.
*)






