Require Import PeanoNat.

Inductive op :=
  | Plus
  | Div.

Inductive expr :=
  | Num : nat -> expr
  | Bin : op -> expr -> expr -> expr.

(* Given an operation return the function that
   computes it. *)

Definition eval_op (o:op) (x: nat) (y: nat) : option nat :=
  match o with
  | Plus => Some (x + y)
  | Div =>
    match y with
    | 0 => None
    | _ => Some (x / y)
    end
  end.

Inductive step: expr -> expr -> Prop :=
  | p_const: forall o n1 n2 n3,
    eval_op o n1 n2 = Some n3 ->
    step (Bin o (Num n1) (Num n2)) (Num n3)
  | p_left: forall t1 t2 t1' o,
    step t1 t1' ->
    step (Bin o t1 t2) (Bin o t1' t2)
  | p_right: forall n1 t2 t2' o,
    step t2 t2' ->
    step (Bin o (Num n1) t2) (Bin o (Num n1) t2').

Inductive Value: expr -> Prop :=
  | value_def: forall n,
    Value (Num n).


Inductive NoDiv : expr -> Prop :=
  | no_div_num:
    forall n,
    NoDiv (Num n)
  | no_div_plus:
    forall e1 e2,
    NoDiv e1 ->
    NoDiv e2 ->
    NoDiv (Bin Plus e1 e2) 
.

Inductive Invalid: expr -> Prop :=
  | invalid_div:
    forall e1 e2,
    Invalid (Bin Div e1 e2)
  | invalid_plus_l:
    forall e1 e2,
    Invalid e1 ->
    Invalid (Bin Plus e1 e2)
  | invalid_plus_r:
    forall e1 e2,
    Invalid e2 ->
    Invalid (Bin Plus e1 e2)
.

Ltac invc H := inversion H; subst; clear H.

Lemma no_div_to_not_invalid:
  forall e,
  NoDiv e ->
  ~ Invalid e.
Proof.
  intros e H.
  induction H.
  all: intros N.
  all: invc N.
  all: contradiction.
Qed.

Lemma invalid_to_not_no_div:
  forall e,
  Invalid e ->
  ~ NoDiv e.
Proof.
  intros e H.
  induction H.
  all: intros N.
  all: invc N.
  all: contradiction.
Qed.

  Definition relation (X : Type) := X -> X -> Prop.

  Definition predicate (X: Type) := X -> Prop.

  Definition deterministic {X : Type} (R : relation X) :=
    forall x y1 : X, R x y1 -> forall y2, R x y2 -> y1 = y2.

  Definition preserves {X : Type} (R: relation X) (P: predicate X) :=
    forall x y : X,
    P x ->
    R x y ->
    P y.

  Definition normal_form {X : Type} (R : relation X) (t : X) : Prop :=
    ~ exists t', R t t'.

  Inductive multi {X : Type} (R : relation X) : relation X :=
  | multi_refl:
    forall (x : X),
    multi R x x
  | multi_step:
    forall (x y z : X),
    R x y ->
    multi R y z ->
    multi R x z.

  

Lemma multi_step_preservation:
  forall (X:Type) (R: relation X) (P: predicate X),
  preserves R P ->
  preserves (multi R) P.
Proof.
  intros.
  unfold preserves.
  intros.
  induction H1.
  - assumption.
  - assert (Hp : P y). {
      unfold preserves in H.
      apply H with (x:=x).
      all: assumption.
    }
    apply IHmulti.
    assumption.
Qed.

Lemma no_div_preservation:
  forall e e',
  step e e' ->
  NoDiv e ->
  NoDiv e'.
Proof.
  intros e_pre e_post H e_no_div.
  induction H.
  all: invc e_no_div.
  - constructor.
  - constructor.
    + apply IHstep. assumption.
    + assumption.
  - constructor.
    + constructor.
    + apply IHstep. assumption.
Qed.

Lemma no_div_preserves:
  preserves step NoDiv.
Proof.
  unfold preserves.
  intros.
  apply no_div_preservation in H0.
  all: assumption.
Qed.

Lemma no_div_multi_preserves:
  preserves (multi step) NoDiv.
Proof.
  apply multi_step_preservation.
  apply no_div_preserves.
Qed.

Lemma exercise:
  forall e,
  NoDiv e ->
  forall e',
  multi step e e' ->
  ~ Invalid e'.
Proof.
  intros.
  apply no_div_to_not_invalid.
  apply no_div_multi_preserves in H0.
  all: assumption.
Qed.

