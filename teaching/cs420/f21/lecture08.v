Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.
Open Scope char_scope.
Import ListNotations.
Require Import Turing.Util.
Require Import Turing.Lang.

(* Length: *)
Goal length ["c"; "a"; "r"] = 3.
Proof. reflexivity. Qed.


(* Concatenation *)
Goal ["c"] ++ ["a"; "r"] = ["c"; "a"; "r"].
Proof. reflexivity. Qed.


(* Power *)
Goal pow ["c"; "a"; "r"] 3 = ["c"; "a"; "r"; "c"; "a"; "r"; "c"; "a"; "r"].
  Proof. reflexivity. Qed.
  
Goal pow ["c"; "a"; "r"] 1 = ["c"; "a"; "r"]. Proof. reflexivity. Qed.
Goal pow ["c"; "a"; "r"] 0 = []. Proof. reflexivity. Qed.

Definition L1 (w:word) := w = ["c"; "a"; "r"].

Goal
   In ["c"; "a"; "r"] L1.
Proof.
  unfold L1.
  unfold In.
  reflexivity.
Qed.


Goal
   ~ In [] L1.
Proof.
  unfold In, L1.
  intros N.
  inversion N.
Qed.

Lemma l1_inv:
  forall w,
  In w L1 ->
  w = ["c"; "a"; "r"].
Proof.
  unfold In, L1.
  intros.
  assumption.
Qed.


Definition L2 w := Char "a" w
  \/ Char "e" w
  \/ Char "i" w
  \/ Char "o" w
  \/ Char "u" w.

Goal In ["i"] L2.
Proof.
  unfold In, L2.
  unfold Char.
  right.
  right.
  left.
  reflexivity.
Qed.


Lemma aa_not_in_vowel: ~ In ["a"; "a"] L2.
Proof.
  unfold In, L2.
  intros N.
  destruct N as [N|[N|[N|[N|N]]]]; inversion N.
Qed.

Goal In [] Nil.
Proof.
  reflexivity.
Qed.
(*
Coercion Char: ascii >-> language.
*)
Import LangNotations.


Print Union.
Infix "U" := Union. 


Goal
  forall (w:word),
  In w L1 ->
  In w (L1 U L2).
Proof.
  unfold In.
  intros.
  unfold Union.
  left.
  assumption.
Qed.


Definition App L1 L2 w := 
  exists w1 w2,
  In w1 L1 /\
  In w2 L2 /\
  w = w1 ++ w2.

Definition L1' := App (Char "c")
                      (App (Char "a")
                           (Char "r")).


Goal
  In ["c"; "a"; "r"] L1'.
Proof.
  intros.
Qed.





































