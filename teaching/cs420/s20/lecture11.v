Require Coq.Strings.Ascii.
Require Coq.Lists.List.
Require Coq.Arith.PeanoNat.
Require Coq.omega.Omega.
Require Coq.Classes.Morphisms.
Require Import Util.
Require Import Lang.
Require Import List.
Import ListNotations.
Open Scope char_scope. (* Ensure by default we are representing characters. *)

(* (ab)*a = a(ba)* *)

Lemma ab_s_a_eq_a_ba_s:
  forall n,
  pow [1; 0] n ++ [1]
  = [1] ++ pow [0; 1] n.
Proof.
  induction n. {
    simpl.
    reflexivity.
  }
  simpl.
  rewrite IHn.
  simpl.
  reflexivity.
Qed.