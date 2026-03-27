# Game Concept: Paper Trail Express

*Created: 2026-03-28*
*Status: Draft*

---

## Elevator Pitch

> It is a 2D doodle courier-action game where you sprint through a ruled notebook city, sketch temporary ink trails, and outmaneuver hungry erasers to deliver lost letters before the page closes.

---

## Core Identity

| Aspect | Detail |
| ---- | ---- |
| **Genre** | 2D top-down courier action game with route-planning and light extraction pressure |
| **Platform** | PC first |
| **Target Audience** | Explorers and Achievers who enjoy readable, expressive systems in short sessions |
| **Player Count** | Single-player |
| **Session Length** | 15-30 minutes |
| **Monetization** | Premium |
| **Estimated Scope** | Small to Medium (vertical slice first, full project after validation) |
| **Comparable Titles** | Chicory: A Colorful Tale, Mini Motorways, Minit |

---

## Core Fantasy

You are the fastest courier on a living notebook page, turning quick sketches into real momentum. Every delivery feels like improvising a route across a schoolbook world that only stays stable while your pen is moving. The player fantasy is not just "go fast"; it is "think fast, sketch faster, and make a messy page obey you for a few glorious seconds."

---

## Unique Hook

The route you draw is both your movement advantage and your biggest danger. Fresh ink creates temporary speed lanes and shortcuts, but it also attracts erasers that hunt the newest marks on the page. It is like a top-down action courier game, and also a self-authored chase system where every line you draw rewrites the encounter.

---

## Player Experience Analysis (MDA Framework)

### Target Aesthetics (What the player FEELS)

| Aesthetic | Priority | How We Deliver It |
| ---- | ---- | ---- |
| **Sensation** (sensory pleasure) | 4 | Bold doodle motion, paper textures, scratchy audio, and sharply readable feedback |
| **Fantasy** (make-believe, role-playing) | 3 | Becoming a legendary courier in a notebook world full of living stationery |
| **Narrative** (drama, story arc) | 6 | Tiny delivery stories, character notes scribbled in the margins, and run-to-run vignettes |
| **Challenge** (obstacle course, mastery) | 1 | Tight route execution, limited ink, and enemies that pressure greedy lines |
| **Fellowship** (social connection) | N/A | Single-player focus |
| **Discovery** (exploration, secrets) | 2 | Hidden shortcuts, page hazards, and emergent path combinations |
| **Expression** (self-expression, creativity) | 5 | The page physically reflects the player's route choices and risk appetite |
| **Submission** (relaxation, comfort zone) | 7 | Short, replayable runs keep stakes crisp instead of meditative |

### Key Dynamics (Emergent player behaviors)

Players will scout a page, sketch the safest speed lane they can afford, and then intentionally break that plan when erasers overcommit. They will learn to use bait lines, looping shortcuts, and risky final dashes to create "I barely made it" courier stories. Over time, the best players should feel like they are conducting chaos instead of reacting to it.

### Core Mechanics (Systems we build)

1. Temporary ink trails that boost courier movement and decay over time
2. Delivery objectives built around collecting letters or stamps and reaching a mailbox
3. Eraser enemies that prioritize fresh ink and punish obvious routes
4. Small notebook districts with hand-authored doodle hazards and shortcuts
5. Lightweight run progression with modifiers, grades, and unlockable courier tools

---

## Player Motivation Profile

### Primary Psychological Needs Served

| Need | How This Game Satisfies It | Strength |
| ---- | ---- | ---- |
| **Autonomy** (freedom, meaningful choice) | Players choose where to spend ink, which route to sketch, and when to abandon the original plan | Core |
| **Competence** (mastery, skill growth) | Players visibly improve at spacing trail segments, chaining boosts, and baiting erasers into bad angles | Core |
| **Relatedness** (connection, belonging) | Margin characters, delivery notes, and recurring clients give emotional context to the courier fantasy | Supporting |

### Player Type Appeal (Bartle Taxonomy)

