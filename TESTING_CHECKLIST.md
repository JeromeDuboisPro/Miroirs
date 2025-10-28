# Miroirs - Testing Checklist

**Run before every commit to prevent regressions!**

## Core Functionality Tests

### Movement System
- [ ] Player moves with WASD/ZQSD
- [ ] Player moves with arrow keys
- [ ] Player cannot move outside world boundaries (0-1024)
- [ ] Player can pass through enemies freely
- [ ] Player movement stops when dead

### Resource System
- [ ] E key shows on resource proximity
- [ ] E key harvests resources (wood in Light, metal in Dark)
- [ ] Inventory updates correctly (Wood/Metal counts)
- [ ] Resources regenerate after 60 seconds
- [ ] Resources depleted appearance (grey/faded)
- [ ] Mirror transformation: tree → metal in other world
- [ ] Cannot harvest resources from inactive world

### Health System
- [ ] T key damages player (20 HP)
- [ ] Health bar updates in real-time
- [ ] Health bar color changes (green → yellow → red)
- [ ] Player dies at 0 HP
- [ ] Player respawns after 2 seconds
- [ ] HP restores to 100 on respawn
- [ ] Invulnerability blinking works

### Enemy System
- [ ] Enemies spawn in both worlds (max 8 per world)
- [ ] Enemies patrol randomly (40 speed, 64px radius)
- [ ] Enemies turn red when player nearby (80px detection)
- [ ] Y key damages nearest enemy (20 HP)
- [ ] Enemies die after 60 HP damage
- [ ] Enemies cannot leave world boundaries
- [ ] Enemies can pass through each other
- [ ] Enemies always visible above tiles
- [ ] Cannot interact with enemies from inactive world

### World System
- [ ] Tab key switches between Light/Dark worlds
- [ ] World label updates correctly
- [ ] Only active world entities are interactive
- [ ] Camera follows player in both worlds
- [ ] Mouse wheel zoom works (1x-4x)
- [ ] Middle mouse pan works
- [ ] Space bar recenters camera

## Integration Tests

### Cross-World Mechanics
- [ ] Harvest tree in Light → metal appears in Dark (same position)
- [ ] Harvest metal in Dark → tree appears in Light (same position)
- [ ] Switching worlds exits enemy combat mode
- [ ] Resources in inactive world cannot be harvested

### UI System
- [ ] World label shows correct world name
- [ ] Inventory displays Wood and Metal counts
- [ ] Health bar shows correct HP/MaxHP
- [ ] Resource cap at 999 enforced
- [ ] All UI updates in real-time

## Performance Tests
- [ ] Game runs smoothly with 8 enemies per world
- [ ] No lag during world switching
- [ ] Camera pan is smooth
- [ ] No memory leaks after 5 minutes play

## Edge Cases
- [ ] Harvesting at world boundary works
- [ ] Enemy patrol near world edges doesn't break
- [ ] Respawning at world edge works
- [ ] Multiple resource harvests at same position
- [ ] Switching worlds while in combat

---

**Test Execution Notes:**
- Run ALL core tests before any commit
- Run integration tests before phase completion
- Document any failures immediately
- Fix regressions before adding new features
