
# the compiler generated code for this was too slow

# this just copies the sprite animations into the sprite data

DINO_ANIMATIONS:
  .fill 0x4000

SUN_ANIMATIONS:
  .fill 0x6000

DINO_FRAME:
  .fill 0

SUN_FRAME:
  .fill 0

do_animations:
  # sun animations
  movi r3, SUN_ANIMATIONS
  lw   r3, r3, 0
  movi r4, SUN_FRAME
  lw   r4, r4, 0
  movi r6, 1024 # 32 x 32
do_animations_loop_1:
  cmp  r4, r0
  bz   3
  add  r3, r3, r6
  addi r4, r4, -1
  jmp  do_animations_loop_1
  
  movi r4, SPRITE_DATA_START
  lw   r4, r4, 0
  add  r4, r4, r6
  add  r4, r4, r6
  add  r4, r4, r6
do_animations_loop_2:
  lw   r5, r3, 0
  sw   r5, r4, 0
  addi r3, r3, 1
  addi r4, r4, 1
  addi r6, r6, -1
  bnz  do_animations_loop_2
  movi r3, SUN_FRAME
  lw   r4, r3, 0
  addi r4, r4, 1
  movi r5, 3
  cmp  r4, r5
  bl   1
  movi r4, 0
  sw   r4, r3, 0

  # dino animations
  movi r3, DINO_ANIMATIONS
  lw   r3, r3, 0
  movi r4, DINO_FRAME
  lw   r4, r4, 0
  movi r6, 1024 # 32 x 32
do_animations_loop_3:
  cmp  r4, r0
  bz   3
  add  r3, r3, r6
  addi r4, r4, -1
  jmp  do_animations_loop_3
  
  movi r4, SPRITE_DATA_START
  lw   r4, r4, 0
  add  r4, r4, r6
  add  r4, r4, r6
do_animations_loop_4:
  lw   r5, r3, 0
  sw   r5, r4, 0
  addi r3, r3, 1
  addi r4, r4, 1
  addi r6, r6, -1
  bnz  do_animations_loop_4
  movi r3, DINO_FRAME
  lw   r4, r3, 0
  addi r4, r4, 1
  movi r5, 6
  cmp  r4, r5
  bl   1
  movi r4, 0
  sw   r4, r3, 0

  jalr r0, r7