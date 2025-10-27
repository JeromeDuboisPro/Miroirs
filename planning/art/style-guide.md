# Visual Style Guide

## Art Direction

**Core Aesthetic**: 8-bit/16-bit pixel art with modern effects

**Inspiration**:
- Stardew Valley (charm, readability)
- Terraria (pixel art with dynamic lighting)
- Hyper Light Drifter (atmospheric pixel art)
- Celeste (expressive pixel characters)

**Goals**:
- Nostalgic retro feel
- Clear gameplay readability
- Distinct visual identity for each world
- Epic moments despite pixel limitations

## Color Palettes

### Light World Palette

**Theme**: Vibrant, natural, warm

**Primary Colors**:
- Forest Green: `#3B7A3B` (trees, grass)
- Earth Brown: `#6B4423` (wood, soil)
- Sky Blue: `#5DADE2` (sky, water)
- Sun Yellow: `#F9E79F` (light, energy)

**Accent Colors**:
- Flower Pink: `#EC7063` (flora)
- Berry Red: `#C0392B` (fruits)
- Stone Gray: `#95A5A6` (rocks)

**Lighting**: Warm, soft shadows, high saturation

### Dark World Palette

**Theme**: Industrial, technological, cool

**Primary Colors**:
- Metal Gray: `#566573` (structures, machines)
- Deep Black: `#1C2833` (shadows, void)
- Neon Blue: `#3498DB` (energy, circuits)
- Electric Cyan: `#1ABC9C` (power sources)

**Accent Colors**:
- Warning Orange: `#E67E22` (alerts, hazards)
- Screen Green: `#52BE80` (displays)
- Rust Red: `#943126` (damage, decay)

**Lighting**: Cold, harsh shadows, neon glow effects

## Sprite Design

### Character Sprites

**Player Character**:
- Size: 16x16 pixels (base)
- Style: Simple humanoid silhouette
- Customization: Color swaps for equipment
- Animation frames:
  - Idle: 2 frames (subtle breathing)
  - Walk: 4 frames
  - Attack: 3 frames
  - Death: 4 frames

**Example Structure**:
```
  ███     <- Head (3px wide)
 █████    <- Body (5px wide)
  ███     <- Legs (3px wide)
 █   █    <- Feet (walking stance)
```

### Enemy Sprites

**Light World Enemies**:
- **Forest Fox**: 12x12px, orange/brown, 2-frame walk
- **Cave Bear**: 20x16px, dark brown, aggressive stance
- **Poison Flower**: 14x14px, stationary, pulsing animation
- **Storm Wisp**: 10x10px, flying, erratic movement

**Dark World Enemies**:
- **Scout Bot**: 12x12px, gray/blue, wheel animation
- **Tank Bot**: 20x18px, heavy armor, slow walk
- **Turret**: 16x16px, stationary, rotating barrel
- **Energy Anomaly**: 10x10px, teleporting, glitch effect

### Environmental Tiles

**Tile Size**: 16x16 pixels

**Light World Tiles**:
- Grass: Varied green tones, small detail variations
- Tree: 32x32px (multi-tile), brown trunk + green canopy
- Water: Animated (3 frames), blue with white highlights
- Rock: Gray, varied shapes for natural look

**Dark World Tiles**:
- Metal Floor: Grid pattern, reflective highlights
- Structure: Geometric shapes, panel lines
- Energy Pool: Animated glow (4 frames), cyan/blue
- Wall: Angular, tech panel design

## Animation Principles

### Frame Economy

**Limited Animation** (retro style):
- Idle: 1-2 frames
- Walk: 3-4 frames
- Attack: 3-4 frames
- Special: 5-8 frames (finishers only)

**Frame Rate**: 10-15 FPS (intentionally choppy, retro feel)

### Key Animations

**Combat Finishers** (Epic Moments):
- 8-10 frames
- Camera shake/zoom
- Particle effects (16-32 particles)
- Screen flash on impact
- Slow-motion effect (half speed for 1 second)

**World Transition**:
- 6 frames
- Swirl/portal effect
- Color inversion animation
- Screen fade

## Particle Effects

### Light World Effects

**Harvest Animation**:
- Green sparkles (leaf particles)
- Float upward, fade out
- 5-8 particles, 0.5 second duration

**Combat Hit**:
- Wood splinters (brown shards)
- Nature energy burst (green flash)
- 8-12 particles, radial spread

### Dark World Effects

**Harvest Animation**:
- Blue sparks (electrical)
- Sharp, angular particles
- 5-8 particles, 0.5 second duration

**Combat Hit**:
- Metal shrapnel (gray shards)
- Energy discharge (cyan flash)
- 8-12 particles, radial spread

### Universal Effects

**Legendary Drop**:
- Orange starburst (10-15 particles)
- Pulsing glow
- Larger, slower particles
- 2 second duration

**Portal Activation**:
- Swirl effect (spiral particles)
- World-appropriate colors
- Continuous animation (loop)

## UI Design

### Visual Hierarchy

