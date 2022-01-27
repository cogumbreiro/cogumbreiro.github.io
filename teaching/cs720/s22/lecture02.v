Require Import Nat.
(*
Inductive bool :=
 | true : bool
 | false: bool.
*)
Definition andb b1 b2 :=
  match b1 with
  | true => b2
  | false => false
  end.
  
Lemma andb_false_2:
  forall (b:bool),
  andb false b = false.
Proof.
  intros b2.
  simpl.
  reflexivity.
Qed.

Definition andb2 b1 b2 :=
  match b2 with
  | true => b1
  | false => 
    match b1 with
    | true => false
    | false => false
    end
  end.

Inductive bpair : Type :=
 | make_pair : bool -> bool -> bpair.

Compute make_pair true false.

Definition fst (p:bpair) : bool :=
 match p with
 | make_pair b1 _ => b1
 end.

Compute fst (make_pair true false).
Compute fst (make_pair true true).
(*
Inductive nat : Type :=
| O : nat
| S : nat -> nat.
*)
Compute O. (* 0 *)
Compute S O. (* 1 *)
Compute S (S O). (* 2 *)
(*
Fixpoint plus' (n1:nat) (n2:nat): nat :=
  match n1 with
  | O => n2
  | S n1' => S (plus' n1' n2)
  end.
*)
Example plus_O_4 : 0 + 5 = 4.
Proof.
  simpl.
Abort.

Example plus_O_5 : 0 + 5 = 5.
Proof.
  simpl.
  reflexivity.
Qed.

Theorem plus_id_example : forall n m:nat,
  n = m ->
  n + n = m + m.
Proof.
  intros A.
  intros B.
  intros assumption1.
  rewrite <- assumption1.
  reflexivity.
Qed.

Theorem plus_1_neq_0_firsttry : forall n : nat,
  eqb (plus n 1) O = false.
Proof.
  intros n.
  simpl.
  destruct n.
  - simpl. reflexivity.
  - simpl. reflexivity.
Qed.

(*
Lemma andb_false_1:
  forall (b:bool),
  andb2 b false = false.
Proof.
  intros b'.
  simpl.
  reflexivity.
Qed.

Lemma andb_false_2':
  forall (b:bool),
  andb2 false b = false.
Proof.
  intros b.
  simpl.
*)

(* We shall solve this later 
Lemma andb_false_1:
  forall (b:bool),
  andb b false = false.
Proof.
  intros b2.
  simpl.
  reflexivity.
Qed.
*)