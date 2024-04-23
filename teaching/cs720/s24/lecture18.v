Require Import PeanoNat.

Definition var := nat.
Inductive lambda_t := 
  | Bool
  | Func (param:lambda_t) (body:lambda_t)
  .

Inductive term :=
  | ident (x: var)
  | lam (x:var) (ty:lambda_t) (body:term)
  | true
  | false
  | cond (cond:term) (then_b: term) (else_b: term).

Fixpoint subst (x:var) (v:term) (s:term) : term :=
  match s with
  | ident y => if Nat.eq_dec x y then v else s
  | true | false => s
  | cond c t e => cond (subst x v c) (subst x v t) (subst x v e)
  | lam y ty body =>
    if Nat.eq_dec x y then s else lam x ty (subst x v body)
  end.