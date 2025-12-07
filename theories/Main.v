(** * Main: Core library definitions and theorems *)

Require Import Utf8.

(** Triple negation elimination: a classic exercise in propositional logic. *)
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
