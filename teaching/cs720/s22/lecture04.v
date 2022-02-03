Require Import Nat.

Theorem ex8:
  forall n : nat,
  0 =? (n + 1) = false.
Proof.
  intro n.
  Print Nat.eqb.
  Print Nat.add.
  (* Can you evaluate here? *)
  simpl.
  Print Nat.eqb.
  Print Nat.add.
Abort.

Theorem ex9:
  forall (f : bool -> bool),
  (forall (x : bool), f x = x) ->
  forall (b : bool), f (f b) = b.
Proof.
  intros.
  (* Can you evaluate here? *)
Abort.

Inductive natlist :=
| nil: natlist
| cons : nat -> natlist -> natlist.

Inductive natoption :=
| Some: nat -> natoption
| None : natoption.

Inductive loob :=
| falsE
| truE.

Definition andb (b1 b2:loob) :=
 if b1 then b2 else falsE.

Definition is_some (o:natoption) :=
  if o then true else false.

Compute is_some (Some 1).
Compute is_some None.


Compute andb truE truE.

 Fixpoint indexof elem (l:natlist) : natoption :=
   match l with
   | nil => None
   | cons first t =>
     if Nat.eqb first elem
     then Some 0
     else
      match indexof elem t with
      | None => None
      | Some x => Some (S x)
      end
   end.

Module X.

  Inductive list (T:Type) :=
  | nil: list T
  | cons : T -> list T -> list T.

  Arguments nil {T}.
  Arguments cons {T} _ _.

  Check nil.

  Compute nil.
  Compute @nil nat.

(*   Compute (cons nat 1 (nil nat)). *)
  Compute (cons 1 nil).

  Fixpoint length {T:Type} (l:list T) : nat :=
  match l with
  | nil => 0
  | cons x l => S (length l)
  end.

  Inductive option (T:Type) :=
  | Some: T -> option T
  | None.

  Arguments Some {_} _.
  Arguments None {_}.

 Fixpoint filter {X:Type} (test: X->bool) (l:list X) : (list X) :=
  match l with
  | nil => nil
  | cons h  t =>
    if test h
    then cons h (filter test t)
    else         filter test t
  end.

  Definition keep_1_3 (n:nat) : bool :=
    match n with
    | 1 | 3 => true
    | _ => false
    end.

  Definition keep_1_3' (n:nat) : bool :=
    if Nat.eqb n 1 then true
    else if Nat.eqb n 3 then true
    else false.

  Definition keep_1_3'' (n:nat) : bool :=
    orb (Nat.eqb n 1) (Nat.eqb n 3).

  Compute filter keep_1_3 (cons 10 (cons 1 (cons 3 (cons 4 (cons 1 nil))))).
  Compute filter keep_1_3' (cons 10 (cons 1 (cons 3 (cons 4 (cons 1 nil))))).
  Compute filter keep_1_3'' (cons 10 (cons 1 (cons 3 (cons 4 (cons 1 nil))))).


  Lemma are_they_equal:
    forall n,
    keep_1_3 n = keep_1_3' n.
  Proof.
    intros.
    unfold keep_1_3'.
    destruct n.
    - simpl.
      reflexivity.
    - simpl.
      destruct n.
      + simpl.
        reflexivity.
      + destruct n.
        * reflexivity.
        * simpl.
          destruct n.
          -- simpl.
             reflexivity.
          -- simpl.
             reflexivity.
  Qed.

End X.


   
   
   
   
   











