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
extern unsigned SPRITE_3_X;
extern unsigned SPRITE_3_Y;
extern unsigned SPRITE_4_X;
extern unsigned SPRITE_4_Y;
extern unsigned SPRITE_5_X;
extern unsigned SPRITE_5_Y;

int GRAVITY = 2;
int JUMP_VELOCITY = 0x030;
int GROUND_Y = 156;
int DINO_X = 80;

// variables
int dino_y;
int dino_vy;
int is_jumping;

int obstacle_1_x;
int obstacle_1_y;
int obstacle_2_x;
int obstacle_2_y;
int cloud_1_x;
int cloud_1_y;
int cloud_2_x;
int cloud_2_y;
int sun_x;
int sun_y;
unsigned frame;
unsigned frame2;

int draw_pixel(unsigned x, unsigned y, unsigned color);
int write_text_tilemap(unsigned text_color, unsigned bg_color);
int reset_cursor();
int print(unsigned* str);
int print_unsigned(unsigned x);

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
      if (p[i * 32 + j] == 0x0F3F){
        p[i * 32 + j] = 0xF000;
      }
    }
  }
}


int init_ground_tiles(void){
  unsigned* p = (unsigned*)FRAMEBUFFER_START;
  for (int i = 0; i < 30; ++i){
    for (int j = 0; j < 128; ++j){
      if (i > 22){
        int tile = (i * 3 + j * 7 + i ^ j) & 0x1F;
        if (tile == 0) tile++;
        draw_pixel(j, i, tile);
      }
    }
  }
}

int init_obstacles(void){
  unsigned* p = (unsigned*)SPRITE_DATA_START;
  p += 32 * 32;
  for (int i = 0; i < 32; ++i){
    for (int j = 0; j < 32; ++j){
      if (p[i * 32 + j] == 0x0F3F){
        p[i * 32 + j] = 0xF000;
      }
    }
  }
  p += 32 * 32;
  for (int i = 0; i < 32; ++i){
    for (int j = 0; j < 32; ++j){
      if (p[i * 32 + j] == 0x0F3F){
        p[i * 32 + j] = 0xF000;
      }
    }
  }
}

int init_sun(void){
  unsigned* p = (unsigned*)SPRITE_DATA_START;
  p += 32 * 32 * 3;
  for (int i = 0; i < 32; ++i){
    for (int j = 0; j < 32; ++j){
      if (p[i * 32 + j] == 0x0F3F) p[i * 32 + j] = 0xF000;
    }
  }
}

int init_sky(void){
  unsigned* p = (unsigned*)TILEMAP_START;
  for (int i = 0; i < 8; ++i){
    for (int j = 0; j < 8; ++j){
      p[8 * i + j] = 0xe88;
      p[8128 + 8 * i + j] = 0xe88;
    }
  }
  p = (unsigned*)FRAMEBUFFER_START;
  for (int i = 0; i < 30; ++i){
    for (int j = 0; j < 128; ++j){
      if (i <= 22){
        draw_pixel(j, i, 127);
      }
    }
  }

  // draw clouds
  p = (unsigned*)SPRITE_DATA_START;
  p += 32 * 32 * 4;
  for (int i = 0; i < 32; ++i){
    for (int j = 0; j < 32; ++j){
      if (p[i * 32 + j] == 0x0F3F){
        p[i * 32 + j] = 0xF000;
      }
    }
  }
  p += 32 * 32;
  for (int i = 0; i < 32; ++i){
    for (int j = 0; j < 32; ++j){
      if (p[i * 32 + j] == 0x0F3F){
        p[i * 32 + j] = 0xF000;
      }
    }
  }
  init_sun();
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
    obstacle_1_x = 400 + 10 * (frame % 20); // respawn offset
  }

  obstacle_2_x -= 6;
  if (obstacle_2_x < 0){
    obstacle_2_x = 500 + 10 * (frame % 20); // respawn offset
  }

  cloud_1_x -= 2;
  if (cloud_1_x < 0){
    cloud_1_x = 400 + 10 * (frame % 20); // respawn offset
    cloud_1_y = 40 + 2 * (frame % 20); // respawn offset
  }

  cloud_2_x -= 1;
  if (cloud_2_x < 0){
    cloud_2_x = 450 + 10 * (frame % 20); // respawn offset
    cloud_2_y = 2 * (frame % 20); // respawn offset
  }

  unsigned* p = (unsigned*)SCROLL_X;
  *p = *p - 6;
}

