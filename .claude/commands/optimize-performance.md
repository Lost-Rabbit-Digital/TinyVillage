---
description: Analyze and optimize Tiny Village performance for smooth cozy gameplay
---

Help me optimize Tiny Village's performance. Please:

1. **Performance audit:**
   - Identify current performance bottlenecks
   - Check frame rate in various scenarios
   - Monitor memory usage
   - Profile script execution
   - Check asset loading times

2. **Target specifications:**
   - Minimum: 60 FPS on integrated graphics
   - Smooth on low-end PCs (per design doc)
   - Fast loading times (< 3 seconds to main menu)
   - Responsive UI (no input lag)
   - Minimal memory footprint

3. **Optimization areas:**
   - **Rendering:**
     - Sprite batching
     - Occlusion culling
     - LOD for distant objects
     - Particle system efficiency
   - **Scripts:**
     - Reduce polling, use signals
     - Optimize pathfinding
     - Cache expensive calculations
     - Async loading where possible
   - **Assets:**
     - Texture compression
     - Audio compression
     - Remove unused assets
     - Atlas optimization

4. **Cozy game considerations:**
   - Maintain smooth, butter-like experience
   - No sudden frame drops (jarring)
   - Consistent performance (no spikes)
   - Quick save/load (no stress)

5. **Testing across scenarios:**
   - Small village (early game)
   - Large village (hundreds of buildings)
   - Multiple biomes loaded
   - Weather effects active
   - Multiplayer (4 players)

6. **Generate optimization report:**
   - Current performance metrics
   - Identified bottlenecks
   - Proposed optimizations (prioritized)
   - Expected improvements
   - Trade-offs to consider

7. **Implement top optimizations:**
   - Start with highest-impact, lowest-effort
   - Measure before and after
   - Document changes
   - Ensure no visual regressions

Performance should never compromise the cozy, smooth experience.
