Theorem eq_trans : forall (T:Type) (x y z : T),
  x = y -> y = z -> x = z.
Proof.
  intros T x y z eq1 eq2.
  rewrite -> eq1.
  apply eq2.
  (*
  rewrite -> eq2.
  reflexivity.
  *)
Qed.


Theorem eq_trans2 : forall (T:Type) (x y z : T),
  x = y -> z = y -> x = z.
Proof.
  intros T x y z eq1 eq2.
  rewrite -> eq1.
  (* y = z *)
   (* symmetry. *)
  symmetry in eq2.
  apply eq2.
Qed.

Theorem ex1:
  forall (P:Prop) (Q:Prop),
  (P -> Q) ->
  P ->
  Q.
Proof.
  intros P Q hyp_P_impl_Q hyp_P.
  apply hyp_P_impl_Q.
  apply hyp_P.
Qed.

Definition ex2 (P:Prop) (Q:Prop) (hyp_P_impl_Q: P -> Q) (hyp_P: P)
: Q
:=
  hyp_P_impl_Q hyp_P
.

Theorem eq_trans_3 : forall (T:Type) (x y z: T),
  (x = y -> y = z -> x = z) -> (* eq1 *)
  x = y ->                     (* eq2 *)
  y = z ->                     (* eq3 *)
  x = z.
Proof.
  intros T x y z eq1 eq2 eq3.
  rewrite -> eq1.   (* x = y -> y = z -> x = z *)
  
  + reflexivity.
  + apply eq2.
  +    assumption.
    (* apply eq3.*)
(*
  1: reflexivity.
  1, 2: assumption.
*)
Qed.

Theorem eq_trans_nat : forall (x y z: nat),
  x = 1 ->
  x = y ->
  y = z ->
  z = 1.
Proof.
  intros x y z eq1 eq2 eq3.
  assert (eq4: x = z). {
    apply eq_trans with (y:=y).
    - assumption.
    - assumption.
  }
  rewrite <- eq4.
  assumption.
Qed.

Theorem S_injective : forall (n m : nat),
  S n = S m ->
  n = m.
Proof.
  intros n m eq1.
  injection eq1 as eq1.
  assumption.
Qed.
Locate "+".
Check 0 + 1.
Print Nat.add.
Goal
  forall n,
  S n <> 0.
Proof.
  intros n.
  unfold not.
  intros Contra.
  discriminate Contra.
Qed.
  
  
  
  
  
  
  
  
  
  
  
  