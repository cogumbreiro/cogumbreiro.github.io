Theorem n_lt_m:
  forall n m,
  n < m ->
  n < m.
Proof.
  intros.
  apply H.
Qed.


Theorem eq_trans : forall (T:Type) (x y z : T),
  x = y -> y = z -> x = z.
Proof.
  intros T x y z eq1 eq2.
  rewrite -> eq1.
  apply eq2.
Qed.

Theorem eq_trans_2 : forall (T:Type) (x y z: T),
  (x = y -> y = z -> x = z) -> (* eq1 *)
  x = y ->                     (* eq2 *)
  y = z ->                     (* eq3 *)
  x = z.
Proof.
  intros T x y z eq1 eq2 eq3.
  apply eq1.   (* x = y -> y = z -> x = z *)
  - apply eq2.
  - apply eq3.
Qed.

  
Theorem eq_trans_3 : forall (T:Type) (x y z: T),
  (x = y -> y = z -> x = z) -> (* eq1 *)
  x = y ->                     (* eq2 *)
  y = z ->                     (* eq3 *)
  x = z.
Proof.
  intros T x y z eq1 eq2 eq3.
  rewrite -> eq1.
  - reflexivity.
  - rewrite -> eq2. reflexivity.
  - apply eq3.
Qed.

Theorem eq_trans_nat : forall (a b c: nat),
  a = 1 ->
  a = b ->
  b = c ->
  c = 1.
Proof.
  intros a b c eq1 eq2 eq3.
  assert (eq4: a = c). {
    apply eq_trans with (y:=b).
    - (* x = y *) apply eq2.
    - (* y = z *) apply eq3.
  }
  (* ... *)
Admitted.


Theorem eq_trans_nat4 : forall (a b c: nat),
  a = 1 ->
  a = b ->
  b = c ->
  c = 1.
Proof.
  intros a b c eq1 eq2 eq3.
  assert (eq4: a = c). {
    transitivity b.
    - (* x = y *) apply eq2.
    - (* y = z *) apply eq3.
  }
  rewrite <- eq4.
  apply eq1.
Qed.


Theorem eq_trans_nat3 : forall (x y z: nat),
  x = 1 ->
  x = y ->
  y = z ->
  1 = z.
Proof.
  intros x y z eq1 eq2 eq3.
  assert (eq4: x = z). {
    apply eq_trans with (y:=y).
    - apply eq2.
    - apply eq3.
  }
  rewrite <- eq4.
  symmetry.
  apply eq1.
Qed.

Theorem silly3' : forall (n : nat),
  (Nat.eqb n 5 = true -> Nat.eqb (S (S n)) 7 = true) ->
  true = Nat.eqb n 5  ->
  true = Nat.eqb (S (S n)) 7.
Proof.
  intros n eq H.
  symmetry in H.
  apply eq in H.
  symmetry.
  apply H.
Qed.

Theorem S_injective : forall (n m : nat),
  S n = S m ->
  n = m.
Proof.
  intros n m eq1.
  injection eq1 as eq1.
  apply eq1.
Qed.

Theorem s_z:
  1 = 2 -> 1 = 3.
Proof.
  intros.
  discriminate H.
Qed.

Theorem eqb_0_l : forall n,
   Nat.eqb 0 n = true -> 0 = n.
Proof.
  intros n eq1.
  simpl in eq1.
  destruct n.
  - reflexivity.
  - discriminate eq1.
Qed.
  
  
  
  
  
  
  