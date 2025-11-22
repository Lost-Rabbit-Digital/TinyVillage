# Tiny Village - Claude Code Quick Start Guide

Welcome to Tiny Village development with Claude Code! This guide will help you get started quickly.

## Project Vision

**Tiny Village** is a free-to-play cozy village-building game featuring the adorable Khoswa-Kian species. Think "Stardew Valley meets Necesse, but simpler and more accessible."

### Core Pillars
1. **Cozy & Accessible** - Relaxing, no fail states, intuitive
2. **Creative Expression** - Build beautiful villages your way
3. **Meaningful Progression** - Rewarding without grinding
4. **Simple Depth** - Easy to pick up, engaging to master

## Quick Commands

Start any development task with these commands:

### Most Common
```
/add-building          # Add new building to the game
/create-biome          # Create new biome/environment
/test-feature          # Test any feature thoroughly
/cozy-review           # Review code against cozy principles
/plan-sprint           # Plan next development phase
```

### Monetization
```
/implement-dlc         # Create DLC content pack
/add-cosmetic          # Add shop cosmetic item
```

### Advanced
```
/design-ui             # Design UI screens
/setup-multiplayer     # Work on co-op features
/optimize-performance  # Performance improvements
/write-lore            # Create story content
/create-steam-page     # Generate Steam store content
```

## Development Workflow

### Starting a New Feature
1. Run `/plan-sprint` to see current priorities
2. Use specific command (e.g., `/add-building`)
3. Run `/test-feature` when implemented
4. Run `/cozy-review` to ensure it fits the vision
5. Commit your changes

### Before Any Commit
Always run `/cozy-review` to verify:
- ✅ Maintains relaxing, stress-free atmosphere
- ✅ No pay-to-win mechanics (if monetization)
- ✅ Accessible and intuitive
- ✅ Follows existing code patterns

## Project Structure

```
TinyVillage/
├── .claude/                           # Claude Code commands (you are here!)
├── project_management/
│   ├── project_direction/
│   │   └── game_design_document.md   # THE source of truth
│   ├── lore.md                        # Khoswa-Kian story
│   └── scratch_pad.md                 # Random ideas
└── tiny_village_project/              # Godot project
    ├── scenes/                        # Game scenes
    ├── scripts/                       # GDScript files
    ├── assets/                        # Art, audio, etc.
    └── user_interface/                # UI components
```

## Key Documents

### Must Read
- **Game Design Document**: `project_management/project_direction/game_design_document.md`
  - Complete vision, roadmap, monetization strategy
  - Reference this for ALL decisions

### Nice to Know
- **Lore**: `project_management/lore.md` - The Khoswa-Kian story
- **Scratch Pad**: `project_management/scratch_pad.md` - Ideas and notes

## Monetization Model (Important!)

**Base Game: 100% FREE**
- Full gameplay experience
- 3-4 biomes, 50+ buildings
- Multiplayer co-op
- Regular free updates

**Optional DLC ($2.99-$12.99)**
- Story chapters
- New biomes
- Building theme packs
- Seasonal content

**Cosmetic Shop**
- Villager outfits
- Building skins
- Decorations
- All earn-able through gameplay OR purchase

### Golden Rules
- ❌ No pay-to-win
- ❌ No loot boxes
- ❌ No energy systems
- ❌ No FOMO mechanics
- ✅ Transparent pricing
- ✅ Free alternatives always available
- ✅ Optional content only

## Getting Help

### In Claude Code
Just ask! For example:
- "How do I add a new resource type?"
- "Review my building placement code for cozy principles"
- "What should I work on next according to the roadmap?"

### Using Commands
Commands guide you through complex tasks:
```
/add-building
```
Then answer the prompts. Claude handles the rest!

### Common Questions

**Q: What phase are we in?**
Check the roadmap in `game_design_document.md`. Currently in early Phase 1 (Core Mechanics).

**Q: Can I add [feature X]?**
Check if it aligns with the four core pillars. If yes, go for it! If unsure, run `/cozy-review` afterward.

**Q: How do I test in Godot?**
Open the project in Godot 4.4+, press F5. See README.md for setup.

**Q: What about multiplayer?**
Use `/setup-multiplayer` command. P2P co-op for up to 4 players.

**Q: Can I add a monetization feature?**
Use `/implement-dlc` or `/add-cosmetic`. Ensure it follows ethical F2P principles.

## Design Philosophy

### What Makes Tiny Village Special?
- **Cozy First**: Every decision prioritizes relaxation over challenge
- **No Punishment**: No fail states, timers, or stress mechanics
- **Ethical F2P**: Free players get the full experience
- **Unique IP**: Khoswa-Kian time-loop story is delightfully weird
- **Accessible**: Anyone can play and enjoy

### When in Doubt
Ask yourself:
1. Is this cozy and relaxing?
2. Would a casual player understand this?
3. Does this respect players' time and money?
4. Does this spark creativity and joy?

If yes to all four, you're on the right track!

## Next Steps

1. **Read**: `game_design_document.md` (at least skim it)
2. **Explore**: Open Godot project, poke around
3. **Build**: Use `/add-building` to create your first building
4. **Test**: Run the game and see your creation
5. **Share**: Commit your work!

## Contributing Ethos

We're building something special:
- A cozy space for players to relax
- A sustainable business model that respects players
- A unique game with memorable characters
- A welcoming community

Every line of code should support this vision.

---

**Welcome to the team! Let's build a cozy village together.** 🌱🏡✨

*The Khoswa-Kian are counting on you (and they've perfectly pressed their suit cuffs in anticipation).*