int score;

int handle_collisions(void){
  // collision
  if (obstacle_1_x <= DINO_X + 1 && obstacle_1_x + 6 >= DINO_X){
    if (obstacle_1_y - 10 < dino_y){
      return 1; 
    } else {
      score += 1;
    }
  }
  if (obstacle_2_x <= DINO_X + 1 && obstacle_2_x + 10 >= DINO_X){
    if (obstacle_2_y - 5 < dino_y){
      return 1;
    } else {
      score += 1;
    }
  }
  return 0;
}

int update_positions(){
  unsigned* p;
  p = (unsigned*)SPRITE_0_X;
  *p = obstacle_1_x;
  p = (unsigned*)SPRITE_0_Y;
  *p = obstacle_1_y;

  p = (unsigned*)SPRITE_1_X;
  *p = obstacle_2_x;
  p = (unsigned*)SPRITE_1_Y;
  *p = obstacle_2_y;

  p = (unsigned*)SPRITE_2_X;
  *p = DINO_X;
  p = (unsigned*)SPRITE_2_Y;
  *p = dino_y;

  p = (unsigned*)SPRITE_4_X;
  *p = cloud_1_x;
  p = (unsigned*)SPRITE_4_Y;
  *p = cloud_1_y;

  p = (unsigned*)SPRITE_5_X;
  *p = cloud_2_x;
  p = (unsigned*)SPRITE_5_Y;
  *p = cloud_2_y;
}

int do_animations(void);

int game_over[23] = {0x47,0X61,0X6D,0X65,0X20,0X4F,0X76,0X65,0X72,0X0A,0X59,0X6F,0X75,0X72,0X20,0X53,0X63,0X6F,0X72,0X65,0X3A,0X20,0X00};

unsigned main(void){
  write_text_tilemap(0x000, 0xe88);
  init_dino();
  init_obstacles();
  init_ground_tiles();

  start: dino_y = 100;
  dino_vy = 0;
  is_jumping = 1;

  obstacle_1_x = 300;
  obstacle_1_y = 152;
  obstacle_2_x = 600;
  obstacle_2_y = 152;
  cloud_1_x = 250;
  cloud_1_y = 60;
  cloud_2_x = 150;
  cloud_2_y = 40;
  sun_x = 260;
  sun_y = 30;
  frame = 0;

  reset_cursor();
  init_sky();

  unsigned *p = (unsigned*)RESOLUTION_REG;
  *p = 1;

  p = (unsigned*)SPRITE_3_X;
  *p = sun_x;
  p = (unsigned*)SPRITE_3_Y;
  *p = sun_y;

  p = (unsigned*)INPUT_STREAM;

  while (1){
    update_positions();

    // input
    p = (unsigned*)INPUT_STREAM;
    unsigned key = *p;
    if (key == 0x71) return 0; // 'q' to quit
    if (key == 0x20 && !is_jumping){ // spacebar
      dino_vy = 13;//JUMP_VELOCITY;
      dino_y -= 3;
      is_jumping = 1;
    }

    handle_physics();

    move_obstacles();

    if (handle_collisions()){
      // game over
      p = (unsigned*)SCROLL_X;
      *p = 0;
      print(game_over);
      print_unsigned(score);
      while (1){
        // input
        p = (unsigned*)INPUT_STREAM;
        unsigned key = *p;
        if (key == 0x71) return 0; // 'q' to quit
        if (key != 0) goto start;
      }
    }

    if (!(frame % 10))
      do_animations();

    frame++;
    for (unsigned delay = 0; delay < 40000; ++delay)
      ;//for (unsigned delay = 0; delay < 3; ++delay);
  }
}