extern unsigned FRAMEBUFFER_START;
extern unsigned RESOLUTION_REG;
extern unsigned INPUT_STREAM;
extern unsigned TILEMAP_START;
extern unsigned SCROLL_X;
extern unsigned SCROLL_Y;
extern unsigned SPRITE_DATA_START;
extern unsigned SPRITE_0_X;
extern unsigned SPRITE_0_Y;
extern unsigned SPRITE_1_X;
extern unsigned SPRITE_1_Y;
extern unsigned SPRITE_2_X;
extern unsigned SPRITE_2_Y;

int GRAVITY = 3;
int JUMP_VELOCITY = 0x030;
int GROUND_Y = 152;
int DINO_X = 80;

// variables
int dino_y = 100;
int dino_vy = 0;
int is_jumping = 1;

int obstacle_1_x = 300;
int obstacle_1_y = 152;
int obstacle_2_x = 600;
int obstacle_2_y = 152;
unsigned frame = 0;

int draw_pixel(unsigned x, unsigned y, unsigned color);
int write_text_tilemap(unsigned text_color, unsigned bg_color);
int clear_screen();

// simple box draw function
int draw_box(unsigned x, unsigned y, unsigned w, unsigned h, unsigned color){
  for (unsigned i = 0; i < w; ++i){
    for (unsigned j = 0; j < h; ++j){
      draw_pixel(x + i, y + j, color);
    }
  }
}

int clear_box(unsigned x, unsigned y, unsigned w, unsigned h){
  draw_box(x, y, w, h, 0);
}

int init_dino(void){
  unsigned* p = (unsigned*)SPRITE_DATA_START;
  for (int i = 0; i < 32; ++i){
    for (int j = 0; j < 32; ++j){
      if (j < 16){
        p[i * 32 + j] = 0x0F0;
      } else {
        p[i * 32 + j] = 0xF000;
      }
    }
  }
}

int init_ground_tiles(void){
  unsigned* p = (unsigned*)TILEMAP_START;
  p += 64;
  for (int i = 0; i < 8; ++i){
    for (int j = 0; j < 8; ++j){
      if (i == 0 || i == 7 || j == 0 || j == 7){
        p[8 * i + j] = 0x1A1;
      } else {
        p[8 * i + j] = 0x5A5;
      }
    }
  }
  p = (unsigned*)FRAMEBUFFER_START;
  for (int i = 0; i < 30; ++i){
    for (int j = 0; j < 128; ++j){
      if (i > 22){
        draw_pixel(j, i, 1);
      } else {
        //draw_pixel(j, i, 0);
      }
    }
  }
}

int init_obstacles(void){
  unsigned* p = (unsigned*)SPRITE_DATA_START;
  p += 32 * 32;
  for (int i = 0; i < 32; ++i){
    for (int j = 0; j < 32; ++j){
      if (j < 6 && i > 8){
        p[i * 32 + j] = 0x00F;
      } else {
        p[i * 32 + j] = 0xF000;
      }
    }
  }
  p += 32 * 32;
  for (int i = 0; i < 32; ++i){
    for (int j = 0; j < 32; ++j){
      if (j < 12 && i > 12){
        p[i * 32 + j] = 0x00F;
      } else {
        p[i * 32 + j] = 0xF000;
      }
    }
  }
}

int handle_physics(void){
  // physics
  dino_y -= dino_vy;
  if (is_jumping){
    dino_vy -= GRAVITY;
  } else {
    dino_vy = 0;
  }

  if (dino_y >= GROUND_Y){
    dino_y = GROUND_Y;
    dino_vy = 0;
    is_jumping = 0;
  }
}

int move_obstacles(void){
  // move obstacle
  obstacle_1_x -= 6;
  if (obstacle_1_x < 0){
    obstacle_1_x = 500 + 10 * (frame % 20); // respawn offset
  }

  obstacle_2_x -= 6;
  if (obstacle_2_x < 0){
    obstacle_2_x = 500 + 10 * (frame % 20); // respawn offset
  }

  unsigned* p = (unsigned*)SCROLL_X;
  *p = *p - 6;
}

//int handle_collisions(void){
//  // collision
//  if (obstacle_x <= DINO_X + 1 && obstacle_x + 1 >= DINO_X){
//    unsigned dino_top = dino_y >> 8;
//    unsigned obs_top = obstacle_y >> 8;
//    if (dino_top + 3 > obs_top){
//      write_text_tilemap(0xF00, 0x000);
//      return 1; // game over
//    }
//  }
//  return 0;
//}

unsigned main(void){
  write_text_tilemap(0x0F0, 0x000);
  clear_screen();

  unsigned *p = (unsigned*)RESOLUTION_REG;
  *p = 1;

  p = (unsigned*)INPUT_STREAM;

  init_dino();
  init_obstacles();
  init_ground_tiles();

  while (1){
    p = (unsigned*)SPRITE_0_X;
    *p = DINO_X;
    p = (unsigned*)SPRITE_0_Y;
    *p = dino_y;

    p = (unsigned*)SPRITE_1_X;
    *p = obstacle_1_x;
    p = (unsigned*)SPRITE_1_Y;
    *p = obstacle_1_y;

    p = (unsigned*)SPRITE_2_X;
    *p = obstacle_2_x;
    p = (unsigned*)SPRITE_2_Y;
    *p = obstacle_2_y;

    // input
    p = (unsigned*)INPUT_STREAM;
    unsigned key = *p;
    if (key == 0x71) return 0; // 'q' to quit
    if (key == 0x20 && !is_jumping){ // spacebar
      dino_vy = 15;//JUMP_VELOCITY;
      dino_y -= 3;
      is_jumping = 1;
    }

    handle_physics();

    move_obstacles();

    //if (handle_collisions()) return 1;

    frame++;
    for (unsigned delay = 0; delay < 50000; ++delay);
  }
}