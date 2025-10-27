# Miroirs Development Roadmap

## Overview

**Goal**: Create a fun, addictive 2D MMO with dual-world mechanics

**Development Strategy**: Iterative MVP approach
- Start with single-player prototype
- Validate core mechanics
- Add features progressively
- Scale to multiplayer when foundation is solid

## Phase 1: Single-Player MVP (Weeks 1-12)

**Goal**: Playable prototype demonstrating dual-world concept

### Weeks 1-2: Project Setup & Learning
- [ ] Install Godot 4.2+
- [ ] Complete Godot tutorials (2D basics, GDScript)
- [ ] Set up project structure
- [ ] Initialize Git repository
- [ ] Create basic player movement (WASD + animations)
- [ ] Test build & export pipeline

**Deliverable**: Player character moving in empty world

### Weeks 3-4: Core World System
- [ ] Implement dual-world architecture (Light + Dark)
- [ ] Create basic tilemaps (grass, metal floors)
- [ ] World switching mechanism (placeholder key press)
- [ ] Camera follow player
- [ ] Basic collision detection

**Deliverable**: Player can toggle between two visually distinct worlds

### Weeks 5-6: Resource & Gathering
- [ ] Place resource nodes in worlds (trees, scrap piles)
- [ ] Implement interaction system (E key to harvest)
- [ ] Inventory data structure
- [ ] Spatial mirroring (harvest in Light → spawn in Dark)
- [ ] Basic UI (resource counters)

**Deliverable**: Resource gathering with cross-world effects

### Weeks 7-8: Combat System
- [ ] Basic attack input (Space bar)
- [ ] Enemy spawning system
- [ ] Simple enemy AI (patrol, chase, attack)
- [ ] RPS damage calculation
- [ ] Health system (player + enemies)
- [ ] Death & respawn mechanics

**Deliverable**: Combat with RPS type advantages

### Weeks 9-10: Building & Crafting
- [ ] Build menu UI
- [ ] Structure placement system (grid-based)
- [ ] Basic structures (Campfire, Chest, Wall, Crafting Bench)
- [ ] Crafting recipes
- [ ] Building echoes in opposite world

**Deliverable**: Place structures in one world, see effects in other

### Weeks 11-12: Boss, Polish & Victory
- [ ] Boss design (1 per world)
- [ ] Boss AI & attacks
- [ ] Victory condition (defeat both bosses)
- [ ] Save/load system
- [ ] Basic audio (placeholder sounds)
- [ ] MVP playtest & bug fixes

**Deliverable**: Complete 15-30 minute playable run

**Success Criteria**:
- ✅ Playable from start to victory
- ✅ Dual-world transformation is fun and clear
- ✅ Combat feels satisfying
- ✅ Players want to do multiple runs

## Phase 2: Polish & Depth (Weeks 13-20)

**Goal**: Expand mechanics, improve game feel, add replayability

### Weeks 13-14: Combat Enhancement
- [ ] Rhythm/timing system for combos
- [ ] Epic finisher animations
- [ ] Perfect/Good/Miss timing feedback
- [ ] Camera effects (shake, zoom)
- [ ] Particle effects for hits

**Deliverable**: Combat feels "epic" with One Punch Man style finishers

### Weeks 15-16: Procedural Generation
- [ ] Noise-based terrain generation
- [ ] Seed system for reproducible worlds
- [ ] Portal placement algorithm
- [ ] Resource distribution balancing
- [ ] World size configuration (Tiny/Small/Medium)

**Deliverable**: Each new run has unique world layout

### Weeks 17-18: Loot & Progression
- [ ] Rarity tier system (Common → Epic)
- [ ] Procedural item name generation
- [ ] Equipment stats & effects
- [ ] Enemy loot drops
- [ ] Crafting improvements (Tier 2 recipes)

**Deliverable**: Diablo-style loot with color-coded rarity

### Weeks 19-20: Content Expansion
- [ ] Add 2 more enemy types per world
- [ ] Second biome tilesets
- [ ] More building structures
- [ ] World balance meter (hidden)
- [ ] Event triggers (overgrowth, system failure)

**Deliverable**: More content variety, deeper gameplay

**Success Criteria**:
- ✅ Players replay multiple times for loot RNG
- ✅ Procedural worlds feel varied
- ✅ Combat timing system is learnable & fun
- ✅ "Just one more run" addictiveness

## Phase 3: Multiplayer Foundation (Weeks 21-32)

**Goal**: Add online co-op, community features

### Weeks 21-24: Local Multiplayer
- [ ] Split-screen implementation
- [ ] Shared inventory system
- [ ] Camera zoom to fit both players
- [ ] Cooperative gameplay testing
- [ ] Balance adjustments for 2 players

**Deliverable**: Local co-op working smoothly

### Weeks 25-28: Network Layer
- [ ] Godot high-level multiplayer setup
- [ ] Client-server architecture
- [ ] Host + Join system
- [ ] State synchronization
- [ ] Network interpolation

**Deliverable**: Basic online multiplayer (host + 1-3 clients)

### Weeks 29-30: Multiplayer Features
- [ ] Shared building system
- [ ] Cross-world player visibility (echoes)
- [ ] Asynchronous effects (player actions persist)
- [ ] Chat system (text + emotes)

**Deliverable**: Cooperative multiplayer experience

### Weeks 31-32: Dedicated Server Support
- [ ] Headless server build
- [ ] Server browser UI
- [ ] Connection stability improvements
- [ ] Server admin controls (kick, ban)

