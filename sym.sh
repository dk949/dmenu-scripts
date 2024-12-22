#bin/sh

printf "≤ ≥ ≠ ≈ ∞ ∧ ∨ ¬ ≡ ⌊ ⌋ ↓ ↑ ← → ↤ ↦ ⇐ ⇒ ⇔ ↔ ∃ ∀ ∴ • Ø ℕ ℤ ∈ ∉ ⊆ ⊂ ⊎ ∪ ∩ □ × °" | tr " " "\n" | dmenu -c -l 7 -g 6 | tr -d '\n' | xclip -i -selection c
xdotool key "Control_L+V"
