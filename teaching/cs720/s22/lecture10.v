Inductive ev : nat -> Prop :=
| ev_0 : ev 0
| ev_SS :
  forall {n : nat},
  ev n ->
  ev (S (S n)).

Definition proof1: ev 6.
Proof.
  (*
  apply ev_SS.
  apply ev_SS.
  apply ev_SS.
  apply ev_0.
  *)
  (*
  constructor.
  constructor.
  constructor.
  constructor.
  *)
  repeat constructor.
Qed.

Definition proof2 : ev 6 :=
  ev_SS (ev_SS (ev_SS ev_0)).

Definition proof3: ev 6000.
Proof.
  repeat constructor.
Qed.


Lemma inductive_step:
  forall n,
  n + 0 = n ->
  S n + 0 = S n.
Proof.
  intros.
  simpl.
  f_equal.
  apply H.
Qed.

Definition inductive_step':
  forall n,
  n + 0 = n ->
  S n + 0 = S n
:=
  (fun n H => f_equal S H).

Definition n_plus_0 :
  forall n,
  n + 0 = n.
Proof.
  induction n. { reflexivity. }
  simpl.
  f_equal.
  apply IHn.
Qed.

Lemma base_case:
  0 + 0 = 0.
Proof.
  reflexivity.
Qed.

Definition n_plus_0' :
  forall n,
  n + 0 = n
