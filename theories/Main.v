(** * Main: Core library definitions and theorems *)

Require Import Utf8.

(** Triple negation elimination: a classic exercise in propositional logic. *)
Theorem double_negation : ∀ P : Prop, ¬ ¬ ¬ P -> ¬ P.
Proof.
  intros P Hnnn Hp.
  apply Hnnn.
  intro Hnp.
  exact (Hnp Hp).
Qed.

Definition three := 3.
