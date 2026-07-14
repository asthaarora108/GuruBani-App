# Troubleshooting Log

## 2026-07-14 — Marker digits mismatched script family
- **Failure mode:** Generated Gurmukhi stanzas showed a lone ASCII "1 ॥" line instead of ॥੧॥ glued to the last verse line.
- **Signal:** Visible in simulator screenshot of Study mode; the digit-glue logic in `tools/generate_bani_data.py` only recognized Gurmukhi digits (੦-੯), but the marker had already been converted to ASCII.
- **Prevention rule:** When a pipeline normalizes text (script conversion, stripping), downstream steps must operate on the same representation — re-verify rendered output visually after any data regeneration.

## 2026-07-14 — xcodebuild run from wrong directory
- **Failure mode:** `xcodebuild -scheme GuruBani` failed with "does not contain an Xcode project" after a `cd` into the scratchpad; a stale build was then installed to the simulator.
- **Signal:** `grep -c "error:"` returned a count but exit code 0, so the `&&` chain continued past the failed build.
- **Prevention rule:** Always run `xcodebuild` from `GuruBani.swiftpm/`, and gate install/launch on `BUILD SUCCEEDED`, not on grep exit codes.
