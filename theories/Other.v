(** * Other: Demonstrating module imports and selective exports *)

Require Import Hello.Main(double_negation).

(** Reflexivity proof, verifying that imported theorems are accessible. *)
Theorem refl : double_negation = double_negation.
Proof.
  reflexivity.
Qed.

(** [three] is not exported from Main, so this correctly fails. *)
Fail Check three.
