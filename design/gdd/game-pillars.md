# Game Pillars: Paper Trail Express

## Document Status
- **Version**: 1.0
- **Last Updated**: 2026-03-28
- **Approved By**: autonomous bootstrap
- **Status**: Draft

---

## Core Fantasy

> You are a notebook-page courier who turns messy hand-drawn lines into momentum, shortcuts, and survival. The joy comes from improvising order inside a chaotic doodle world and pulling off deliveries that look impossible until the last second.

---

## Target MDA Aesthetics

| Rank | Aesthetic | How Our Game Delivers It |
| ---- | ---- | ---- |
| 1 | Challenge | Tight pathing, limited ink, and predator pressure |
| 2 | Discovery | Hidden shortcuts, route tricks, and readable notebook secrets |
| 3 | Fantasy | Becoming the coolest courier on a living page |
| 4 | Sensation | Scratchy paper motion, bold silhouette feedback, and punchy delivery moments |
| N/A | Fellowship | Single-player MVP with no social loop |

---

## The Pillars

### Pillar 1: Route Drawing Is The Game

**One-Sentence Definition**: The player's hand-authored line must stay central to movement, planning, risk, and recovery in every core encounter.

**Target Aesthetics Served**: Challenge, Discovery

**Design Test**: If we are deciding between a feature that amplifies route authorship and one that bypasses it, we choose the feature that makes the player care more about where and when they draw.

#### What This Means for Each Department

| Department | This Pillar Says... | Example |
| ---- | ---- | ---- |
| **Game Design** | Objectives should reward route planning and rerouting | Mailboxes sit behind forks that become easier with a smart bait line |
| **Art** | Trails must read instantly against the page | Fresh ink is thick, dark, and distinct from scenery lines |
| **Audio** | Drawing and riding ink need satisfying contrast | Pencil scratch on draw, whoosh when riding a fresh line |
| **Narrative** | Characters admire or react to the player's wild routes | Clients leave notes about impossible shortcuts |
| **Engineering** | The trail system is a first-class gameplay system, not a cosmetic layer | Enemies and boosts both query trail freshness |

#### Serving This Pillar
- A room layout that offers two obvious routes and one high-risk shortcut only possible with efficient line placement
- Enemies that retarget the newest line segment, creating bait opportunities

#### Violating This Pillar
- Adding a permanent sprint button that makes trails unnecessary
- Solving late-game challenge mostly with stat upgrades instead of route decisions

---

### Pillar 2: Readable Notebook Chaos

**One-Sentence Definition**: The notebook page can feel alive and messy, but the player must always parse goals, danger, and movement aids at a glance.

**Target Aesthetics Served**: Challenge, Sensation

**Design Test**: If a stylistic choice makes the page harder to scan during active play, it gets simplified until clarity wins.

#### What This Means for Each Department

| Department | This Pillar Says... | Example |
| ---- | ---- | ---- |
| **Game Design** | Room density should support fast reading | MVP rooms use 1-2 hazards instead of layered gimmicks |
| **Art** | Values and line weight matter more than intricate detail | Erasers have a clear silhouette, mailbox uses a strong accent color |
| **Audio** | Sound must reinforce threat changes without clutter | Erasers gain a sharper paper scrape when they lock onto fresh ink |
| **Narrative** | Margin text supports mood without obscuring gameplay space | Character scribbles stay on borders or between runs |
| **Engineering** | Effects and HUD must remain cheap and legible | Trail fade uses a simple alpha curve rather than noisy particles |

#### Serving This Pillar
- Limiting active trail lifetime so the page never becomes unreadable
- Designing HUD with only ink, delivery progress, and restart prompt in the MVP

#### Violating This Pillar
- Heavy bloom or layered paper shaders that obscure trail edges
- Decorative doodles that are visually indistinguishable from interactable hazards

---

### Pillar 3: Short Runs, Big Saves

**One-Sentence Definition**: Every run should generate at least one dramatic recovery or last-second delivery that players want to retell.

**Target Aesthetics Served**: Challenge, Fantasy

**Design Test**: If a feature stretches runs longer without increasing dramatic rescue moments, it belongs outside the MVP or gets cut.

#### What This Means for Each Department

| Department | This Pillar Says... | Example |
| ---- | ---- | ---- |
| **Game Design** | Objectives should resolve in compact arcs with room for clutch reroutes | A delivery route can collapse and recover within 60 seconds |
| **Art** | Success and escape beats must look celebratory | Mailbox opening is bold and animated like a notebook snap |
| **Audio** | Clutch moments need strong punctuation | Near-failure boost rides get a rising paper flutter layer |
| **Narrative** | Story should come in tiny contracts and callbacks | Each client note fits in one or two punchy sentences |
| **Engineering** | Failure and restart loops must be fast | Resetting a room takes less than two seconds |

