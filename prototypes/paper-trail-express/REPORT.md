## Prototype Report: Paper Trail Express

### Hypothesis

Players will enjoy drawing short-lived ink trails that act as both movement boosts and enemy bait, creating a courier loop with route planning, pressure, and recovery stories.

### Approach

Built a single-room Godot 4.6.1 prototype with top-down movement, temporary ink trails, three stamp pickups, a mailbox extraction point, and two eraser enemies that chase fresh ink. The prototype uses simple notebook-paper visuals and a headless autoplay route so the build can be smoke-tested automatically.

### Result

The prototype booted and completed successfully in headless mode. The auto-run confirms that the core loop is mechanically coherent: the player can draw, gain speed from fresh ink, collect all objectives, and exit before enemy pressure collapses the run. The next unanswered question is human feel, not system wiring.

### Metrics

- Frame time: not profiled in this bootstrap pass
- Feel assessment: system structure is promising; manual tuning is still needed to judge whether drawing feels expressive instead of mandatory
- Player action counts: 3 stamps collected, 1 full delivery completed
- Iteration count: 2 runtime passes
- Recorded run metrics:
  - `elapsed_time=3.48`
  - `drawing_time=3.48`
  - `boost_time=3.48`
  - `eraser_contacts=0`
  - `stamps_collected=3`

### Recommendation: PROCEED

The prototype proves the loop is implementable and internally consistent in the pinned Godot environment. Because the build completed a delivery cleanly and exercised the trail, pickup, enemy, and extraction systems together, the project should proceed into manual playtesting and first system GDD authoring instead of rethinking the concept.

### If Proceeding

- Convert the prototype's all-in-one script into production-ready systems after the first ADR
- Add manual feel tuning for trail spacing, boost strength, and enemy retarget windows
- Profile the trail representation before scaling to larger room counts
- Create formal design docs for Input Mapper, Player Controller, and Ink Trail System

### Lessons Learned

- The headless demo path is valuable for future smoke tests and CI-style validation
- The notebook art style reads clearly with minimal colors and no heavy post-processing
- The next risk is human feel calibration, not engine compatibility
