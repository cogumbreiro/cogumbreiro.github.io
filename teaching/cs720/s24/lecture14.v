Set Default Goal Selector "!".
From Coq Require Import Arith.Arith.
From Coq Require Import Bool.Bool.
Require Export Coq.Strings.String.
From Coq Require Import Lists.List.
Import ListNotations.
Require Import PeanoNat.
Import Nat.

Definition total_map (A : Type) := string -> A.
Definition t_empty {A : Type} (v : A) : total_map A :=
  (fun _ => v).

Definition t_update {A : Type} (m : total_map A)
                    (x : string) (v : A) :=
  fun x' => if String.eqb x x' then v else m x'.

Notation "x '!->' v ';' m" := (t_update m x v)
                              (at level 100, v at next level, right associativity).

Definition state := total_map nat.
Definition empty_st := t_empty 0.

Axiom t_update_same : forall (A : Type) (m : total_map A) x,
  (x !-> m x ; m) = m.

Inductive aexp : Type :=
  | ANum (n : nat)
  | AId (x : string)
  | APlus (a1 a2 : aexp)
  | AMinus (a1 a2 : aexp)
  | AMult (a1 a2 : aexp).

Inductive bexp : Type :=
  | BTrue
  | BFalse
  | BEq (a1 a2 : aexp)
  | BNeq (a1 a2 : aexp)
  | BLe (a1 a2 : aexp)
  | BGt (a1 a2 : aexp)
  | BNot (b : bexp)
  | BAnd (b1 b2 : bexp).

Inductive com : Type :=
  | CSkip
  | CAsgn (x : string) (a : aexp)
  | CSeq (c1 c2 : com)
  | CIf (b : bexp) (c1 c2 : com)
  | CWhile (b : bexp) (c : com).

Inductive sinstr : Type :=
  | SPush (n : nat)
  | SLoad (x : string)
  | SPlus
  | SMinus
  | SMult.

Fixpoint aeval (st:state) (a : aexp) : nat :=
  match a with
  | ANum n => n
  | AId x => st x
  | APlus  a1 a2 => (aeval st a1) + (aeval st a2)
  | AMinus a1 a2 => (aeval st a1) - (aeval st a2)
  | AMult  a1 a2 => (aeval st a1) * (aeval st a2)
  end.

Fixpoint beval (st:state) (b : bexp) : bool :=
  match b with
  | BTrue       => true
  | BFalse      => false
  | BEq a1 a2   => (aeval st a1) =? (aeval st a2)
  | BNeq a1 a2  => negb ((aeval st a1) =? (aeval st a2))
  | BLe a1 a2   => (aeval st a1) <=? (aeval st a2)
  | BGt a1 a2   => negb ((aeval st a1) <=? (aeval st a2))
  | BNot b1     => negb (beval st b1)
  | BAnd b1 b2  => andb (beval st b1) (beval st b2)
  end.


  
Inductive ceval : state -> com -> state -> Prop :=
  | E_Skip : forall st,
      ceval st CSkip st
  | E_Asgn  : forall st a n x,
      aeval st a = n ->
      ceval st (CAsgn x a) (x !-> n ; st)
  | E_Seq : forall c1 c2 st st' st'',
      ceval st  c1 st'  ->
      ceval st' c2 st'' ->
      ceval st (CSeq c1 c2) st''
  | E_IfTrue : forall st st' b c1 c2,
      beval st b = true ->
      ceval st c1 st' ->
      ceval st (CIf b c1 c2) st'
  | E_IfFalse : forall st st' b c1 c2,
      beval st b = false ->
      ceval st c2 st' ->
      ceval st (CIf b c1 c2) st'
  | E_WhileFalse : forall b st c,
      beval st b = false ->
      ceval st (CWhile b c) st
  | E_WhileTrue : forall st st' st'' b c,
      beval st b = true ->
      ceval st c st' ->
      ceval st'(CWhile b c) st'' ->
      ceval st (CWhile b c) st''
  .


Lemma E_Asgn_eq  : forall st st' a n x,
      aeval st a = n ->
      (x !-> n ; st) = st' ->
      ceval st (CAsgn x a) st'.