#### Serving This Pillar
- Quick resets after eraser contact so players immediately test a new line
- Mailbox extraction that stays tense until the player actually reaches it

#### Violating This Pillar
- Long downtime between attempts
- Inventory or dialogue screens that interrupt the room-level action loop

---

### Pillar 4: Low Art Cost, High Personality

**One-Sentence Definition**: The game should feel charming and distinctive through line quality, timing, and page identity instead of expensive asset production.

**Target Aesthetics Served**: Fantasy, Sensation

**Design Test**: If an idea only works with expensive animation or high-volume asset production, it is not a good fit for this project phase.

#### What This Means for Each Department

| Department | This Pillar Says... | Example |
| ---- | ---- | ---- |
| **Game Design** | Mechanics should read through shape and timing before content quantity | One eraser enemy can stay interesting if target switching is readable |
| **Art** | Doodle strokes, paper texture, and icon language carry identity | Stamps, mailboxes, and erasers all read as stationery brought to life |
| **Audio** | Cheap foley with strong texture beats generic polish | Pencil, paper, and eraser sounds define the world |
| **Narrative** | Character voice can live in tiny notes and margin comments | A grumpy stapler clerk leaves sarcastic delivery requests |
| **Engineering** | Systems should support reusable visual motifs | One line-rendering framework can drive trails, signage, and margin notes |

#### Serving This Pillar
- SVG-based props with subtle jitter instead of dense sprite animation
- A room kit based on ruled lines, graph paper, sticky notes, and binder clips

#### Violating This Pillar
- A plan that requires bespoke cutscenes for every contract
- Art direction dependent on high-frame-count character animation

---

## Anti-Pillars (What This Game Is NOT)

- **NOT a combat-heavy action game**: direct attacks would compete with route improvisation and reduce the courier fantasy
- **NOT a sprawling open-world explorer**: broad maps would weaken the tight run structure and readable notebook rhythm
- **NOT a cozy sandbox**: the heart of the game is pressure, risk, and expressive saves, not relaxed decoration

---

## Pillar Conflict Resolution

| Priority | Pillar | Rationale |
| ---- | ---- | ---- |
| 1 | Route Drawing Is The Game | If this falls apart, the game loses its identity immediately |
| 2 | Readable Notebook Chaos | A great mechanic still fails if players cannot read the page |
| 3 | Short Runs, Big Saves | Session shape matters after the interaction and readability are secure |
| 4 | Low Art Cost, High Personality | Production constraints should support the first three pillars, not override them |

---

## Player Motivation Alignment

| Need | Which Pillar Serves It | How |
| ---- | ---- | ---- |
| **Autonomy** (meaningful choice, player agency) | Route Drawing Is The Game | Players author their own path and risk surface |
| **Competence** (mastery, skill growth, clear feedback) | Readable Notebook Chaos | Strong readability turns failure into learnable improvement |
| **Relatedness** (connection, belonging, emotional bond) | Short Runs, Big Saves | Repeated clients and tiny rescue stories make deliveries feel personal |

---

## Emotional Arc

### Session Emotional Arc

| Phase | Duration | Target Emotion | Pillar(s) Driving It | Mechanics Delivering It |
| ---- | ---- | ---- | ---- | ---- |
| Opening | 0-3 min | Curiosity | Readable Notebook Chaos | Scanning the page, spotting shortcuts, reading contract note |
| Rising | 3-10 min | Focus | Route Drawing Is The Game | Collecting mail while deciding where to spend ink |
| Climax | 10-15 min | Panic and triumph | Short Runs, Big Saves | Erasers closing in, last shortcut to the mailbox |
| Resolution | 15-18 min | Relief | Low Art Cost, High Personality | Delivery grade, quick summary, funny margin reaction |
| Hook | End of session | Curiosity | Route Drawing Is The Game | New district gimmick or modifier tease |

---

## Pillar Validation Checklist

- [x] **Count**: 4 pillars
- [x] **Falsifiable**: Each pillar makes a testable claim
- [x] **Constraining**: Each pillar forces saying no to plausible ideas
- [x] **Cross-departmental**: Each pillar affects design, art, audio, narrative, and engineering
- [x] **Design-tested**: Each pillar includes a concrete design test
- [x] **Anti-pillars defined**: At least 3 explicit exclusions are present
- [x] **Priority-ranked**: Pillars are ordered for conflict resolution
- [x] **MDA-aligned**: Pillars support the top target aesthetics
- [x] **SDT coverage**: Autonomy, competence, and relatedness are each served
- [x] **Memorable**: The set is short enough to recite
- [x] **Core fantasy served**: Every pillar points back to the courier fantasy
