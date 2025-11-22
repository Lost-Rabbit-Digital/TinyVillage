---
description: Implement or debug multiplayer/co-op features for Tiny Village
---

Help me implement multiplayer functionality for Tiny Village. Please:

1. **Multiplayer scope:**
   - Co-op mode (up to 4 players)
   - Peer-to-peer networking (per design doc)
   - Shared village building
   - DLC compatibility (host has DLC, guests can visit)

2. **Godot multiplayer setup:**
   - Review Godot 4.x multiplayer API
   - Set up peer-to-peer networking
   - Implement host/client architecture
   - Create lobby system

3. **Core synchronization:**
   - Building placement sync
   - Resource collection sync
   - Villager state sync
   - Weather/time of day sync
   - Player camera positions

4. **DLC handling:**
   - Host DLC content visible to all
   - Guest without DLC can see but not place DLC buildings
   - Graceful degradation for missing content
   - No crashes due to DLC mismatch

5. **UI for multiplayer:**
   - Host game menu
   - Join game menu
   - Friend/invite system (Steam integration)
   - Player list/kick controls
   - Connection status indicators

6. **Cozy multiplayer features:**
   - No griefing (players can't destroy each other's work)
   - Collaborative building
   - Shared resources or separate inventories?
   - Chat system (text, maybe emotes)
   - Screenshot mode includes all players

7. **Testing scenarios:**
   - 2 players
   - 4 players (maximum)
   - Different connection speeds
   - Host disconnect handling
   - Guest disconnect handling
   - DLC ownership variations
   - Save/load with multiplayer

8. **Performance:**
   - Optimize network traffic
   - Reduce sync frequency where possible
   - Handle lag gracefully
   - Maintain 60 FPS for all players

9. **Documentation:**
   - Multiplayer architecture notes
   - Known limitations
   - Future improvements
   - Testing procedures

Implement or debug multiplayer features while maintaining the cozy, stress-free experience.
