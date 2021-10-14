Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.
Require Import Turing.Util.
Require Import Turing.Lang.
Import ListNotations.
Import LangNotations.
Open Scope char_scope.
Open Scope lang_scope.

Goal le 1 2.
Proof.
  constructor.
  constructor.
Qed.


(* Length: *)
Goal length ["c"; "a"; "r"] = 3.
Proof. reflexivity. Qed.

(* Concatenation *)
Goal ["c"] ++ ["a"; "r"] = ["c"; "a"; "r"]. Proof. reflexivity. Qed.
(* Power *)

Goal pow ["c"; "a"; "r"] 3 = ["c"; "a"; "r"; "c"; "a"; "r"; "c"; "a"; "r"].
  Proof. reflexivity. Qed.

Goal pow ["c"; "a"; "r"] 1 = ["c"; "a"; "r"]. Proof. reflexivity. Qed.
Goal pow ["c"; "a"; "r"] 0 = []. Proof. reflexivity. Qed.

Definition L1 : language := fun w => w = ["c"; "a"; "r"].

Goal
  In ["c"; "a"; "r"] L1.
Proof.
  unfold In.
  unfold L1.
  reflexivity.
Qed.

Goal
  ~ In [] L1.
Proof.
  unfold In.
  unfold L1.
  intros N.
  inversion N.
Qed.

Definition Vowel w := w = ["a"]
                   \/ w = ["e"]
                   \/ w = ["i"]
                   \/ w = ["o"]
                   \/ w = ["u"].


Lemma a_in_vowel: In ["a"] Vowel.
Proof.
  unfold Vowel, In.
  left.
  reflexivity.
Qed.

Definition Union L1 L2 w := 
  In w L1 \/ In w L2.

Lemma union_nil_vowel:
  In [] (Union Nil Vowel).
Proof.
  unfold Union.
  unfold In.
  left.
  reflexivity.
Qed.

Lemma nil_not_in_vowel:
  ~ In [] Vowel.
Proof.
  intros H.
  unfold In, Vowel in *.
  destruct H. {
    inversion H.
  }
  intuition.
  - inversion H0.
  - inversion H.
  - inversion H0.
  - inversion H0.
Qed.
  Print Pow.

Lemma pow_vowel_0:
  Pow Vowel 0 [].
Proof.
  apply pow_nil.
Qed.
(*
Lemma pow_vowel_1:
  Pow Vowel 1 ["a"].
Proof.
  apply pow_cons with (w2:=[]) (w1:=["a"]).
  - apply pow_vowel_0.
  - unfold Vowel.
    intuition.
  - reflexivity.
Qed.
*)
Lemma pow_1:
  forall (L:language) w,
  L w ->
  Pow L 1 w.
Proof.
  intros.
  apply pow_cons with (w1:=w) (w2:=[]).
  - apply pow_nil.
  - assumption.
  - rewrite app_nil_r.
    reflexivity.
Qed.

Lemma pow_vowel_1:
  forall c1,
  Vowel [c1] ->
  Pow Vowel 1 [c1].
Proof.
  intros.
  apply pow_1.
  assumption.
Qed.


Lemma pow_vowel_2_:
  forall c1 c2,
  Vowel [c1] ->
  Vowel [c2] ->
  Pow Vowel 2 [c1; c2].
Proof.
  intros.
  apply pow_cons with (w1:=[c1]) (w2:=[c2]).
  - apply pow_vowel_1.
    assumption.
  - assumption.
  - reflexivity.
Qed.

Lemma pow_vowel_2:
  Pow Vowel 2 ["e"; "a"].
Proof.
  intros.
  apply pow_vowel_2_.
  - unfold Vowel. right. left. reflexivity.
  - unfold Vowel. left. reflexivity.
Qed.



Lemma aa_not_in_vowel: ~ In ["a"; "a"] Vowel.
Proof.
  unfold Vowel, In.
  intros N.
  destruct N as [N|[N|[N|[N|N]]]]; inversion N.
Qed.

Goal
  In   ["a"] (Char "a").















