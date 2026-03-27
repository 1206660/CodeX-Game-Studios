# Milestone: Prototype Foundation

## Overview

- **Target Date**: 2026-04-24
- **Type**: Prototype
- **Duration**: 4 weeks
- **Number of Sprints**: 2

## Milestone Goal

Build a first playable notebook district that proves the central Paper Trail
Express fantasy: drawing a temporary route, riding it for speed, and surviving
the erasers that notice it.

## Success Criteria

- [ ] One playable notebook district exists with a start, three pickups, and one mailbox extraction
- [ ] Ink trails feel meaningfully faster than normal movement and remain readable during pressure
- [ ] At least one eraser enemy reliably responds to fresh ink without feeling unfair
- [ ] Players can complete a full run in under 10 minutes after onboarding
- [ ] All S1 and S2 bugs resolved
- [ ] Performance within budget on target hardware
- [ ] Build stable for 3 consecutive days

## Feature List

### Must Ship (Milestone Fails Without These)

| Feature | Design Doc | Owner | Sprint Target | Status |
|---------|-----------|-------|--------------|--------|
| Player Controller | Pending | gameplay-programmer | Sprint 1 | Planned |
| Ink Trail System | Pending | gameplay-programmer | Sprint 1 | Planned |
| Pickup and Delivery Objective System | Pending | game-designer | Sprint 1 | Planned |
| Eraser Pursuit AI | Pending | ai-programmer | Sprint 1 | Planned |
| HUD and Run Feedback | Pending | ui-programmer | Sprint 1 | Planned |

### Should Ship (Planned but Cuttable)

| Feature | Design Doc | Owner | Sprint Target | Cut Impact | Status |
|---------|-----------|-------|--------------|-----------|--------|
| Run Scoring and Grade System | Pending | systems-designer | Sprint 2 | Lower replay value | Planned |
| Audio Feedback System | Pending | sound-designer | Sprint 2 | Lower personality | Planned |
| Main Menu and Restart Flow | Pending | ui-programmer | Sprint 2 | Prototype feels rougher | Planned |

## Risk Register

| Risk | Probability | Impact | Mitigation | Owner | Status |
|------|------------|--------|-----------|-------|--------|
| Ink trails feel fiddly instead of expressive | Medium | Major | Prototype immediately and tune point spacing plus boost values | producer | Open |
| Doodle visuals become unreadable in motion | Medium | Major | Capture screenshots from every tuning pass and simplify aggressively | art-director | Open |
