Inductive rgb :=
  | Red
  | Green
  | Blue.
  
Compute Red.

Inductive boolean :=
  | true
  | false.
 
Inductive Byte :=
  | x0
  | x1
  | x2
  | x3
  | x4
  | x5
  | x6
  | x7.

Definition inc_byte b :=
  match b with
  | x0 => x1
  | x1 => x2
  | x2 => x3
  | x3 => x4
  | x4 => x5
  | x5 => x6
  | x6 => x7
  | x7 => x0
  end.
Check inc_byte.
Compute inc_byte (inc_byte x5).

Theorem theorem1 :
  inc_byte (inc_byte x5) = x7.
Proof.
  simpl. (* by definition inc_byte *)
  reflexivity.
Qed.


Definition byte_to_number (b:Byte) : nat :=
  match b with
  | x0 => 0
  | x1 => 1
  | x2 => 2
  | x3 => 3
  | x4 => 4
  | x5 => 5
  | x6 => 6
  | x7 => 7
  end.

Compute byte_to_number x5.

Theorem theorem2 :
  2 + (byte_to_number x5) = 7.
Proof.
  simpl. (* by definition inc_byte *)
  reflexivity.
Qed.

Locate "+".

Print byte_to_number.
Print Nat.add.

