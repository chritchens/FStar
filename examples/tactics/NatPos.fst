module NatPos

open FStar.Tactics

let n : nat = synth_by_tactic (fun () -> exact (`1))
