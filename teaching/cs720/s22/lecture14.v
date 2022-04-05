
Ltac invc H := inversion H; subst; clear H.

Theorem hoare_skip : forall P,
     {{P}} skip {{P}}.
Proof.
  intros.
  unfold hoare_triple.
  intros st_in st_out skip_runs P_holds.
  invc skip_runs.
  assumption.
Qed.

Theorem hoare_seq : forall P Q R c1 c2,
     {{Q}} c2 {{R}} ->
     {{P}} c1 {{Q}} ->
     {{P}} c1; c2 {{R}}.
Proof.
  intros P Q R c1 c2 c2_h c1_h.
  unfold hoare_triple.
  intros st_in st_out c1_c2_runs P_holds.
  invc c1_c2_runs.
  unfold hoare_triple in c1_h.
  specialize (c1_h _ _ H1 P_holds).
  specialize (c2_h _ _ H4 c1_h).
  assumption.
Qed.


Goal forall P a,
  {{ fun st => P st }} X := a {{ fun st => P st /\ False }}.
Proof.
  intros.
  unfold hoare_triple.
  intros s_in s_out asgn_runs P_holds.
  invc asgn_runs.
Abort.

Goal forall P a,
  {{ fun st => P st /\ st X = aeval st a }}
  X := a
  {{ fun st => P st }}.
Proof.
  intros.
  unfold hoare_triple.
  intros st_in st_out asgn_runs (P_holds, x_eq_a).
  invc asgn_runs.
  rewrite <- x_eq_a.
  rewrite t_update_same.
  assumption.
Qed.

Goal {{ (fun st : state => st X = 2) [X |-> X + 1] [ X |-> 1] }}
       X := 1; X := X + 1
     {{ fun st => st X = 2 }}.
Proof.
  apply hoare_seq with (Q:=(fun st : state => st X = 2) [X |-> X + 1] ). {
    apply hoare_asgn.
  }
  apply hoare_asgn.
Qed.