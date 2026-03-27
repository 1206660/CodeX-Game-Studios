# Sprint 01 -- 2026-03-30 to 2026-04-10

## Sprint Goal

Ship a first playable prototype that proves the notebook courier loop is fun enough to carry the project into vertical slice planning.

## Milestone Context

- **Current Milestone**: Prototype Foundation
- **Milestone Deadline**: 2026-04-24
- **Sprints Remaining**: 2

## Capacity

| Resource | Available Days | Allocated | Buffer (20%) | Remaining |
|----------|---------------|-----------|-------------|-----------|
| Programming | 8 | 6.5 | 1.5 | 0 |
| Design | 4 | 3.0 | 1.0 | 0 |
| Art | 2 | 1.5 | 0.5 | 0 |
| Audio | 1 | 0.5 | 0.5 | 0 |
| QA | 2 | 1.5 | 0.5 | 0 |
| **Total** | **17** | **13.0** | **4.0** | **0** |

## Tasks

### Must Have (Critical Path)

| ID | Task | Agent/Owner | Est. Days | Dependencies | Acceptance Criteria | Status |
|----|------|-------------|-----------|-------------|-------------------|--------|
| S01-001 | Bootstrap concept, pillars, engine pin, milestone, and systems index | producer | 1.0 | None | All core planning files exist and are internally consistent | Done |
| S01-002 | Build playable courier movement and ink trail prototype | gameplay-programmer | 2.0 | S01-001 | Player can move, draw ink, gain speed on fresh trails, and complete a run | Done |
| S01-003 | Implement eraser pursuit and fail-state loop | ai-programmer | 1.5 | S01-002 | At least one eraser reacts to fresh ink and creates recoverable pressure | Done |
| S01-004 | Add pickup, mailbox, and HUD feedback | ui-programmer | 1.0 | S01-002 | Prototype clearly communicates objectives, ink, and completion state | Done |
| S01-005 | Run smoke test and capture prototype report | qa-tester | 1.0 | S01-003 | Headless boot passes and metrics are written to the report | Done |

### Should Have

| ID | Task | Agent/Owner | Est. Days | Dependencies | Acceptance Criteria | Status |
|----|------|-------------|-----------|-------------|-------------------|--------|
| S01-010 | Add scratchy placeholder audio hooks | sound-designer | 0.5 | S01-004 | Prototype has basic draw, hit, and success cues | Not Started |
| S01-011 | Add run scoring and retry polish | systems-designer | 1.0 | S01-004 | Prototype surfaces time, collisions, and a replay prompt | In Progress |
