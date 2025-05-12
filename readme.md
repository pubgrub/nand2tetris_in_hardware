# Logisim-Evolution Adaptation of a Nand2Tetris Computer

This prototype, built primarily with 74xx chips, tests the feasibility of an IRL model.

The main circuit is hack_computer.circ

Key differences from the Nand2Tetris virtual model:

- The RAM uses a single combined In/Out bus. A register and buffer cache data for writing, enabling single-step instruction execution.
- The A, D, and RAM Write registers are updated during the clock's low phase.
- Input and output are not implemented due to the complexity of timing and delays in Logisim.

Be aware that I am a beginner, and even as the simulation seems to work, don't trust it when building the real thing.
I.e. I know, that writing to RAM should be done differently, because the buffer IC should only be "activated" AFTER the RAM has switched to writing mode.
