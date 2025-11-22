# Claude Code Prompts for Tiny Village

This directory contains comprehensive plain-text prompts designed to accelerate development of Tiny Village, a free-to-play cozy village-building game.

## What Are These?

These are detailed prompts you can copy and paste into Claude Code to get expert guidance on specific development tasks. Each prompt is carefully crafted to:
- Guide you through complex tasks step-by-step
- Enforce Tiny Village's cozy game design principles
- Reference the game design document automatically
- Ensure ethical F2P implementation
- Maintain code quality and consistency

## How to Use

1. **Open a prompt file** (e.g., `add_building.txt`)
2. **Copy the entire contents**
3. **Paste into Claude Code** conversation
4. **Follow the guided workflow** - Claude will ask clarifying questions and implement the feature

## Available Prompts

### 🏗️ Core Development

**add_building.txt**
Create new building types with all necessary components (scene, script, data, placement logic).

**create_biome.txt**
Generate new biomes with procedural terrain, resources, weather, and atmosphere.

**design_ui.txt**
Design or improve UI elements following cozy game principles and accessibility standards.

**test_feature.txt**
Create comprehensive test plans including happy path, edge cases, performance, and accessibility.

---

### 💰 Monetization

**implement_dlc.txt**
Set up DLC infrastructure and implement ethical content packs (Story Chapters, Biome Expansions, Building Sets).

**add_cosmetic.txt**
Create cosmetic shop items ensuring zero gameplay advantage and fair pricing.

---

### ✅ Quality Assurance

**cozy_review.txt**
Review code/features against cozy game principles with a 1-10 "Coziness Score" and actionable feedback.

**optimize_performance.txt**
Analyze and optimize performance to maintain 60 FPS smooth experience on minimum spec hardware.

---

### 📋 Project Management

**plan_sprint.txt**
Plan development sprints based on the game design document roadmap with task breakdown and prioritization.

---

### 📖 Content Creation

**write_lore.txt**
Create Khoswa-Kian story content maintaining whimsical tone and optional narrative structure.

**create_steam_page.txt**
Generate complete Steam store page content including copy, asset specs, and FAQ for F2P concerns.

---

### 🌐 Technical Systems

**setup_multiplayer.txt**
Implement or debug peer-to-peer co-op features for up to 4 players with DLC compatibility.

---

## Design Principles

All prompts enforce Tiny Village's core pillars:

### 1. Cozy & Accessible
- Low-stress gameplay, no time pressure
- Intuitive controls, clear feedback
- Charming aesthetics, relaxing atmosphere

### 2. Creative Expression
- Flexible building system
- Hundreds of decorative options
- Screenshot mode and sharing

### 3. Meaningful Progression
- Rewarding without grinding
- Natural advancement
- No artificial gates

### 4. Simple Depth
- Easy to learn, engaging to master
- Streamlined systems
- Optional complexity

## Ethical Monetization

Prompts for DLC and microtransactions enforce strict ethical guidelines:

✅ **Always Required:**
- No pay-to-win mechanics
- Transparent, fair pricing
- Optional content only
- Free alternatives available
- No dark patterns or FOMO
- Complete base game for free

❌ **Never Allowed:**
- Loot boxes or gambling
- Energy systems or timers
- Predatory pricing
- Hidden costs
- Gameplay advantages for money

## Project Context

These prompts reference:
- **Game Design Document**: `project_management/project_direction/game_design_document.md`
- **Project Lore**: `project_management/lore.md`
- **Godot Project**: `tiny_village_project/`

## Example Workflow

Let's say you want to add a new building:

1. Open `add_building.txt`
2. Copy all text
3. Paste into Claude Code:
   ```
   PROMPT: Add New Building to Tiny Village
   [rest of prompt...]
   ```
4. Claude asks: "What building would you like to add?"
5. You respond: "A cozy library where villagers can read"
6. Claude implements the complete feature following all guidelines

## Quick Reference

**Before any commit**, use:
- `cozy_review.txt` - Ensure changes maintain cozy principles

**Starting new features**:
- `plan_sprint.txt` - Check roadmap priorities first
- Relevant feature prompt (building, biome, UI, etc.)
- `test_feature.txt` - Test thoroughly

**For monetization**:
- `implement_dlc.txt` - Major content expansions
- `add_cosmetic.txt` - Shop items
- Always run `cozy_review.txt` after to verify ethics

## Tips for Best Results

1. **Be Specific**: When Claude asks questions, provide detailed answers
2. **Reference Docs**: Mention "check the game design document" for context
3. **Iterate**: Use prompts multiple times for refinement
4. **Combine Prompts**: Use `cozy_review.txt` after any feature implementation
5. **Save Context**: Keep the conversation going for related tasks

## Customizing Prompts

Feel free to modify prompts for your needs:
- Add project-specific requirements
- Adjust coding standards
- Include team conventions
- Add custom checklists

## Contributing

When creating new prompts:
1. Follow existing format and structure
2. Include numbered steps and clear sections
3. Reference game design document
4. Enforce cozy game principles
5. Add to this README
6. Test prompt thoroughly

## Support

Questions about Tiny Village development?
- Review `game_design_document.md` for vision
- Check existing code in `tiny_village_project/`
- Consult Godot 4.4+ documentation
- Ask Claude Code directly!

---

**Happy cozy game development!** 🌱🏡✨

*The Khoswa-Kian are counting on you (with perfectly pressed suit cuffs).*
