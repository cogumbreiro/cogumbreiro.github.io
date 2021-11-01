Require Import Coq.Lists.List.
Require Import Coq.Strings.Ascii.
Require Import Turing.Lang.
Require Import Turing.Regular.
Require Import Turing.Regex.
Import ListNotations.
Import RegexNotations.
Import Lang.LangNotations.
Open Scope char_scope.
Open Scope lang_scope.
Open Scope regex_scope.

(* ---------------------- END OF PREAMBLE ------------------ *)

Definition L1 := "1" ;; (r_star "1";; ("0";; r_star "0")).

Lemma l1_pump:
  In ["1"; "0"; "0"] (Pump (Accept L1) 3).
Proof.
  apply pump_def with (x:=["1"; "0"]) (y:=["0"]) (z:=[]).
  - reflexivity.
  - intros N. inversion N.
  - auto.
  - intros.
    unfold In.
    unfold L1.
    Search (r_char _ ;; _).
    apply accept_cons.
    Search (r_star _ ;; _).
    apply accept_app_star_skip.
    Search (_ ++ []).
    rewrite app_nil_r.
    apply accept_cons.
    Search (Util.pow _ _ \in _).
    apply accept_pow_char.
Qed.