- [x] **Achievers** (goal completion, collection, progression) — How: grade chasing, route efficiency, unlockable courier tools
- [x] **Explorers** (discovery, understanding systems, finding secrets) — How: page secrets, alternate lines, emergent enemy baiting
- [ ] **Socializers** (relationships, cooperation, community) — How: not a primary focus
- [ ] **Killers/Competitors** (domination, PvP, leaderboards) — How: optional time trials later, not core to the MVP

### Flow State Design

- **Onboarding curve**: The first 10 minutes teach safe sketching, one eraser type, and a single mailbox route
- **Difficulty scaling**: Later pages introduce tighter ink budgets, multiple erasers, and route hazards before adding more verbs
- **Feedback clarity**: Fresh ink glows darker, boost states exaggerate courier motion, and erasers telegraph target switching clearly
- **Recovery from failure**: Failure resets the current room quickly, with the route immediately visible so players can try a smarter line

---

## Core Loop

### Moment-to-Moment (30 seconds)

Run, sketch, cut corners, and react. The player is constantly deciding whether to spend precious ink for speed now or save it for a dangerous return route.

### Short-Term (5-15 minutes)

Read the current page, collect required mail items, discover a clean delivery path, then improvise around erasers and hazards long enough to hit the mailbox.

### Session-Level (30-120 minutes)

A session includes several notebook districts, each introducing a new page gimmick or courier modifier. Between runs, the player upgrades their courier kit, reads margin chatter, and chooses the next delivery contract.

### Long-Term Progression

Players unlock new courier tools, notebook districts, delivery modifiers, and style variations. Long-term mastery comes from route fluency, bait management, and better use of limited ink.

### Retention Hooks

- **Curiosity**: What new page gimmick or hidden shortcut is on the next district?
- **Investment**: Contracts build tiny stories around recurring notebook residents
- **Social**: Daily route challenges and optional ghost routes can arrive after the MVP
- **Mastery**: Better line economy, faster clear grades, and cleaner evasive play

---

## Game Pillars

### Pillar 1: Route Drawing Is The Game

Every meaningful encounter must become more interesting because the player can create, bait with, or optimize around their own ink lines.

*Design test*: If we are debating between a mechanic that rewards pre-planned route drawing and one that ignores route drawing, we choose the option that makes the line itself matter more.

### Pillar 2: Readable Notebook Chaos

The page can get messy, but the player should always understand where danger, speed, and goals are within one second of looking.

*Design test*: If a visual flourish makes the doodle page less readable during pressure, it gets simplified or removed.

### Pillar 3: Short Runs, Big Saves

Each run should produce at least one memorable courier miracle: a risky shortcut, a last-second bait, or a bold recovery.

*Design test*: If a feature adds management overhead but does not produce dramatic recovery moments, it belongs in meta progression or gets cut.

### Pillar 4: Low Art Cost, High Personality

The doodle style must feel intentional and charming while staying cheap enough for a small team to produce quickly.

*Design test*: If a content addition requires polished animation or dense asset production to work, it is not in the MVP.

### Anti-Pillars (What This Game Is NOT)

- **NOT a combat brawler**: direct fighting would pull attention away from route planning and courier improvisation
- **NOT an open-world collectathon**: wide maps would dilute the compact run tension that makes each delivery memorable
- **NOT high-fidelity realism**: realistic rendering would fight the cheap, expressive doodle promise and the production budget

---

## Inspiration and References

| Reference | What We Take From It | What We Do Differently | Why It Matters |
| ---- | ---- | ---- | ---- |
| Chicory: A Colorful Tale | Drawing directly into the world changes how the player relates to space | Our drawing is temporary, tactical, and speed-focused rather than restorative | Validates the delight of drawing as interaction, not decoration |
| Mini Motorways | Route optimization under pressure | Our routes are drawn in real time by a single avatar inside the map | Validates that path planning itself can be the fun |
| Minit | Compact spaces and clever repetition | We focus on movement expression and baited pursuit instead of timer-based puzzle loops | Validates fast reruns and readable map language |

**Non-game inspirations**: Margin doodles in old notebooks, courier maps, paper craft dioramas, scratched pencil textures, school stationery, and animated sketchbook shorts.

---

## Target Player Profile

