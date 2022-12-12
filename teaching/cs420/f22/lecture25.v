Require Import Turing.Turing.

Lemma decidable_to_recognizable:
  forall L,
  Decidable L ->
  Recognizable L.
Proof.
  intros.
  destruct H as (m, H).
  destruct H as (Hr, Hd).
  exists m.
  assumption.
Qed.

Lemma unrecognizable_to_undecidable:
  forall L,
   ~ Recognizable L ->
   ~ Decidable L.
Proof.
  intros.
  intros N.
  apply decidable_to_recognizable in N.
  contradiction.
Qed.