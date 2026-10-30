# QUSM isolated evaluation (paper only)

This branch adds the user's exact QUSM one-liner without replacing any existing execution code. The original total TM and Trader_42 programs remain unchanged.

Run: `bash qusm/original_one_liner.sh 1000`

Expected: valid JSON with model=Quantum Ultimate Schumann Machine and fixed_point_encoding=true. This checks encoding roundtrip only, not program self-reference.

Trading safeguards: DO NOT enable live mode. Keep TRADING_MODE=paper, LIVE_DRY_RUN=1, LIVE_ARMED=0 and KILL active. Do not add exchange credentials to CI. No CI/CD workflow or production service is changed by this branch.

Before any merge: independently validate original source fidelity, numerical edge cases, tests, existing deployment triggers, and all order-sending paths. A successful QUSM computation is not a market signal.
