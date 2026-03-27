# Systems Index: Paper Trail Express

> **Status**: Draft
> **Created**: 2026-03-28
> **Last Updated**: 2026-03-28
> **Source Concept**: design/gdd/game-concept.md

---

## Overview

Paper Trail Express is a compact 2D action game whose identity depends on a small number of tightly coupled systems: precise courier movement, temporary ink trails, readable enemy pressure, and fast delivery resolution. Because the art direction is intentionally low-cost and the run structure is short, the highest-value systems are the ones that make routes feel clever, danger legible, and retries instant.

---

## Systems Enumeration

| # | System Name | Category | Priority | Status | Design Doc | Depends On |
|---|-------------|----------|----------|--------|------------|------------|
| 1 | Input Mapper (inferred) | Core | MVP | Not Started | - | - |
| 2 | Player Controller | Core | MVP | Not Started | - | Input Mapper |
| 3 | Camera Framing (inferred) | Core | MVP | Not Started | - | Player Controller |
| 4 | Ink Trail System | Gameplay | MVP | Not Started | - | Player Controller |
| 5 | Pickup and Delivery Objective System | Gameplay | MVP | Not Started | - | Player Controller |
| 6 | Eraser Pursuit AI | Gameplay | MVP | Not Started | - | Player Controller, Ink Trail System |
| 7 | Collision and Fail-State Resolution (inferred) | Gameplay | MVP | Not Started | - | Player Controller, Eraser Pursuit AI |
| 8 | HUD and Run Feedback | UI | MVP | Not Started | - | Ink Trail System, Pickup and Delivery Objective System |
| 9 | Notebook District Layout System | Gameplay | Vertical Slice | Not Started | - | Player Controller, Camera Framing |
| 10 | Run Scoring and Grade System (inferred) | Progression | Vertical Slice | Not Started | - | Pickup and Delivery Objective System, Collision and Fail-State Resolution |
| 11 | Main Menu and Restart Flow (inferred) | UI | Vertical Slice | Not Started | - | HUD and Run Feedback |
| 12 | Audio Feedback System | Audio | Vertical Slice | Not Started | - | Ink Trail System, Collision and Fail-State Resolution |
| 13 | Save and Settings System (inferred) | Persistence | Alpha | Not Started | - | Main Menu and Restart Flow |
| 14 | Courier Tool Unlocks | Progression | Alpha | Not Started | - | Run Scoring and Grade System |
| 15 | Margin Story and Contract Notes | Narrative | Alpha | Not Started | - | Pickup and Delivery Objective System |
| 16 | Accessibility Options | Meta | Full Vision | Not Started | - | HUD and Run Feedback, Save and Settings System |
| 17 | Analytics and Challenge Seed System (inferred) | Meta | Full Vision | Not Started | - | Run Scoring and Grade System, Save and Settings System |

---

## Dependency Map

### Foundation Layer (no dependencies)

1. Input Mapper - establishes clean keyboard and future gamepad input

### Core Layer (depends on foundation)

1. Player Controller - depends on: Input Mapper
2. Camera Framing - depends on: Player Controller

### Feature Layer (depends on core)

1. Ink Trail System - depends on: Player Controller
2. Pickup and Delivery Objective System - depends on: Player Controller
3. Eraser Pursuit AI - depends on: Player Controller, Ink Trail System
4. Collision and Fail-State Resolution - depends on: Player Controller, Eraser Pursuit AI
5. Notebook District Layout System - depends on: Player Controller, Camera Framing
6. Run Scoring and Grade System - depends on: Pickup and Delivery Objective System, Collision and Fail-State Resolution

### Presentation Layer (depends on features)

1. HUD and Run Feedback - depends on: Ink Trail System, Pickup and Delivery Objective System
2. Main Menu and Restart Flow - depends on: HUD and Run Feedback
3. Audio Feedback System - depends on: Ink Trail System, Collision and Fail-State Resolution
4. Margin Story and Contract Notes - depends on: Pickup and Delivery Objective System

### Polish Layer (depends on everything)

1. Save and Settings System - depends on: Main Menu and Restart Flow
2. Courier Tool Unlocks - depends on: Run Scoring and Grade System
3. Accessibility Options - depends on: HUD and Run Feedback, Save and Settings System
4. Analytics and Challenge Seed System - depends on: Run Scoring and Grade System, Save and Settings System

---

## Recommended Design Order

| Order | System | Priority | Layer | Agent(s) | Est. Effort |
|-------|--------|----------|-------|----------|-------------|
| 1 | Input Mapper | MVP | Foundation | game-designer, godot-specialist | S |
| 2 | Player Controller | MVP | Core | game-designer, gameplay-programmer | M |
| 3 | Ink Trail System | MVP | Feature | game-designer, gameplay-programmer | L |
| 4 | Pickup and Delivery Objective System | MVP | Feature | game-designer | S |
| 5 | Eraser Pursuit AI | MVP | Feature | game-designer, ai-programmer | M |
| 6 | Collision and Fail-State Resolution | MVP | Feature | game-designer, qa-tester | S |
| 7 | HUD and Run Feedback | MVP | Presentation | ux-designer, ui-programmer | S |
| 8 | Camera Framing | MVP | Core | technical-artist, godot-specialist | S |
| 9 | Notebook District Layout System | Vertical Slice | Feature | level-designer, game-designer | M |
| 10 | Run Scoring and Grade System | Vertical Slice | Feature | systems-designer | S |
| 11 | Audio Feedback System | Vertical Slice | Presentation | audio-director, sound-designer | S |
| 12 | Main Menu and Restart Flow | Vertical Slice | Presentation | ui-programmer | S |

---

## High-Risk Systems

| System | Risk Type | Risk Description | Mitigation |
|--------|-----------|-----------------|------------|
| Ink Trail System | Design | The main verb may feel fiddly instead of expressive | Build a prototype immediately and tune point spacing plus boost values |
| Eraser Pursuit AI | Design | Enemy attraction may feel unfair if retargeting is too sticky | Prototype short retarget windows and clear telegraphing |
| HUD and Run Feedback | Quality | The doodle page could become unreadable under pressure | Limit HUD elements in MVP and run screenshot reviews during prototype tuning |
