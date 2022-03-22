
 
Inductive aexp : Type :=
  | ANum : nat -> aexp
  | APlus : aexp -> aexp -> aexp
  | AMinus : aexp -> aexp -> aexp
  | AMult : aexp -> aexp -> aexp. 


Fixpoint aeval (a : aexp) : nat :=
  match a with
  | ANum n => n
  | APlus a1 a2 => (aeval a1) + (aeval a2)
  | AMinus a1 a2 => (aeval a1) - (aeval a2)
  | AMult a1 a2 => (aeval a1) * (aeval a2)
  end.

Goal aeval (APlus (ANum 1) (AMult (ANum 2) (ANum 3))) = 7.
Proof.  reflexivity. Qed.


Fixpoint optimize_0plus (a:aexp) : aexp :=
  match a with
  | ANum n => ANum n
  | APlus (ANum 0) e2 => optimize_0plus e2
  | APlus e1 e2 => APlus (optimize_0plus e1) (optimize_0plus e2)
  | AMinus e1 e2 => AMinus (optimize_0plus e1) (optimize_0plus e2)
  | AMult e1 e2 => AMult (optimize_0plus e1) (optimize_0plus e2)
  end.


(* 2 + (0 + (0 + 1)) = 2 + 1 *)
Goal optimize_0plus (APlus (ANum 2) (APlus (ANum 0) (APlus (ANum 0) (ANum 1))))
  = APlus (ANum 2) (ANum 1).
Proof. reflexivity. Qed.


Theorem optimize_0plus_sound: forall a,
  aeval (optimize_0plus a) = aeval a.
Proof.
  (* The proof follows by induction on the structure of [a]. *)
  (* The cases where a is not [APlus] follow trivially by applying
    the induction hypothesis. *)
  (* Note: use info_note to look at the generated proof script. *)
  intros a. induction a; simpl; auto.
  (* The interesting case is when a = a1 + a2. *)
  simpl.
  (* We do a case analysis on the structure of [a1]. *)
  (* The interesting case here is when a1 = ANum n, for the remaining cases
     we use the induction hypothesis. *)
  destruct a1; simpl; auto.
  (* Finally, we do a case analysis on the structure of [n].
     When n is a successor of some [n'], then we just use the induction hypothesis
     When n = 0, the proof follows by applying the definition to simplify the expression,
     and then applying the induction hypothesis. *)
  destruct n; simpl; auto.
Qed.

Reserved Notation "a '\\' n"
 (at level 50, left associativity).
Inductive aevalR : aexp -> nat -> Prop :=
| E_ANum : forall (n:nat),
    ANum n \\ n
| E_APlus : forall (a1 a2: aexp) (n1 n2 : nat),
    a1 \\ n1 -> a2 \\ n2 -> APlus a1 a2 \\ (n1 + n2)
| E_AMinus : forall (a1 a2: aexp) (n1 n2 : nat),
    a1 \\ n1 -> a2 \\ n2 -> AMinus a1 a2 \\ (n1 - n2)
| E_AMult :  forall (a1 a2: aexp) (n1 n2 : nat),
    a1 \\ n1 -> a2 \\ n2 -> AMult a1 a2 \\ (n1 * n2)
where "a '\\' n" := (aevalR a n) : type_scope.

Theorem aevalR_to_aeval : forall a n,
  (a \\ n) -> aeval a = n.
Proof.
  intros.
  induction H.
  - reflexivity.
  - simpl.
    rewrite IHaevalR1.
    rewrite IHaevalR2.
    reflexivity.
  - simpl.
    rewrite IHaevalR1.
    rewrite IHaevalR2.
    reflexivity.
  - simpl.
    rewrite IHaevalR1.
    rewrite IHaevalR2.
    reflexivity.
Qed.

Theorem aeval_to_aevalR : forall a n,
  aeval a = n -> a \\ n.
Proof.
  induction a; intros; simpl in H;
  rewrite <- H;
  auto using E_ANum, E_APlus, E_AMinus, E_AMult.
Qed.


Theorem aeval_iff_aevalR : forall a n,
  (a \\ n) <-> aeval a = n.
Proof.
  split.
  - apply aevalR_to_aeval.
  - apply aeval_to_aevalR.
Qed.

Inductive Opt_0plus: aexp -> aexp -> Prop :=
(* No optimization *)
| opt_0plus_skip: forall n, Opt_0plus (ANum n) (ANum n)
(* Optmize *)
| opt_0plus_do: forall a, Opt_0plus (APlus (ANum 0) a) a
(* Recurse *)
| opt_0plus_plus:
  forall a1 a2 a1' a2',
  Opt_0plus a1 a1' ->
  Opt_0plus a2 a2' ->
  Opt_0plus (APlus a1 a2) (APlus a1 a2')
| opt_0plus_minus:
  forall a1 a2 a1' a2',
  Opt_0plus a1 a1' ->
  Opt_0plus a2 a2' ->
  Opt_0plus (AMinus a1 a2) (AMinus a1' a2')
| opt_0plus_mult: forall a1 a2 a1' a2',
  Opt_0plus a1 a1' ->
  Opt_0plus a2 a2' ->
  Opt_0plus (AMult a1 a2) (AMult a1' a2').
















