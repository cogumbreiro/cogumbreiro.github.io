Inductive expr :=
  | e_true 
  | e_false
  | e_if: expr -> expr -> expr -> expr   (* If (t1 t2 t3: expr) *)
  | e_zero
  | e_succ: expr -> expr
  | e_pred: expr -> expr
  | e_is_zero: expr -> expr.

Inductive bvalue: expr -> Prop :=
  | bv_true:
    bvalue e_true
  | bv_false:
    bvalue e_false.

Inductive nvalue: expr -> Prop :=
  | nv_zero:
    nvalue e_zero
  | nv_succ:
    forall v,
    nvalue v ->
    nvalue (e_succ v).

Definition value v := bvalue v \/ nvalue v.
Ltac invc H := inversion H; subst; clear H.

Goal
  ~ value (e_succ (e_if e_true (e_succ e_zero) e_zero)).
Proof.
  unfold value.
  intros N.
  destruct N as [N | N]. {
    invc N.
  }
  invc N.
  invc H0.
Qed.

Goal
  value e_false.
Proof.
  unfold value.
  left.
  apply bv_false.
Qed.

Inductive step: expr -> expr -> Prop :=
| s_if_true:
  forall t1 t2,
  step (e_if e_true t1 t2) t1
| s_if_false:
  forall t1 t2,
  step (e_if e_false t1 t2) t2
| s_if:
  forall t1 t1' t2 t3,
  step t1 t1' ->
  step (e_if t1 t2 t3) (e_if t1' t2 t3)
| s_is_zero_succ:
  forall v,
  nvalue v ->
  step (e_is_zero (e_succ v)) e_false.

Goal
  step
    (e_if (e_is_zero (e_succ (e_succ e_zero))) e_zero (e_pred (e_succ (e_succ e_zero))))
    (e_if e_false e_zero (e_pred (e_succ (e_succ e_zero))))
  .
Proof.
  apply s_if.
  apply s_is_zero_succ.
  right.
  constructor.
Qed.

Goal
  step
    (e_if e_false e_zero (e_pred (e_succ (e_succ e_zero))))
    (e_pred (e_succ (e_succ e_zero))).
Proof.
  apply s_if_false.
Qed.



