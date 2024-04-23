Require Import PeanoNat.
Set Default Goal Selector "!".
From Coq Require Import Arith.Arith.
From Coq Require Import Bool.Bool.
Require Export Coq.Strings.String.
From Coq Require Import Lists.List.
Import ListNotations.
Require Import PeanoNat.
Import Nat.

Definition map (A : Type) := string -> option A.
Definition t_empty {A : Type} : map A :=
  (fun _ => None).

Definition t_update {A : Type} (m : map A)
                    (x : string) (v : A) :=
  fun x' => if String.eqb x x' then Some v else m x'.

Notation "x '!->' v ';' m" := (t_update m x v)
                              (at level 100, v at next level, right associativity).

Axiom t_same:
  forall (A:Type) (m: map A) (x:string) (v: A),
  (x !-> v; m) x = Some v.

Ltac invc H := inversion H; subst; clear H.

Definition var := string.
Inductive term_type := 
  | Bool
  | Func (param:term_type) (body:term_type)
  .

Inductive term :=
  | ident (x: var)
  | lam (x:var) (ty:term_type) (body:term)
  | true
  | false
  | cond (cond:term) (then_b: term) (else_b: term)
  | call (func:term) (arg:term).
(*
Fixpoint subst (x:var) (v:term) (s:term) : term :=
  match s with
  | ident y => if String.eq_dec x y then v else s
  | true | false => s
  | cond c t e => cond (subst x v c) (subst x v t) (subst x v e)
  | lam y ty body =>
    if String.eq_dec x y then s else lam x ty (subst x v body)
  end.
*)
Definition typing_context := map term_type.

Inductive type_system: typing_context -> term -> term_type -> Prop :=
| ts_true:
  forall ty,
  type_system ty true Bool
| ts_false:
  forall ty,
  type_system ty false Bool
| ts_cond:
  forall ty t1 t2 t3 T,
  type_system ty t1 Bool ->
  type_system ty t2 T ->
  type_system ty t3 T ->
  type_system ty (cond t1 t2 t3) T
| ts_ident:
  forall ty x T,
  ty x = Some T ->
  type_system ty (ident x) T
| ts_lam:
  forall ty param param_type body body_type,
  type_system (param !-> param_type; ty) body body_type ->
  type_system ty (lam param param_type body) (Func param_type body_type)
| ts_call:
  forall ty func arg arg_type return_type,
  type_system ty func (Func arg_type return_type) ->
  type_system ty arg arg_type ->
  type_system ty (call func arg) return_type.

Notation empty := (@t_empty term_type).
Definition x : string := "x".
Goal
  type_system empty (call
    (lam x Bool (cond (ident x) false true))
    true
  ) Bool.
Proof.
  apply ts_call with (arg_type:=Bool).
  - apply ts_lam.
    apply ts_cond.
    + apply ts_ident.
      rewrite t_same.
      reflexivity.
    + apply ts_false.
    + apply ts_true.
  - apply ts_true.
Qed.

Goal
  type_system empty (call
    (lam x Bool (cond (ident x) false true))
    true
  ) Bool.
Proof.
  apply ts_call with (arg_type:=Bool).
  all: repeat constructor.
Qed.















