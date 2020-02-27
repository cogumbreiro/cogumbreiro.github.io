Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.

From Turing Require Import Lang.
From Turing Require Import Util.

Import Lang.Examples.
Import ListNotations.

Open Scope lang_scope.
Open Scope char_scope.


Lemma a_in_a:
  Char "a" ["a"].
Proof.
  unfold Char.
  reflexivity.
Qed.

Lemma in_aaa:
  In ["a"; "a"; "a"] (Pow (Char "a") 3).
Proof.
  unfold In.
  (* { a } *)
  apply pow_cons with (w1:=["a"]) (w2:=["a"; "a"]).
  - apply pow_cons with (w1:=["a"]) (w2:=["a"]).
    + apply pow_cons with (w1:=["a"]) (w2:=[]).
      * apply pow_nil.
      * apply a_in_a.
      * reflexivity.
    + apply a_in_a.
    + reflexivity.
  - apply a_in_a.
  - reflexivity.
Qed.

Lemma pow_char_in_inv:
  forall c n w,
  In w (Pow (Char c) n) ->
  w = Util.pow1 c n.
Proof.
  unfold In in *.
  induction n; intros. {
    simpl.
    inversion H; subst; clear H.
    auto.
  }
  simpl.
  inversion H; subst; clear H.
  apply IHn in H1.
  rewrite H1 in *.
  subst.
  clear IHn.
  unfold Char in *.
  subst.
  simpl.
  reflexivity.
Qed.

Lemma in_aaa_2:
  In ["a"; "a"; "a"] (Star (Char "a")).
Proof.
  unfold In.
  unfold Star.
  exists 3.
  apply in_aaa.               
Qed.

Import LangNotations.

Lemma union_l_void:
  forall L,
  L U Void == L.
Proof.
  intros.
  unfold Equiv.
  intros w.
  split. {
    intros.
    Search (In _ (_ U _)).
    apply union_in_inv in H.
    destruct H. {
      assumption.
    }
    unfold In, Void in *.
    inversion H.
  }
  intros.
  Search (In _ (_ U _)).
  apply union_in_l.
  assumption.
Qed.

Lemma app_l_void:
  forall L,
  L >> Void == Void.
Proof.
  intros.
  Search (_ >> _).
  unfold Equiv.
  intros.
  split; intros. {
    Search (In _ ( _ >> _)).
    apply app_in_inv in H.
    destruct H as (w1, (w2, Hx)).
    destruct Hx as (Ha, (Hb,Hc)).
    subst.
    inversion Hc.
  }
  inversion H.
Qed.
