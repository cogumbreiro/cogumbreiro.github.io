(*
        #####################################################
        ###  PLEASE DO NOT DISTRIBUTE SOLUTIONS PUBLICLY  ###
        #####################################################
*)
Require Import Turing.Turing.
Require Import Turing.LangRed.
Require Import Turing.LangDec.

(* This is boilerplate code to make handling A_tm/HALT_tm more tolerable. *)

Lemma A_tm_inv:
  forall w,
  A_tm w ->
  exists m i, w = <[ m, i ]> /\ run m i = Accept.
Proof.
  intros.
  unfold A_tm in *.
  destruct (decode_machine_input w) as (M, i) eqn:Heq.
  exists M.
  exists i.
  apply decode_machine_input_rev in Heq.
  auto.
Qed.

Lemma HALT_tm_inv:
  forall w,
  HALT_tm w ->
  exists m i, w = <[ m, i ]> /\ run m i <> Loop.
Proof.
  intros.
  unfold HALT_tm in *.
  destruct (decode_machine_input w) as (M, i) eqn:Heq.
  exists M.
  exists i.
  apply decode_machine_input_rev in Heq.
  auto.
Qed.


Lemma A_tm_def:
  forall m i w,
  w = <[ m, i ]> ->
  run m i = Accept ->
  A_tm w.
Proof.
  intros.
  unfold A_tm in *.
  destruct (decode_pair w) as (w1, w2) eqn:Hr.
  rewrite H in *.
  run_simpl_all.
  assumption.
Qed.

Lemma HALT_tm_def:
  forall w m i,
  w = <[ m, i ]> ->
  run m i <> Loop ->
  HALT_tm w.
Proof.
  intros.
  unfold HALT_tm in *.
  destruct (decode_machine_input w) as (w1, w2) eqn:Hr.
  subst.
  run_simpl_all.
  inversion Hr; subst; clear Hr.
  assumption.
Qed.

(* End of boilerplate code *)

Definition A_tm_looper M := Build (fun x =>
      mlet r <- Call M x in
      if r then ACCEPT
      else LOOP
      ).

Definition A_tm_to_HALT_tm p:=
    (* On input <[ M, w ]> *)
    let (M, w) := decode_machine_input p in
    (* 1. Construct the following machine M' *)
    let M' := A_tm_looper M in
    (* 2. Output <[ M', w ]> *)
    <[ M', w ]>.

Lemma A_tm_to_HALT_tm_rw:
  forall m i,
  A_tm_to_HALT_tm <[ m, i ]> = <[ A_tm_looper m, i ]>.
Proof.
  intros.
  unfold A_tm_to_HALT_tm, A_tm_looper.
  run_simpl_all.
  reflexivity.
Qed.


(* If looper returns Loop then, m does not accept i. *)
Lemma A_tm_looper_inv:
  forall m i,
  run (A_tm_looper m) i = Loop ->
  run m i <> Accept.
Proof.
  unfold A_tm_looper.
  intros.
  run_simpl_all.
  inversion H; subst; clear H; run_simpl_all. {
    inversion H3; subst; clear H3. {
      run_simpl_all.
    }
    intros N; inversion N.
  }
  intros N.
  rewrite H in N.
  inversion N.
Qed.

Lemma A_tm_to_HALT_tm_inv:
  forall w m' i,
  A_tm_to_HALT_tm w = <[ m', i ]> ->
  exists m,
  w = <[ m, i ]> /\ m' = A_tm_looper m.
Proof.
  unfold A_tm_to_HALT_tm.
  intros.
  destruct (decode_machine_input w) as (M, w') eqn:Hr.
  exists M.
  apply decode_machine_input_rev in Hr.
  subst.
  apply encode_machine_input_ext in H.
  destruct H.
  subst.
  auto.
Qed.

Lemma A_tm_looper_not_loop:
  forall m i,
  run (A_tm_looper m) i <> Loop ->
  run m i = Accept.
Proof.
  unfold A_tm_looper.
  intros.
  (* Do a case analysis on the result of running m with input i. *)
  (* If m accepts i, we are done. Otherwise, if m rejects/loops i, then
     the program in the assumption should loop, which contradicts H. *)
  destruct (run m i) eqn:Hr.
  - reflexivity.
  - (* We can contradict H. *)
    contradict H.
    (* Goal is using Build, simplify it with run_simpl_all *)
    run_simpl_all.
    Search (Run (Seq _ _)).
    (* We know that run rejects, thus *)
    apply run_seq_reject.
    + Search (Run (Call _ _) _).
      apply run_call_eq.
      assumption.
    + apply run_ret.
  - (* Again, we can contradict H. *)
    contradict H.
    (* Similarly to the other case, we simplify the assumption. *)
    run_simpl_all.
    Search (Run (Seq _ _) _).
    (* Hr loops, hence *)
    apply run_seq_loop.
    (* Proof follows similarly to the previous case *)
    apply run_call_eq.
    assumption.
Qed.

Lemma A_tm_red_HALT_tm_1:
  forall w,
  A_tm w ->
  HALT_tm (A_tm_to_HALT_tm w).
Proof.
  intros.
  (* We convert from A_tm to HALT_tm, so we "invert" A_tm, and construct HALT_tm. *)
  apply A_tm_inv in H.
  destruct H as (m, (i, (?, Hr))).
  subst.
  (* Construct HALT_tm with HALT_tm_def *)
  apply HALT_tm_def with (m:=A_tm_looper m) (i:=i).
  - apply A_tm_to_HALT_tm_rw.
  - intros N.
    apply A_tm_looper_inv in N.
    contradiction.
Qed.

Lemma A_tm_red_HALT_tm_2:
  forall w,
  HALT_tm (A_tm_to_HALT_tm w) ->
  A_tm w.
Proof.
  intros.
  apply HALT_tm_inv in H.
  destruct H as (m, (i, (?, Hr))).
  apply A_tm_to_HALT_tm_inv in H.
  destruct H as (m', (?, ?)).
  subst.
  apply A_tm_looper_not_loop in Hr.
  apply A_tm_def with (m:=m') (i:=i); auto.
Qed.

Theorem A_tm_red_HALT_tm: A_tm <=m HALT_tm.
Proof.
  apply reducible_iff with A_tm_to_HALT_tm.
  split; intros.
  - apply A_tm_red_HALT_tm_1; auto.
  - apply A_tm_red_HALT_tm_2; auto.
Qed.

Theorem example_5_24:
  ~ Decidable HALT_tm.
Proof.
  apply reducible_undecidable with (A:=A_tm).
  - apply A_tm_red_HALT_tm.
  - apply a_tm_undecidable.
Qed.

