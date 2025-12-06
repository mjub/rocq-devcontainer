Require Import Utf8.

Theorem double_negation : ∀ P : Prop, ¬ ¬ ¬ P -> ¬ P.
Proof.
  intro.
  unfold not.
  intro.
  intro.
  apply H.
  intro.
  apply H1.
  exact H0.
Qed.

Definition three := 3.
