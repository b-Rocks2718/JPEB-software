
# we'll used 16 bit fixed point integers with this format: XXXX XXXX.XXXX XXXX
# unsigned mul_fixed(unsigned x, unsigned y){
#  unsigned result = 0;
#  for (int i = 0; i < 16; ++i){
#    if (y & (0x8000 >> i)){
#      result += (x << (7 - i));
#    }
#  }
#  return result;
#}


mul_fixed:
  push r7
  push r2

  mov  r5, r3 # r5 = x, r4 = y
  mov  r3, r0 # result = 0

  movi r7, 0x8000
  and  r2, r4, r7
  cmp  r2, r0
  bz   1
  sub  r4, r0, r4
  and  r6, r5, r7
  cmp  r6, r0
  bz   1
  sub  r5, r0, r5
  xor  r2, r2, r6

  movi r7, 0x4000
  and  r0, r4, r7
  bz   7
  shl  r6, r5
  shl  r6, r6
  shl  r6, r6
  shl  r6, r6
  shl  r6, r6
  shl  r6, r6
  add  r3, r3, r6

  movi r7, 0x2000
  and  r0, r4, r7
  bz   6
  shl  r6, r5
  shl  r6, r6
  shl  r6, r6
  shl  r6, r6
  shl  r6, r6
  add  r3, r3, r6

  movi r7, 0x1000
  and  r0, r4, r7
  bz   5
  shl  r6, r5
  shl  r6, r6
  shl  r6, r6
  shl  r6, r6
  add  r3, r3, r6

  movi r7, 0x800
  and  r0, r4, r7
  bz   4
  shl  r6, r5
  shl  r6, r6
  shl  r6, r6
  add  r3, r3, r6

  movi r7, 0x400
  and  r0, r4, r7
  bz   3
  shl  r6, r5
  shl  r6, r6
  add  r3, r3, r6

  movi r7, 0x200
  and  r0, r4, r7
  bz   2
  shl  r6, r5
  add  r3, r3, r6

  movi r7, 0x100
  and  r0, r4, r7
  bz   1
  add  r3, r3, r5

  movi r7, 0x80
  and  r0, r4, r7
  bz   2
  shr  r6, r5
  add  r3, r3, r6

  movi r7, 0x40
  and  r0, r4, r7
  bz   3
  shr  r6, r5
  shr  r6, r6
  add  r3, r3, r6

  movi r7, 0x20
  and  r0, r4, r7
  bz   4
  shr  r6, r5
  shr  r6, r6
  shr  r6, r6
  add  r3, r3, r6

  movi r7, 0x10
  and  r0, r4, r7
  bz   5
  shr  r6, r5
  shr  r6, r6
  shr  r6, r6
  shr  r6, r6
  add  r3, r3, r6

  movi r7, 0x8
  and  r0, r4, r7
  bz   6
  shr  r6, r5
  shr  r6, r6
  shr  r6, r6
  shr  r6, r6
  shr  r6, r6
  add  r3, r3, r6

  movi r7, 0x4
  and  r0, r4, r7
  bz   7
  shr  r6, r5
  shr  r6, r6
  shr  r6, r6
  shr  r6, r6
  shr  r6, r6
  shr  r6, r6
  add  r3, r3, r6

  movi r7, 0x2
  and  r0, r4, r7
  bz   8
  shr  r6, r5
  shr  r6, r6
  shr  r6, r6
  shr  r6, r6
  shr  r6, r6
  shr  r6, r6
  shr  r6, r6
  add  r3, r3, r6

  movi r7, 0x1
  and  r0, r4, r7
  bz   9
  shr  r6, r5
  shr  r6, r6
  shr  r6, r6
  shr  r6, r6
  shr  r6, r6
  shr  r6, r6
  shr  r6, r6
  shr  r6, r6
  add  r3, r3, r6

  cmp  r2  r0
  bz   1
  sub  r3, r0, r3

  pop  r2
  pop  r7
  jalr r0, r7