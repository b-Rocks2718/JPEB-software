
# assembly implementation so its faster
clear_screen:
  movi r3, 4096 # 64 x 64
  movi r4, FRAMEBUFFER_START
  lw   r4, r4, 0
clear_screen_loop:
  sw   r0, r4, 0
  addi r4, r4, 1
  addi r3, r3, -1
  bnz  clear_screen_loop
  jalr r0, r7