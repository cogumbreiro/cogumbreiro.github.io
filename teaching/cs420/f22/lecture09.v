Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.
Require Import Turing.Util.
Require Import Turing.Lang.
Import ListNotations.
Import LangNotations.
Open Scope char_scope.
Open Scope lang_scope.

Print Nil.

Definition Void (w:word) := False.

Lemma all_words_rejected:
  forall (w: word),
   ~ In w Void.
Proof.
  intros.
  unfold In, not, Void.
  intros N.
  contradiction.
Qed.


Definition All (w:word) := True.

Lemma all_words_in_all:
  forall (w:word),
  In w All.
Proof.
  intros.
  unfold All, In.
  apply I.
Qed.

(*

 L = { [a] }
 L ^^ 0 = Nil = { [] }
 L ^^ 1 = { [ a ] }
 L ^^ 2 = L >> L ^^ 1 = { [a,a] }
 L ^^ 3 = { [a, a, a] }
 *)

Lemma in_aaa:
  In ["a"; "a"; "a"] (Pow "a" 3).
Proof.
  unfold In.
  apply pow_cons with (w1:=["a"]) (w2:=["a"; "a"]).
  - apply pow_cons with (w1:=["a"]) (w2:=["a"]).
    + apply pow_cons with (w1:=["a"]) (w2:=[]).
      * apply pow_nil.
      * reflexivity.
      * reflexivity.
    + reflexivity.
    + reflexivity.
  - reflexivity.
  - reflexivity.
Qed.

Lemma pow_char_in_inv:
  forall c n w,
  In w (Pow (Char c) n) ->
  w = Util.pow1 c n.
Proof.
  induction n; intros. {
    simpl.
    unfold In in *.
    inversion H; subst; clear H.
    reflexivity.
  }
  simpl.
  inversion H; subst; clear H.
  apply IHn in H1.
  subst.
  inversion H2.
  subst.
  reflexivity.
Qed.

Print Star.
Definition Vowel w := w = ["a"]
                   \/ w = ["e"]
                   \/ w = ["i"]
                   \/ w = ["o"]
                   \/ w = ["u"].
Lemma vowel_eq:
  Vowel == (Char "a" U Char "e" U Char "i" U Char "o" U Char "u").
Proof.
  unfold Equiv.
  intros w.
  split; intros.
  - unfold Vowel in *.
    unfold In in H.
    intuition; subst.
    + left.
      left.
      left.
      left.
      reflexivity.
    + left.
      left.
      left.
      right.
      reflexivity.
    + admit.
    + admit.
    + admit.
 - destruct H.
   + destruct H.
     * destruct H. {
        destruct H. {
          inversion H.
          subst.
          unfold In, Char in *.
          unfold Vowel.
          intuition.
        }
        admit.
       }
Admitted.
  










  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