**Borders & Frames**:
- Thick pixel borders (2-3px)
- Corner decorations (world-themed)
- Semi-transparent backgrounds (#000000 50% alpha)

**Buttons**:
- 3D pixel art style (pseudo-depth with shading)
- Hover state: +10% brightness
- Press state: Darker, shifted down 1px

### Font (Minimal Use)

**Primary Font**: Pixel-art style (e.g., Press Start 2P)
**Size**: 8px (small), 16px (large)
**Usage**: Only for numbers and minimal labels
**Color**: White with black outline (high contrast)

**Avoid**: Long text blocks, excessive labels

## Lighting & Atmosphere

### Light World Lighting

**Time of Day** (Static in MVP, future feature):
- Daytime: Bright, warm light from top-left
- Dynamic shadows: Simple offset shadow sprites

**Atmospheric Effects**:
- Sun rays through trees (layered transparent sprites)
- Gentle particle drift (floating leaves, dust)

### Dark World Lighting

**Ambient Lighting**:
- Dark base, localized light sources
- Neon glow around tech objects
- Sharp contrast (bright lights, deep shadows)

**Atmospheric Effects**:
- Steam vents (particle emitters)
- Flickering lights (animated sprites)
- Electrical arcs (occasional particle bursts)

## Screen Effects

### Camera Effects

**Combat Camera**:
- Screen shake: 2-5px offset on hit
- Zoom in: 1.2x for finishers (2 seconds)
- Flash: White overlay, 0.1 second on critical

**World Switch**:
- Swirl/vortex distortion
- Color inversion transition
- 1-second transition time

### Post-Processing (Optional)

**Retro CRT Effect** (Toggle):
- Scanline overlay
- Slight chromatic aberration
- Vignette effect

**Bloom Effect**:
- Subtle glow on bright objects
- More pronounced on legendary items

## Resolution & Display

### Base Resolution

**Internal Resolution**: 320x180 pixels (16:9 ratio)
**Scaled Up**: 2x, 3x, 4x for modern displays
**Scaling**: Nearest-neighbor (crisp pixels, no blur)

### Target Display

**Desktop**: 1920x1080 (3x scale)
**Web**: 960x540 (3x scale in browser)
**Future Mobile**: 1280x720 (4x scale)

### Safe Area

**UI Safe Zone**: 10% margin from screen edges
**Action Safe Zone**: All gameplay visible at 90% screen area

## Asset Creation Workflow

### Tools

**Pixel Art**: Aseprite (primary), GIMP (alternative)
**Animation**: Aseprite timeline
**Color Palette**: Lospec palette browser
**Export**: PNG with transparency

### File Organization

```
assets/
├── sprites/
│   ├── player/
│   │   ├── idle.png
│   │   ├── walk.png
│   │   └── attack.png
│   ├── enemies/
│   │   ├── light/
│   │   └── dark/
│   └── items/
├── tiles/
│   ├── light_world/
│   └── dark_world/
├── ui/
│   ├── icons/
│   └── panels/
└── effects/
    ├── particles/
    └── transitions/
```

### Naming Convention

**Format**: `[category]_[name]_[variant].png`
**Examples**:
- `player_idle_01.png`
- `enemy_fox_walk_01.png`
- `tile_grass_01.png`
- `icon_wood_common.png`

## Performance Considerations

### Sprite Optimization

**Texture Atlas**: Combine small sprites into single texture
**Max Texture Size**: 2048x2048 (compatibility)
**Color Depth**: 32-bit RGBA (transparency support)

### Animation Optimization

**Reuse Frames**: Mirror/flip sprites instead of drawing new
**Pooling**: Reuse particle objects, don't create/destroy
**LOD**: Reduce animation frames for distant objects

## MVP Asset List (Phase 1)

### Must-Have Sprites

**Player**:
- [ ] Idle (2 frames)
- [ ] Walk (4 frames)
- [ ] Attack (3 frames)

**Enemies** (4 total):
- [ ] Light: Fox, Bear
- [ ] Dark: Scout Bot, Tank Bot

**Tiles** (basic set):
- [ ] Grass, Tree, Water, Rock (Light)
- [ ] Metal, Structure, Energy, Wall (Dark)

**Items**:
- [ ] 3 weapon types (common, rare, epic)
- [ ] 6 resource icons

**UI**:
- [ ] Health heart
- [ ] Resource icons (6 types)
- [ ] Action icons (5 types)
- [ ] World indicators (Sun, Moon)
- [ ] Build menu frame

**Effects**:
- [ ] Hit spark (2 colors)
- [ ] Harvest sparkle (2 colors)
- [ ] Portal swirl

### Future Assets

- Boss sprites (large, 64x64+)
- Multiple biome tilesets
- Advanced particles
- Legendary item effects
- Character customization parts

## Style Reference Sheet

**Create a master reference image** with:
- Color palettes (Light + Dark)
- Example sprites (Player, Enemy, Tile)
- UI mockups
- Effect samples

**Purpose**: Consistency guide for asset creation

## Testing Visual Clarity

**Checklist**:
- ✅ Can identify player character at a glance
- ✅ Can distinguish resource types from icons alone
- ✅ Combat feedback is visible and satisfying
- ✅ Rarity tiers immediately obvious
- ✅ UI readable on small displays (1280x720 minimum)
- ✅ Light/Dark worlds feel distinct and thematically consistent

## Art Direction Notes

**Do**:
- Keep sprites simple and readable
- Use limited color palettes per sprite (4-8 colors)
- Add personality through animation
- Prioritize gameplay clarity over detail

**Don't**:
- Over-detail small sprites (muddy at low res)
- Use too many colors (breaks retro aesthetic)
- Sacrifice readability for style
- Forget transparency (PNG with alpha channel)

## Future Visual Enhancements

**Phase 2**:
- Weather effects (rain in Light, electrical storms in Dark)
- Day/night cycle (Light world only)
- Seasonal variations
- More biome tilesets

**Phase 3**:
- Character customization visuals
- Advanced lighting (dynamic shadows)
- Additional particle systems
- Cinematic cutscenes (pixel art style)