| Attribute | Detail |
| ---- | ---- |
| **Age range** | 16-35 |
| **Gaming experience** | Mid-core with appetite for quick mastery games |
| **Time availability** | 20-minute sessions on weekdays, longer optimization runs on weekends |
| **Platform preference** | PC |
| **Current games they play** | Hades, Luck be a Landlord, Mini Motorways |
| **What they're looking for** | Fresh movement expression, short but memorable runs, and personality without huge time commitment |
| **What would turn them away** | Sluggish controls, unreadable effects, grind-heavy progression, or a dull first five minutes |

---

## Technical Considerations

| Consideration | Assessment |
| ---- | ---- |
| **Recommended Engine** | Godot 4.6.1 Stable Mono because the project is 2D-first, solo-friendly, and benefits from rapid iteration with optional C# support later |
| **Key Technical Challenges** | Making dynamic ink trails readable and performant, keeping enemy attraction fair, preserving silhouette clarity in a messy page |
| **Art Style** | 2D doodle / stick-figure notebook art |
| **Art Pipeline Complexity** | Low to Medium; SVGs, line art, and simple paper textures are enough for the MVP |
| **Audio Needs** | Moderate; scratchy pencil sounds, paper slides, and bold mailbox feedback matter more than orchestral music |
| **Networking** | None |
| **Content Volume** | MVP: 1 district, 3-5 room variants, 1 enemy type, 1 courier tool. Full vision: 5-6 districts, 4 enemy families, 20+ modifiers |
| **Procedural Systems** | Minimal for the MVP; later notebooks can remix hand-authored room chunks and contract goals |

---

## Risks and Open Questions

### Design Risks

- The ink trail may feel like busywork if drawing a route is slower than improvising without it
- Enemy attraction could become frustrating if it punishes experimentation more than it rewards clever baiting

### Technical Risks

- Dynamic line rendering and collision checks could become noisy or expensive if too many trail points remain active
- Fast readability may collapse if the page accumulates too many overlapping marks and UI elements

### Market Risks

- The doodle presentation could be misread as purely cozy even though the loop is challenge-driven
- The courier-route pitch is unusual and may need strong GIF-friendly footage to communicate quickly

### Scope Risks

- It will be tempting to add too many page gimmicks before the base route loop is proven
- Story and meta systems could grow faster than the tiny-run format can support

### Open Questions

- Does riding a self-made ink line feel satisfying enough to anchor the whole game? We answer this with an immediate playable prototype
- Can erasers chasing fresh ink create dramatic saves without becoming oppressive? We answer this by tuning enemy retarget windows in the prototype

---

## MVP Definition

**Core hypothesis**: Players will find it exciting to draw their own temporary speed lanes and then improvise around enemies attracted by those same lanes.

**Required for MVP**:
1. One notebook district with a clear mailbox delivery objective
2. Temporary ink trail system that grants speed and decays
3. One eraser enemy that chases fresh ink
4. Collectible letters or stamps and a mailbox extraction point
5. Clear HUD feedback for ink, pickups, and success or failure

**Explicitly NOT in MVP**:

- Meta progression beyond a simple grade or score
- Multiple enemy families, bosses, or large narrative scenes
- Hand-authored campaign structure across many pages

### Scope Tiers (if budget/time shrinks)

| Tier | Content | Features | Timeline |
| ---- | ---- | ---- | ---- |
| **MVP** | 1 district, 1 enemy type, 1 objective set | Core loop only | 4-6 weeks |
| **Vertical Slice** | 2 districts, 2 page gimmicks, first polish pass | Core loop plus progression stub and audio identity | 10-12 weeks |
| **Alpha** | All major districts with placeholder content | Full mechanical scope, rough balancing | 20-24 weeks |
| **Full Vision** | Complete campaign, modifiers, narrative vignettes | All features polished and content complete | 32+ weeks |

---

## Next Steps

- [ ] Lock Godot 4.6.1 Stable Mono in project configuration
- [ ] Create and validate `design/gdd/game-pillars.md`
- [ ] Decompose the concept into systems in `design/gdd/systems-index.md`
- [ ] Create the first prototype for the ink trail courier loop
- [ ] Create the first ADR once the prototype confirms the route system architecture
- [ ] Plan the first milestone and sprint
