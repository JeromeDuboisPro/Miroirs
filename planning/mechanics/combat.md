# Combat System

## Design Philosophy

**"Simple, Nervous, Fun"**
- Easy to understand core mechanic (Rock-Paper-Scissors)
- Skill-based execution (timing and positioning)
- Visually impressive (epic finishers every fight)
- Strategic depth through equipment and environment

**No PvP Focus**: Combat is primarily PvE (Player vs Environment)

## Core System: Enhanced Rock-Paper-Scissors

### Base Triangle

```
    🌿 Nature
      ↗   ↖
     ↙     ↘
🤖 Tech ← → ✨ Magic
```

**Advantage Rules**:
- 🌿 Nature beats 🤖 Tech (vines entangle machines, wood absorbs energy)
- 🤖 Tech beats ✨ Magic (logic disrupts energy, circuits ground power)
- ✨ Magic beats 🌿 Nature (fire burns forests, energy withers life)

**Damage Multipliers**:
- Advantaged: 2x damage
- Neutral: 1x damage
- Disadvantaged: 0.5x damage

### Attack Types by World

#### Light World (Nature-based)
- 🌿 **Vine Strike**: Medium speed, entangles enemies
- 🌿 **Thorn Barrage**: Fast, multiple hits
- 🌿 **Root Slam**: Slow, high damage, area effect

#### Dark World (Tech-based)
- 🤖 **Laser Burst**: Fast, precise
- 🤖 **EMP Pulse**: Medium speed, disables
- 🤖 **Missile Swarm**: Slow, homing, explosive

#### Magic (Available in Both)
- ✨ **Energy Bolt**: Fast, basic attack
- ✨ **Flame Wave**: Medium speed, area effect
- ✨ **Lightning Storm**: Slow, chain damage

## Combat Layers

### Layer 1: Timing System (Rhythm-Based)

**Inspiration**: Guitar Hero meets fighting game

**Mechanic**:
1. Attack button pressed → timing window appears (visual indicator)
2. Player must press follow-up within timing zones:
   - 🟢 Perfect: 1.5x damage multiplier + combo advances
   - 🟡 Good: 1.0x damage multiplier + combo continues
   - 🔴 Miss: 0.5x damage multiplier + combo breaks

3. Combo Chain:
   - Hit 1 → Hit 2 → Hit 3 → **FINISHER**
   - Each successful timing builds combo counter
   - 3-chain = Epic finisher animation

**Example Combat Flow**:
```
Player: Presses Attack (Vine Strike)
Game: Shows timing window [====||====]
Player: Presses within Perfect zone
Result: 🟢 Perfect! (3x damage: 2x type advantage × 1.5x timing)
Game: Shows next timing window (faster)
Player: Presses within Good zone
Result: 🟡 Good! (2x damage)
Game: Shows final timing window (fastest)
Player: Presses within Perfect zone
Result: 🟢 Perfect! → **EPIC FINISHER ANIMATION**
```

### Layer 2: Environmental Advantage

**Position-Based Buffs**:
- Near Light-world trees → Nature attacks +30%
- Near Dark-world generators → Tech attacks +30%
- Near energy crystals (both worlds) → Magic attacks +30%

**Tactical Movement**:
- Players can reposition during combat
- Enemies also gain environmental buffs
- Creates "control zone" gameplay
- Encourages building structures at strategic locations

**Environmental Hazards**:
- Lava pools (Light) / Electrical fields (Dark): Damage over time
- Push/pull mechanics to force enemies into hazards
- Combo finishers can launch enemies into hazards

### Layer 3: Equipment Customization

**Weapon Types** (Affect RPS triangle):
- **Pure Type**: Strong against counter, weak against advantage
  - Nature Bow: 2.5x vs Tech, 0.25x vs Magic

- **Hybrid Type**: Moderate against multiple
  - Tech-Nature Blade: 1.5x vs Tech and Magic, 1x vs Nature

- **Balanced Type**: No advantages/disadvantages
  - Neutral Staff: 1x vs all types

**Weapon Stats** (Diablo-inspired):
- **Attack Speed**: Fast / Medium / Slow
- **Damage**: Base damage value
- **Special Effect**: Burn, Freeze, Stun, etc.
- **Rarity Modifier**: Higher rarity = better stats + special effects

**Example Weapons**:
```
🟢 Common Wooden Sword
  Type: Nature
  Damage: 10
  Speed: Medium
  Effect: None

🔵 Rare Emberwood Greatsword
  Type: Nature + Magic
  Damage: 35
  Speed: Slow
  Effect: 20% chance to burn (5 damage/sec for 3 sec)

🟠 Legendary Whisperwood Plasma Blade
  Type: All three (hybrid)
  Damage: 75
  Speed: Fast
  Effect: Attacks chain to nearby enemies (50% damage)
```