**Deliverable**: Community can host servers

**Success Criteria**:
- ✅ Stable 2-4 player co-op
- ✅ Cross-world cooperation feels natural
- ✅ No major lag/desync issues
- ✅ Players prefer multiplayer over solo

## Phase 4: Content & Community (Months 9-12)

**Goal**: Expand content, build community, reach 1.0

### Month 9: Epic World Support
- [ ] Large world generation (2048x2048)
- [ ] Multiple biomes (5+ per world)
- [ ] Boss progression chain (5+ bosses)
- [ ] Extended crafting trees
- [ ] Legendary tier items

**Deliverable**: 200+ hour epic campaigns

### Month 10: Quality of Life
- [ ] Minimap system
- [ ] Keybind customization
- [ ] Graphics settings (resolution, effects)
- [ ] Accessibility options (color-blind modes)
- [ ] Tutorial system for new players

**Deliverable**: Polished, accessible game

### Month 11: Web Version
- [ ] Optimize for web export
- [ ] Test in multiple browsers
- [ ] Reduce download size
- [ ] Deploy to itch.io
- [ ] Marketing website

**Deliverable**: Browser-playable version

### Month 12: 1.0 Release Prep
- [ ] Final bug fixes
- [ ] Balance polish
- [ ] Performance optimization
- [ ] Community server launch
- [ ] Press kit & marketing materials

**Deliverable**: Version 1.0 release

## Post-1.0: Live Service (Ongoing)

### Quarterly Updates
- New biomes
- Seasonal events
- Balance patches
- Community-requested features

### Potential Features
- Mobile ports (iOS, Android)
- Mod support
- Ranked leaderboards
- Competitive modes
- Story campaign
- Character customization
- Housing system
- Guild/clan features

## Resource Requirements

### Time Investment

**Phase 1** (MVP): 12 weeks × 15-20 hours/week = **180-240 hours**
**Phase 2** (Polish): 8 weeks × 15-20 hours/week = **120-160 hours**
**Phase 3** (Multiplayer): 12 weeks × 15-20 hours/week = **180-240 hours**
**Phase 4** (Content): 4 months × 60-80 hours/month = **240-320 hours**

**Total**: ~720-960 hours (~18-24 months part-time)

### Team Size

**Phase 1-2**: Solo or 2-person team
**Phase 3-4**: 2-4 person team (programmer, artist, playtester, community manager)

### Budget (Minimal)

**Free Tools**:
- Godot (engine)
- Aseprite (~$20 or compile free)
- GIMP (free)
- Git/GitHub (free)

**Optional Paid**:
- Itch.io Pro ($10/month) - for polished storefront
- Domain name ($15/year) - for official website
- Server hosting ($5-50/month) - for dedicated servers

**Total Year 1**: ~$0-200 (extremely affordable)

## Risk Assessment & Mitigation

### Technical Risks

| Risk | Severity | Mitigation |
|------|----------|------------|
| Godot learning curve | Medium | Tutorials, community, documentation |
| Multiplayer complexity | High | Start single-player, iterate slowly |
| Proc-gen bugs | Medium | Extensive testing, seed logging |
| Performance issues | Medium | Profile early, optimize continuously |

### Scope Risks

| Risk | Severity | Mitigation |
|------|----------|------------|
| Feature creep | High | Strict MVP scope, defer non-essentials |
| Burnout | High | Sustainable schedule, small milestones |
| Loss of vision | Medium | Regular vision doc reviews |

### Market Risks

| Risk | Severity | Mitigation |
|------|----------|------------|
| Saturated market | Low | Unique dual-world mechanic differentiates |
| Changing trends | Low | Core gameplay is timeless (Diablo, Valheim) |
| Player retention | Medium | Focus on "one more run" loop |

## Success Metrics

### Phase 1 Goals
- [ ] 10+ playtesters complete MVP
- [ ] Average session length: 15-30 minutes
- [ ] 70%+ completion rate (players reach victory)
- [ ] 80%+ say they'd play again

### Phase 2 Goals
- [ ] 50+ playtesters
- [ ] Average 3+ runs per player
- [ ] 90%+ understand dual-world mechanic
- [ ] "Addictive" mentioned in feedback

### Phase 3 Goals
- [ ] 200+ concurrent players (community servers)
- [ ] 85%+ stable multiplayer sessions
- [ ] Average 2+ hours playtime per session
- [ ] Active Discord community (100+ members)

### 1.0 Goals
- [ ] 1,000+ downloads in first month
- [ ] 75%+ positive reviews
- [ ] Featured on itch.io or indie game sites
- [ ] Self-sustaining community (user-hosted servers)

## Flexible Milestones

**This roadmap is a living document**:
- Adjust based on playtesting feedback
- Defer low-priority features
- Accelerate high-impact improvements
- Stay flexible to new ideas

**Key Principle**: Ship early, iterate fast, listen to players

## Next Steps

**Immediate Actions** (This Week):
1. [ ] Install Godot 4.2+
2. [ ] Complete "Your First 2D Game" tutorial
3. [ ] Create project in Godot
4. [ ] Set up GitHub repository
5. [ ] Commit initial project structure

**Week 1 Goals**:
- [ ] Player sprite moving with WASD
- [ ] Basic Light/Dark world toggle (key press)
- [ ] First Git commit with working prototype

Let's start building! 🚀
