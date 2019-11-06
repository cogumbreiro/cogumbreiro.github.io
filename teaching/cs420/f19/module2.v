
Lemma contra:
  forall (P Q:Prop),
  (P -> Q) -> (~ Q -> ~P).
Proof.
  intros.
  intros hasP.
  apply H in hasP.
  contradiction.
Qed.

Lemma not_or_to_not_and:
  forall P Q: Prop,
  ~ P \/ ~ Q ->
  ~ (P /\ Q).
Proof.
  intros.
  intros N.
  destruct N.
  destruct H.
  - contradiction.
  - contradiction.
Qed.

Definition ExcludedMiddle := (forall P: Prop, P \/ ~ P).

(** To prove that from not (P and Q) implies not P or not Q
    is not provable in a constructive logic. *)

Lemma not_and_to_or_not (XM: ExcludedMiddle):
  forall P Q: Prop,
  ~ (P /\ Q) ->
  ~P \/ ~ Q.
Proof.
  intros.
  (* Our assumptions are:
        H : ~ (P /\ Q)
    and the excluded middle.
    The only way to reach a contradiction is to have
    P and Q, but we have neither! So, we need to fabricate P and Q
    by using the excluded middle. *)
  destruct (XM P), (XM Q).
  - contradict H.
    split.
    + assumption.
    + assumption.
  - right.
    assumption.
  - left.
    assumption.
  - left.
    assumption.
Qed.

(** Let us define a variable. *)
Variable lang : Type.
(** Let us define a predicate on context-freedom. *)
Variable CtxFree : lang -> Prop.
(** Let us define a predicate for regular languages. *)
Variable Reg: lang -> Prop.
(** Further, let us defined union of languages, which is a function
    that takes a language and another language and produces a language. *)
Variable union: lang -> lang -> lang.
Variable cat: lang -> lang -> lang.
(** Let us assume that the union in closed under context-free languages, which
    we know to be the case. *)
Axiom union_cf:
  forall L1 L2,
  CtxFree L1 ->
  CtxFree L2 ->
  CtxFree (union L1 L2).
Axiom cat_cf:
  forall L1 L2,
  CtxFree L1 ->
  CtxFree L2 ->
  CtxFree (cat L1 L2).
Axiom union_reg:
  forall L1 L2,
  Reg L1 ->
  Reg L2 ->
  Reg (union L1 L2).
Axiom cat_reg:
  forall L1 L2,
  Reg L1 ->
  Reg L2 ->
  Reg (cat L1 L2).
Variable reg_to_cf:
  forall L,
  Reg L ->
  CtxFree L.

Lemma not_cf_to_reg:
  forall L,
  ~ CtxFree L ->
  ~ Reg L.
Proof.
  intros L.
  apply contra.
  apply reg_to_cf.
Qed.

(** Our objective is to show that if the union of L1 and L2 is not context-free,
    then either L1 is not context free or L2 is not context free.
    This result requires the excluded middle. *)
Lemma objective (XM:ExcludedMiddle) :
  forall L1 L2,
  ~ CtxFree (union L1 L2) ->
  ~ CtxFree L1 \/ ~ CtxFree L2.
Proof.
  intros L1 L2.
  intros H.
  apply (not_and_to_or_not XM).
  intros N.
  destruct N as (H1, H2).
  contradict H.
  apply union_cf.
  - assumption.
  - assumption.
Qed.

Lemma cf_reg_union:
  forall L1 L2,
  CtxFree L1 ->
  Reg L2 ->
  CtxFree (union L1 L2).
Proof.
  intros.
  apply reg_to_cf in H0.
  apply union_cf.
  - assumption.
  - assumption.
Qed.

Lemma cf_reg_union2:
  forall L1 L2,
  Reg L1 ->
  Reg L2 ->
  CtxFree (union L1 L2).
Proof.
  intros.
  apply reg_to_cf in H.
  apply reg_to_cf in H0.
  apply union_cf.
  - assumption.
  - assumption.
  (*
  apply reg_to_cf.
  apply union_reg.
  - assumption.
  - assumption. *)
Qed.

Variable _0n1n : lang.
Axiom _0n1n_not_reg: ~ Reg _0n1n.
Axiom _0n1n_cf: CtxFree _0n1n.
Lemma not_reg_to_not_cf:
  ~ (forall l, ~ Reg l -> ~ CtxFree l).
Proof.
  intros N.
  assert (N := N _0n1n).
  assert (H := _0n1n_not_reg).
  apply N in H.
  contradict H.
  apply _0n1n_cf.
Qed.

 