## Epic Finisher System

**"One Punch Man" Style**

Every successful 3-hit combo triggers cinematic finisher:

**Finisher Properties**:
1. **Camera zoom/shake**: Emphasizes impact
2. **Slow-motion moment**: Shows final strike clearly
3. **Particle effects**: Explosion of appropriate type (leaves, sparks, energy)
4. **Damage burst**: Finisher does 5x normal damage
5. **Knockback**: Sends enemy flying (can chain into others)

**Finisher Variations** (Based on weapon type):
- Nature: Vines erupt from ground, crush enemy
- Tech: Energy beam obliterates target
- Magic: Reality-warping explosion
- Hybrid: Combined effect (tech-nature = electric vines)

**Duration**: 1-2 seconds (doesn't slow pacing)

## Enemy AI & Types

### Light World Enemies

| Enemy | Type | Behavior |
|-------|------|----------|
| 🦊 Forest Fox | Nature | Fast, hit-and-run |
| 🐻 Cave Bear | Nature | Slow, high damage |
| 🌸 Poison Flower | Magic | Stationary, ranged |
| ⚡ Storm Wisp | Magic | Flying, erratic |

### Dark World Enemies

| Enemy | Type | Behavior |
|-------|------|----------|
| 🤖 Scout Bot | Tech | Fast, laser attacks |
| 🤖 Tank Bot | Tech | Slow, heavy armor |
| ⚙️ Turret | Tech | Stationary, auto-targeting |
| 💎 Energy Anomaly | Magic | Teleporting, burst damage |

### Boss Types (Phase 1 MVP)

**Light World Boss**: 🌲 **Ancient Treant**
- Type: Nature
- Phases: 3 (Normal → Enraged → Berserk)
- Attacks: Root spikes, vine whips, falling boulders
- Weak to: Tech (laser cutting through wood)

**Dark World Boss**: 🏭 **Core Colossus**
- Type: Tech
- Phases: 3 (Active → Damaged → Critical)
- Attacks: Laser beams, missile swarms, EMP pulses
- Weak to: Magic (energy overload)

**Mirror Boss Mechanic** (Future):
- Appears simultaneously in both worlds
- Share HP pool across worlds
- Must be damaged in BOTH worlds to defeat
- Encourages world-switching during fight

## Combat Difficulty Scaling

### Player Skill Curve
- **Early**: Simple timing windows (0.5 sec Perfect zone)
- **Mid**: Faster timing (0.3 sec Perfect zone)
- **Late**: Very tight timing (0.1 sec Perfect zone) + enemy mix-ups

### Enemy Scaling
- **Tiny World**: 3-5 enemy types, simple patterns
- **Epic World**: 20+ enemy types, complex combinations

## MVP Implementation (Phase 1)

**Simplifications for prototype**:
- ✅ Basic RPS system (3 types)
- ✅ Simple timing windows (no rhythm complexity yet)
- ✅ One finisher animation per type
- ✅ 3 weapon tiers (common/rare/epic)
- ✅ 4 enemy types per world
- ✅ 1 boss per world
- ❌ No environmental hazards
- ❌ No equipment special effects
- ❌ No combo variations

**Phase 2 Additions**:
- Advanced rhythm system (faster chains, more complex patterns)
- Equipment special effects
- Environmental interactions
- More finisher varieties
- Mirror boss mechanic

## Controls (Keyboard/Gamepad)

**Keyboard**:
- `WASD` or Arrow Keys: Movement
- `Space` or `J`: Attack
- `Shift` or `K`: Dodge/Roll
- `E`: Interact
- `Tab`: Inventory
- `Q`: World switch (at portal)

**Gamepad**:
- Left Stick: Movement
- `A/X`: Attack
- `B/Circle`: Dodge/Roll
- `X/Square`: Interact
- `Start`: Inventory
- `Y/Triangle`: World switch (at portal)

## Accessibility Options

- **Input Timing**: Adjustable timing window sizes
- **Auto-Combo**: Option to auto-complete combos (reduced damage)
- **Combat Speed**: Slow motion toggle for accessibility
- **Visual Cues**: High-contrast timing indicators
- **Simplified Mode**: Removes timing system, damage only

## Testing & Balancing Metrics

**Success Criteria**:
- ✅ Players understand RPS system within first combat encounter
- ✅ Perfect timing achievable with practice (not random)
- ✅ Finishers feel epic and rewarding
- ✅ Environmental positioning creates strategic choices
- ✅ Equipment feels meaningfully different
- ✅ Combat is 30-40% of gameplay time (not dominant)

**Balance Targets**:
- Average combat duration: 10-30 seconds per enemy
- Boss fight duration: 3-5 minutes
- Death rate: ~10-20% of encounters (challenging but fair)
- Timing Perfect rate: 60-70% for experienced players
