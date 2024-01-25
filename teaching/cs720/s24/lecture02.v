Inductive bool := true | false.

(* Use Print to the code of a definition (how a data-type is defined, or a function) *)
Print bool.

(* Inductive bool : Set :=  true : bool | false : bool. *)
(* Use Check to know of its type *)
Check true.
(*  true: bool *)


Definition andb (b1:bool) (b2:bool) : bool :=
 (* match b1 with
  | true => b2
  | false => false
  end
**)
  (*
  match b1, b2 with
  | true, true => true
  | true, false => false
  | false, true => false
  | false, false => false
  end
  *)
  match b1, b2 with
  | true, true => true
  | _, _ => false
  end
.

Goal
  forall (b:bool),
  andb false b = false.
Proof.
  intros b.
  simpl.
  Print andb.
  reflexivity.
Qed.

Goal
  forall b,
  andb true b = b.
Proof.
  intros b.
  Print andb.
  simpl.
  destruct b.
  {
    reflexivity.
  }
  {
    reflexivity.
  }
Qed.

 Inductive rgb : Type :=
   | red : rgb
   | green : rgb
   | blue : rgb.

Definition flip (r:rgb) : rgb :=
  match r with
  | red => green
  | green => blue
  | blue => red
  end.

 Inductive color : Type :=
   | black : color
   | white : color
   | primary : rgb -> color.


Compute (primary red).

Compute (primary (flip red)).



 Definition monochrome (c : color) : bool :=
   match c with
   | black => true
   | white => true
   (*| primary p => false *)
   (*| primary red
   | primary green
   | primary blue => false*)
   | primary _ => false
   end.

Inductive color_pair :=
  | pair_of_rgb : rgb -> rgb -> color_pair
  | pair_of_bool: bool -> bool -> color_pair
  .
  
Compute (pair_of_rgb red blue).
Compute (pair_of_bool true false).

Inductive natural : Type :=
 | zero : natural
 | succ: natural -> natural.
 
Definition ONE := succ zero.
Definition TWO := succ ONE.
Definition THREE := succ TWO.
Definition FOUR := succ THREE.
Definition FIVE := succ FOUR.

Definition is_zero n : bool :=
  match n with
  | zero => true
  | _ => false
  end.

Goal is_zero ONE = false.
Proof.
  simpl.
  reflexivity.
Qed.  

Fixpoint addition n1 n2 :=
  match n1 with
  | zero => n2
  | succ n1' => succ (addition n1' n2)
  end.

Goal
  addition zero FOUR = FOUR.
Proof.
  simpl.
  reflexivity.
Qed.

Goal
  addition zero FOUR = FIVE.
Proof.
  simpl.
  Fail reflexivity.
Abort.

Theorem plus_O_n : forall n, addition zero n = n.
Proof.
  intros n.
  simpl.
  reflexivity.
Qed.

Theorem plus_id_example : forall n m,
  n = m ->
  addition n n = addition m m.
Proof.
  intros n.
  intros m.
  intros Ha.
  rewrite <- Ha.
  reflexivity.
Qed.

Goal
  addition TWO THREE = FIVE.
Proof.
  simpl.
  reflexivity.
Qed.


Goal
  forall n,
  succ (addition zero n) = succ n.
Proof.
  intros n.
  rewrite plus_O_n.
  reflexivity.
Qed.

