unsigned FRAME_BUFFER_TOP = 0xE000;
unsigned FRAME_BUFFER_SIZE = 0x2000;
unsigned SCREEN_WIDTH_TILES = 128;
unsigned SCREEN_HEIGHT_TILES = 64;

extern unsigned RESOLUTION_REG;
extern unsigned INPUT_STREAM;
extern unsigned FRAMEBUFFER_START;
extern unsigned TILEMAP_START;
extern unsigned SCROLL_X;
extern unsigned SCROLL_Y;

unsigned GRAVITY = -0x002;
unsigned JUMP_VELOCITY = 0x030;
unsigned GROUND_Y = 50 * 0x0100;  // in fixed pounsigned
unsigned DINO_X = 10;

// variables
unsigned dino_y = 12800;
unsigned dino_vy = 0;
unsigned is_jumping = 0;

unsigned obstacle_x = 80;
unsigned obstacle_y = 12800;

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

int draw_dino(unsigned x, unsigned y){
  draw_box(x, y, 2, 3, 0x0F0); // green dino
}

int draw_obstacle(unsigned x, unsigned y){
  draw_box(x, y, 2, 2, 0xF00); // red cactus
}

unsigned dino_main(void){
  write_text_tilemap(0x0F0, 0x000);
  clear_screen();

  unsigned *p = (unsigned*)RESOLUTION_REG;
  *p = 0;

  p = (unsigned*)INPUT_STREAM;

  unsigned frame = 0;

  while (1){
    // clear previous frames
    clear_box(DINO_X, dino_y >> 8, 2, 3);
    clear_box(obstacle_x, obstacle_y >> 8, 2, 2);

    // input
    unsigned key = *p;
    if (key == 0x71) return 0; // 'q' to quit
    if (key == 0x20 && !is_jumping){ // spacebar
      dino_vy = JUMP_VELOCITY;
      is_jumping = 1;
    }

    // physics
    dino_y += dino_vy;
    dino_vy += GRAVITY;

    if (dino_y >= GROUND_Y){
      dino_y = GROUND_Y;
      dino_vy = 0;
      is_jumping = 0;
    }

    // move obstacle
    obstacle_x -= 1;
    if (obstacle_x < 0){
      obstacle_x = 80 + (frame % 20); // respawn offset
    }

    // draw new frames
    draw_dino(DINO_X, dino_y >> 8);
    draw_obstacle(obstacle_x, obstacle_y >> 8);

    // collision
    if (obstacle_x <= DINO_X + 1 && obstacle_x + 1 >= DINO_X){
      unsigned dino_top = dino_y >> 8;
      unsigned obs_top = obstacle_y >> 8;
      if (dino_top + 3 > obs_top){
        write_text_tilemap(0xF00, 0x000);
        return 1; // game over
      }
    }

    frame++;
    for (unsigned delay = 0; delay < 5000; ++delay); // crude delay
  }
}