:= 
  (* An intros corresponds to a function that takes a paremeter *)
  fun n =>
  (* We want to do a proof by induction, so we use the induction principle
     for natural numbers. *)
  nat_ind
  (* What is the proposition we are trying to prove? *)
  (fun x => x + 0 = x)
  (* In the base case, we want to show that 0 = 0, so here's the proof of that *)
  (eq_refl 0)
  (* Prove the inductive step *)
  (fun (n':nat) (IH:n' + 0 = n') =>
    (* We need to show:

         S n' + 0 = S n'
     *)
    (f_equal S IH)
  )
  (* What are we doing induction on: *)
  n.



(* ----------------------------------------------------------------------- *)

Fixpoint even (n:nat) : bool :=
  match n with
  | O        => true
  | S O      => false
  | S (S n') => even n'
  end.

(* PROOF BY INDUCTION ON THE PROPOSITION VS ON THE DATA TYPE *)

Theorem ev_to_even:
  forall n,
  ev n ->
  even n = true.
Proof.
  intros.
  induction H. {
    reflexivity.
  }
  apply IHev.
Qed.

Theorem evenb_to_ev:
  forall n,
  even n = true ->
  ev n.
Proof.
  intros.
  induction n. {
    constructor.
  }
Abort.

Fixpoint double (n:nat) :=
  match n with
  | O => O
  | S n' => S (S (double n'))
  end.

Lemma double_is_ev:
  forall n,
  ev (double n).
Proof.
  intros n.
  induction n. {
    simpl.
    apply ev_0.
  }
  simpl.
  apply ev_SS.
  apply IHn.
Qed.

Lemma even_double : forall k, even (double k) = true.
Proof.
  intros k. induction k as [|k' IHk'].
  - reflexivity.
  - simpl. apply IHk'.
Qed.

Lemma even_double_conv : forall n, exists k,
  n = if even n then double k else S (double k).
Proof.
Admitted.

Theorem even_to_ev:
  forall n,
  even n = true ->
  ev n.
Proof.
  intros n H.
  destruct (even_double_conv n) as [k Hk].
  rewrite Hk. rewrite H. apply double_is_ev.
Qed.

Corollary ev_even_rw:
  forall n,
  ev n <-> even n = true.
Proof.
  split.
  - apply ev_to_even.
  - apply even_to_ev.
Qed.

Goal even 6000 = true.
Proof. reflexivity. Qed.

Require Import Setoid.
Goal ev 6000.
Proof.
  rewrite ev_even_rw.
  reflexivity.
Qed.


Inductive reflect (P : Prop) : bool -> Prop :=
| ReflectT : P -> reflect P true
| ReflectF : ~ P -> reflect P false.

Theorem iff_reflect : forall P b, (P <-> b = true) -> reflect P b. Admitted.
Theorem reflect_iff : forall P b, reflect P b -> (P <-> b = true). Admitted.

Lemma ev_reflect :
  forall n, reflect (ev n) (even n).
Proof.
  intros n.
  apply iff_reflect.
  apply ev_even_rw.
Qed.


Lemma reflect_true:
  forall P,
  reflect P true ->
  P.
Proof.
  intros.
  inversion H.
  apply H0.
Qed.

Theorem ev_600_refl: ev 600.
Proof.
  assert (H:= ev_reflect 600).
  apply reflect_true.
  simpl in H.
  apply H.
Qed.

Lemma reflect_and:
  forall P b1 Q b2,
  reflect P b1 ->
  reflect Q b2 ->
  reflect (P /\ Q) (andb b1 b2).
Proof.
  intros.
  inversion H. {
    subst.
    simpl.
    inversion H0. {
      subst.
      apply ReflectT.
      intuition.
    }
    inversion H0. {
      subst.
      inversion H5.
    }
    subst.
    apply ReflectF.
    unfold not. intros N.
    destruct N.
    contradiction.
  }
  simpl.
  apply ReflectF.
  unfold not. intros N.
  destruct N.
  contradiction.
Qed.

Lemma reflect_or:
  forall P b1 Q b2,
  reflect P b1 ->
  reflect Q b2 ->
  reflect (P \/ Q) (orb b1 b2).
Proof.
  intros.
  inversion H. {
    simpl.
    apply ReflectT, or_introl, H1.
  }
  subst.
  simpl.
  inversion H0. {
    subst.
    apply ReflectT, or_intror, H2.
  }
  subst.
  apply ReflectF.
  intuition.
Qed.

Inductive Lang : Type :=
| Eq: nat -> nat -> Lang      (* x = n  *)
| Even: nat -> Lang           (* ev n   *)
| And: Lang -> Lang -> Lang   (* P /\ Q *)
| Or: Lang -> Lang -> Lang.   (* P \/ Q *)

Compute Eq 0 1.

Fixpoint eval (exp:Lang) : bool :=
  match exp with
  | Eq n m => Nat.eqb n m
  | Even n => even n
  | And l r => andb (eval l) (eval r)
  | Or l r => orb (eval l) (eval r)
  end.

Goal eval (Or (Even 3) (Eq 3 3)) = true.
  reflexivity.
Qed.

Fixpoint as_prop (exp:Lang) :=
  match exp with
  | Eq n m => n = m
  | Even n => ev n
  | And l r => as_prop l /\ as_prop r
  | Or l r => as_prop l \/ as_prop r
  end.

Compute as_prop (Or (Even 3) (Eq 3 3)).

Goal as_prop (Or (Even 3) (Eq 3 3)).
  (* ev 3 \/ 3 = 3 *)
  simpl.
  intuition.
Qed.

Lemma reflect_lang:
  forall p,
  reflect (as_prop p) (eval p).
Proof.
  intros.
  induction p; simpl.
  - admit.
  - apply ev_reflect.
  - apply reflect_and.
    + apply IHp1.
    + apply IHp2.
  - apply reflect_or.
    + apply IHp1.
    + apply IHp2.
Admitted.

Goal ev 3 \/ 3 = 3.
Proof.
  assert (H:=reflect_lang (Or (Even 3) (Eq 3 3))).
  simpl in H.
  apply reflect_true, H.
Qed.

Ltac trans P :=
  match P with
    | ?P1 /\ ?P2 =>
      let t1 := trans P1 in
      let t2 := trans P2 in constr:(And t1 t2)
    | ev ?x => constr:(Even x)
    | ?P1 \/ ?P2 =>
      let t1 := trans P1 in
      let t2 := trans P2 in constr:(Or t1 t2)
    | ?x = ?y => constr:(Eq x y)
  end.

Goal ev 3 \/ 3 = 3.
Proof.
  let t := trans (ev 3 \/ 3 = 3) in
  assert (H:= reflect_lang t).
  apply reflect_true, H.
Qed.

Ltac solve :=
  match goal with
    | [ |- ?P ] =>
      let t := trans P in
      let H := fresh "H" in
      assert (H := reflect_lang t);
      apply reflect_true, H
  end.

Goal ev 3 \/ 3 = 3.
  solve.
Qed.



Definition asd (P:Type) :=
  match P with
  | P /\ Q => 1
  | _ => 0
  end.
   

