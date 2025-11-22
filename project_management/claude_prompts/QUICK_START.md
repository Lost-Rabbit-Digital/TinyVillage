# Quick Start Guide: Claude Code Prompts for Tiny Village

Get started developing Tiny Village with AI assistance in under 5 minutes.

## What is Tiny Village?

A **free-to-play cozy village-building game** featuring adorable Khoswa-Kian aliens. Think "Stardew Valley meets Necesse, but simpler and more relaxing."

### Core Pillars
1. **Cozy & Accessible** - Relaxing, intuitive, no stress
2. **Creative Expression** - Build beautiful villages your way
3. **Meaningful Progression** - Rewarding without grinding
4. **Simple Depth** - Easy to learn, engaging to master

## Fastest Start: Copy & Paste

### 1. Pick Your Task

**Want to add a building?**
→ Open `add_building.txt`, copy all, paste to Claude Code

**Want to create a new biome?**
→ Open `create_biome.txt`, copy all, paste to Claude Code

**Want to review if code is "cozy enough"?**
→ Open `cozy_review.txt`, copy all, paste to Claude Code

### 2. Answer Claude's Questions

Claude will ask specific questions like:
- "What building would you like to add?"
- "What color palette should this biome use?"
- "Which code files should I review?"

### 3. Claude Does the Work

Claude will:
- Implement the feature
- Follow cozy game principles
- Reference the game design document
- Create tests
- Update documentation

## Most Common Prompts

### Daily Development

```
add_building.txt          → Create new building type
design_ui.txt            → Design UI screens
test_feature.txt         → Test anything thoroughly
cozy_review.txt          → Verify cozy principles (use often!)
```

### Weekly Planning

```
plan_sprint.txt          → Plan next development phase
optimize_performance.txt → Performance improvements
```

### Monetization Work

```
implement_dlc.txt        → Create DLC content pack
add_cosmetic.txt         → Add shop cosmetic item
```

### Special Tasks

```
create_biome.txt         → New environments
write_lore.txt           → Khoswa-Kian story
setup_multiplayer.txt    → Co-op features
create_steam_page.txt    → Marketing content
```

## Example: Adding Your First Building

1. **Copy this prompt** from `add_building.txt`:
   ```
   PROMPT: Add New Building to Tiny Village

   Help me add a new building to Tiny Village. Follow these steps:
   [rest of prompt...]
   ```

2. **Paste to Claude Code**

3. **Have this conversation**:
   ```
   Claude: What building would you like to add?

   You: A cozy library where villagers can read books

   Claude: Great! Let me gather some details:
   - Building category: Would you like this to be...
   [Claude asks follow-up questions]

   You: [Answer questions]

   Claude: Perfect! I'll now implement the library building...
   [Claude creates the code]
   ```

4. **Done!** Test in Godot with F5

## The Golden Rule

**Before committing ANY code**, use `cozy_review.txt` to verify:
- ✅ Maintains relaxing atmosphere
- ✅ No pay-to-win (if monetization)
- ✅ Accessible and intuitive
- ✅ Follows game design principles

## Project Structure

```
TinyVillage/
├── project_management/
│   ├── claude_prompts/           ← YOU ARE HERE
│   │   ├── *.txt                 ← Copy these!
│   │   ├── README.md             ← Full documentation
│   │   └── QUICK_START.md        ← This file
│   └── project_direction/
│       └── game_design_document.md  ← The source of truth
└── tiny_village_project/          ← Godot project
```

## Essential Reading

**Must read** (seriously, read this):
- `project_management/project_direction/game_design_document.md`

**Nice to know**:
- `project_management/lore.md` - The Khoswa-Kian story
- `README.md` in prompt directory - Full documentation

## Monetization: The Rules

Since Tiny Village is free-to-play with ethical DLC:

### ✅ Always Allowed
- Optional cosmetics (outfits, skins)
- Content expansions (new biomes, buildings)
- Story chapters
- Supporting development

### ❌ Never Allowed
- Pay-to-win mechanics
- Loot boxes
- Energy systems
- FOMO tactics
- Hidden costs

**When in doubt**: Use `cozy_review.txt` after implementing monetization features.

## Common Questions

**Q: What if I don't know what to work on next?**
A: Use `plan_sprint.txt` - it checks the roadmap and suggests priorities.

**Q: How do I make sure my code is "cozy"?**
A: Use `cozy_review.txt` - Claude gives you a 1-10 Coziness Score with feedback.

**Q: Can I modify these prompts?**
A: Yes! Edit them to fit your workflow. They're plain text files.

**Q: Do I need to use all prompts?**
A: No! Use what you need. `cozy_review.txt` is recommended for everything though.

**Q: What if Claude's response isn't helpful?**
A: Provide more specific details or ask follow-up questions in the same conversation.

## Your First Day

Here's a suggested workflow:

### Morning (2 hours)
1. Read `game_design_document.md` (skim at minimum)
2. Use `plan_sprint.txt` to see what to work on
3. Pick one feature to implement

### Afternoon (4 hours)
1. Use relevant prompt (e.g., `add_building.txt`)
2. Implement feature with Claude's help
3. Test in Godot
4. Use `cozy_review.txt` before committing
5. Commit your work

### Evening (optional)
1. Write devlog/update social media
2. Plan tomorrow with `plan_sprint.txt`

## Tips for Success

1. **Keep conversations going** - Don't start a new chat for every question
2. **Be specific** - "Add a bakery" is better than "Add a building"
3. **Reference docs** - Say "check the game design document" for context
4. **Iterate** - Ask Claude to refine the output
5. **Test early** - Don't wait to run the game

## Getting Help

In Claude Code, just ask:
- "Where should I start?"
- "What's the priority for Phase 1?"
- "Review this code for cozy principles"
- "How do I test multiplayer?"

The prompts are guides, not scripts. Claude understands the project context.

---

## Ready to Build?

1. **Pick a prompt** from the list above
2. **Copy the .txt file contents**
3. **Paste into Claude Code**
4. **Start building your cozy game!**

**Welcome to the team!** 🌱

*The Khoswa-Kian have pressed their suit cuffs and are ready to build. Are you?*
