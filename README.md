# SOLUTION(s) = s — Independent 2KB Fixed-Point System

**Location:** https://github.com/letsgo0226/SOLUTION_S_EQ_S_2KB

## Core
- `solution_s_eq_s_2KB.sh` — basic fixed point: solution(s) = s
- `PROOF_solution_s_eq_s.txt` — proof of the equation

## Self-encoding extension
- `solution_self_encode_2KB.sh` — the solver computes E257 and SHA256 of its own program body and embeds them inside the fixed point s
- `PROOF_self_encoding.txt` — formal statement of the self-referential closure

## Run
```bash
sh solution_s_eq_s_2KB.sh
sh solution_self_encode_2KB.sh
```

Formal model only. H=0.
