Inductive expr :=
  | Num : nat -> expr
  | Bin : expr -> expr -> expr.
  
  Inductive step: expr -> expr -> Prop :=
  | p_const: forall n1 n2,
    step (Bin (Num n1) (Num n2)) (Num (n1 +n2))
  | p_left: forall t1 t2 t1',
    step t1 t1' ->
    step (Bin t1 t2) (Bin t1' t2)
  | p_right: forall n1 t2 t2',
    step t2 t2' ->
    step (Bin (Num n1) t2) (Bin (Num n1) t2').

  Inductive Value: expr -> Prop :=
  | value_def: forall n,
    Value (Num n).
 
Ltac invc H := inversion H; subst; clear H.

Theorem step_deterministic:
  forall t ta,
  step t ta ->
  forall tb,
  step t tb ->
  ta = tb.
Proof.
  intros t ta H.
  induction H.
  all: intros tb s1.
  - invc s1.
    + constructor.
    + invc H2.
    + invc H2.
  - invc s1.
    + invc H.
    + apply IHstep in H3.
      subst.
      reflexivity.
    + invc H.
  - invc s1.
    + invc H.
    + invc H3.
    + apply IHstep in H3.
      subst.
      reflexivity.
Qed.

Theorem strong_progress:
  forall t,
  Value t \/ exists t', step t t'.
Proof.
  (* I tried following the same structure
     of the proof we did in the black board. *)
  induction t as [n | ta IHa tb IHb].
  - left. constructor.
  - right.
    destruct ta as [na | ta1 ta2]. {
      destruct tb as [nb | tb1 tb2]. {
        exists (Num (na + nb)).
        constructor.
      }
      destruct IHb as [IHb | [tb' Hs]]. {
        invc IHb.
      }
      exists (Bin (Num na) tb').
      apply p_right.
      assumption.
    }
    destruct IHa as [IHa | [ta' Hs]]. {
      invc IHa.
    }
    exists (Bin ta' tb).
    apply p_left.
    assumption.
Qed.

Definition NF (t:expr) := forall t', ~ step t t'.

Theorem value_to_nf:
  forall t,
  Value t ->
  NF t.
Proof.
  intros.
  invc H.
  unfold NF.
  intros.
  intros N.
  invc N.
Qed.

(* Helper lemma: when an expression evaluates, it is not
   in the normal form. *)
Lemma step_to_not_nf:
  forall t1 t2,
  step t1 t2 ->
  ~ NF t1.
Proof.
  intros.
  intros N.
  contradict H.
  apply N.
Qed.

Theorem nf_to_value:
  forall t,
  NF t ->
  Value t.
Proof.
  intros.
  destruct t. {
    constructor.
  }
  (* We know that t1 + t2 is not a value, so we
     can use the strong progress to get what
     t1 + t2 reduces to some t3. *)
  assert (Hx: exists t3, step (Bin t1 t2) t3). {
    assert (Hx := strong_progress (Bin t1 t2)). {
      destruct Hx as [Hx|Hx]. {
        (* (Bin t1 t2) is not a value *)
        invc Hx.
      }
      destruct Hx as (t3, Hx).
      exists t3.
      assumption.
    }
  }
  destruct Hx as (t3, Hx).
  (* Now that we know that we know that (t1 + t2) reduces,
     then we've reached a contradiction with H! *)
  apply step_to_not_nf in Hx.
  contradiction.
Qed.

Corollary nf_value_iff:
  forall t,
  Value t <-> NF t.
Proof.
  split.
  - apply value_to_nf.
  - apply nf_to_value.
Qed.

Inductive multi_step: expr -> expr -> Prop :=
| r_refl:
  forall t,
  multi_step t t
| r_step:
  forall t1 t2 t3,
  step t1 t2 ->
  multi_step t2 t3 ->
  multi_step t1 t3.

Definition NF_of t1 t2 := multi_step t1 t2 /\ NF t2.


Lemma nf_num:
  forall n,
  NF (Num n).
Proof.
  intros.
  apply nf_value_iff.
  constructor.
Qed.

Lemma nf_of_num:
  forall n,
  NF_of (Num n) (Num n).
Proof.
  intros.
  split. {
    apply r_refl.
  }
  apply nf_num.
Qed.

Lemma multi_step_left:
  forall t1 t2 t3,
  multi_step t1 t2 ->
  multi_step (Bin t1 t3) (Bin t2 t3).
Proof.
  intros.
  induction H. {
    constructor.
  }
  apply r_step with (t2:=(Bin t2 t3)). {
    apply p_left.
    assumption.
  }
  assumption.
Qed.

Lemma multi_step_right:
  forall n1 t2 t3,
  multi_step t2 t3 ->
  multi_step (Bin (Num n1) t2) (Bin (Num n1) t3).
Proof.
  intros.
  induction H. {
    constructor.
  }
  apply r_step with (t2:=Bin (Num n1) t2). {
    apply p_right.
    assumption.
  }
  assumption.
Qed.

Lemma multi_step_transitivity:
  forall t1 t2,
  multi_step t1 t2 ->
  forall t3,
  multi_step t2 t3 ->
  multi_step t1 t3.
Proof.
  intros t1 t2 H.
  induction H.
  all: intros tb Hb.
  - assumption.
  - apply IHmulti_step in Hb.
    apply r_step with (t2:=t2).
    + assumption.
    + assumption.
Qed.

Lemma multi_step_1:
  forall t1 t2,
  step t1 t2 ->
  multi_step t1 t2.
Proof.
  intros.
  apply r_step with (t2:=t2). {
    assumption.
  }
  apply r_refl.
Qed.

Lemma multi_step_bin:
  forall ta tb na nb,
  multi_step ta (Num na) ->
  multi_step tb (Num nb) ->
  multi_step (Bin ta tb) (Num (na + nb)).
Proof.
  intros.
  assert (Ha: multi_step (Bin ta tb) (Bin (Num na) tb)). {
    apply multi_step_left.
    assumption.
  }
  assert (Hb: multi_step (Bin (Num na) tb) (Bin (Num na) (Num nb))). {
    apply multi_step_right.
    assumption.
  }
  assert (Hc: multi_step (Bin ta tb) (Bin (Num na) (Num nb))). {
    apply multi_step_transitivity with (t2:=(Bin (Num na) tb)). {
      assumption.
    }
    assumption.
  }
  (* Hd: Bin na na ->* Num (na + nb) *) 
  assert (Hd: multi_step (Bin (Num na) (Num nb)) (Num (na + nb))). {
    apply multi_step_1.
    constructor.
  }
  (* Hc -> Hd *)
  apply multi_step_transitivity with (t2:=(Bin (Num na) (Num nb))). {
    assumption.
  }
  assumption.
Qed.

Theorem normalizing:
  forall t1,
  exists t2,
  NF_of t1 t2.
Proof.
  induction t1. {
    exists (Num n).
    apply nf_of_num.
  }
  destruct IHt1_1 as [ta IHa].
  destruct IHt1_2 as [tb IHb].
  destruct IHa as [multi_a a_val].
  destruct IHb as [multi_b b_val].
  apply nf_value_iff in a_val, b_val.
  invc a_val.
  rename n into na.
  invc b_val.
  rename n into nb.
  rename t1_1 into ta.
  rename t1_2 into tb.
  exists (Num (na + nb)).
  split. {
    apply multi_step_bin.
    + assumption.
    + assumption.
  }
  apply nf_num.
Qed.

Inductive big_step : expr -> nat -> Prop :=
| big_num: forall n,
  big_step (Num n) n
| big_bin:
  forall t1 n1 t2 n2,
  big_step t1 n1 ->
  big_step t2 n2 ->
  big_step (Bin t1 t2) (n1 + n2).

Lemma big_step_to_nf_of:
  forall t n,
  big_step t n ->
  NF_of t (Num n).
Proof.
  intros t b H.
  induction H. {
    apply nf_of_num.
  }
  destruct IHbig_step1 as [run_a nf_a].
  destruct IHbig_step2 as [run_b nf_b].
  split. {
    apply multi_step_bin.
    all: assumption.
  }
  apply nf_num.
Qed.

Lemma step_big_step:
  forall t1 t2,
  step t1 t2 ->
  forall n,
  big_step t2 n ->
  big_step t1 n.
Proof.
  intros t1 t2 H.
  induction H.
  all: intros n Ha.
  - invc Ha.
    constructor.
    all: constructor.
  - invc Ha.
    apply IHstep in H2.
    constructor.
    all: assumption.
  - invc Ha.
    invc H2.
    constructor.
    + constructor.
    + apply IHstep.
      assumption.
Qed.

Lemma nf_of_to_big_step:
  forall t1 t2,
  NF_of t1 t2 ->
  exists n, t2 = Num n /\ big_step t1 n.
Proof.
  intros.
  destruct H as [Ha Hb].
  induction Ha. {
    apply nf_to_value in Hb.
    invc Hb.
    exists n.
    split. {
      reflexivity.
    }
    constructor.
  }
  specialize (IHHa Hb).
  destruct IHHa as [n [eq1 IH]].
  subst.
  exists n.
  split. {
    reflexivity.
  }
  apply step_big_step with (t2:=t2).
  - assumption.
  - assumption.
Qed.