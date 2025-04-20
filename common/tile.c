int write_solid_tile(unsigned tile_num, unsigned color){
  unsigned addr = 0xC000;
  unsigned* p = (unsigned*)addr;
  p += 64 * tile_num;
  for (int i = 0; i < 64; ++i){
    p[i] = color;
  }
}