Proof.
  intros.
  subst.
  apply E_Asgn.
  reflexivity.
Qed.

Definition aequiv (a1 a2 : aexp) : Prop :=
  forall (st : state),
    aeval st a1 = aeval st a2.

Definition bequiv (b1 b2 : bexp) : Prop :=
  forall (st : state),
    beval st b1 = beval st b2.

Definition cequiv (c1 c2 : com) : Prop :=
  forall (st st' : state),
    (ceval st c1 st') <-> (ceval st c2 st').


Ltac invc H := inversion H; subst; clear H.


Goal
  forall X Y s,
  ceval s (CSeq (CAsgn X (ANum 1)) (CAsgn Y (ANum 2)))
        (Y !-> 2 ; X !-> 1; s).
Proof.
  intros.
  assert (C1:
    ceval s (CAsgn X (ANum 1))
        (X !-> 1; s)
  ). {
    apply E_Asgn.
    reflexivity.
  }
  assert (C2:
    ceval (X !-> 1; s) (CAsgn Y (ANum 2))
        (Y !-> 2 ; X !-> 1; s)
  ). {
    apply E_Asgn.
    reflexivity.
  }
  apply E_Seq with (st':=(X !-> 1; s)).
  - assumption.
  - assumption.
Qed.

Goal
  forall c : com, cequiv (CSeq CSkip c) c.
Proof.
  intros.
  split.
  all: intros H.
  - invc H.
    invc H3.
    rename st'0 into st.
    assumption.
  - assert (ceval st CSkip st). {
      apply E_Skip. (* constructor. *)
    }
    apply E_Seq with (st':=st).
    + assumption.
    + assumption.
Qed.


Definition Assertion := state -> Prop.

Definition X : string := "X".
Definition Y : string := "Y".
Definition RES : string := "RES".
Open Scope string.

Definition assertion_example (st:state) : Prop := 
  st "RES" = st "X" * st "Y".

Definition hoare_triple (P:Assertion) (c:com) (Q:Assertion) : Prop :=
  forall st st',
  P st ->          (* If [P st] holds *)
  ceval st c st' -> (* And [c] runs with an input state [st] yielding a state [st'] *)
  Q st'.           (* Then [Q st'] holds *)

Definition example1 : Prop :=
  hoare_triple (fun st => True) (CAsgn "X" (ANum 3))
               (fun st' => st' "X" = 3).

Lemma t_update_eq:
  forall x n (st:state),
  (x !-> n; st) x = n.
Proof.
  intros.
  unfold t_update.
  destruct (x =? x) eqn:eq1.
  - reflexivity.
  - apply String.eqb_neq in eq1.
    contradiction.
Qed.

Goal example1.
Proof.
  unfold example1.
  unfold hoare_triple.
  intros.
  invc H0.
  simpl.
  apply t_update_eq.
Qed.

Theorem hoare_skip:
  forall P,
  hoare_triple P CSkip P.
Proof.
  intros.
  unfold hoare_triple.
  intros.
  invc H0.
  assumption.
Qed.

Theorem hoare_seq:
  forall P Q R c1 c2,
  hoare_triple P c1 Q ->
  hoare_triple Q c2 R ->
  hoare_triple P (CSeq c1 c2) R.
Proof.
  unfold hoare_triple.
  intros P Q R c1 c2 ht1 ht2 st1 st3 Pholds c1c2Runs.
  invc c1c2Runs.
  rename H2 into c1runs.
  rename H4 into c2runs.
  assert (Q st'). {
    apply ht1 with (st:=st1).
    all: assumption.
  }
  apply ht2 with (st:=st').
  all: assumption.
Qed.

Definition assn_subst X a (P:Assertion) : Assertion :=
  fun (st : state) =>
    P (X !-> aeval st a ; st).

Theorem hoare_assign:
  forall P x a,
  hoare_triple
    (assn_subst x a P) (* P[X |-> a] *)
    (CAsgn x a)
    P.
Proof.
  unfold hoare_triple, assn_subst.
  intros.
  invc H0.
  assumption.
Qed.













