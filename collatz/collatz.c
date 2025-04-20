// link with text.c

int write_tilemap(void);
unsigned putchar(unsigned c);
unsigned print_unsigned(unsigned x);
unsigned clear_screen(void);
unsigned print(unsigned* string);

extern unsigned cursor_index;
extern unsigned line_index;
extern unsigned RESOLUTION_REG;
extern unsigned INPUT_STREAM;
extern unsigned ZERO_CHAR;

unsigned next_collatz(unsigned x){
  if (x & 1){
    // if x is odd, return 3 * x + 1
    return x + x + x + 1;
  } else {
    // if x is even, return x/2
    return x >> 1;
  }
}

unsigned print_seq(unsigned x){
  unsigned max = x;
  unsigned i = 0;

  putchar(67); // C
  putchar(111); // o
  putchar(108); // l
  putchar(108); // l
  putchar(97); // a
  putchar(116); // t
  putchar(122); // z
  putchar(58); // :
  putchar(10); // \n
  

  while (x != 1){
    print_unsigned(x);
    putchar(44); // ,
    x = next_collatz(x);
    if (x > max) max = x;
    ++i;
  }
  print_unsigned(x);
  putchar(10); //\n
  putchar(10); //\n
  putchar(77); // M
  putchar(97); // a
  putchar(120); // x
  putchar(58); // :
  putchar(32); // space
  print_unsigned(max);
  putchar(10);
}

unsigned digits[3];

unsigned read_num(void){
  int result = 100 * digits[0] + 10 * digits[1] + digits[2];
  return result;
}

// Enter a 3 digit number \n
unsigned msg[25] = {0x45, 0x6E, 0x74, 0x65, 0x72, 0x20, 0x61, 0x20, 0x33,
                0x20, 0x64, 0x69, 0x67, 0x69, 0x74, 0x20, 0x6E, 0x75, 0x6D, 
                0x62, 0x65, 0x72, 0x3A, 0x0A, 0x0};

// q to quit\n
unsigned msg2[15] = {0x28, 0x71, 0x20, 0x74, 0x6F, 0x20, 0x71, 0x75, 
  0x69, 0x74, 0x29, 0x0A, 0x0};

// press any key to restart
unsigned msg3[26] = {0X50,0X72,0X65,0X73,0X73,0X20,0X61,0X6E,0X79,0X20,0X6B,0X65,
  0X79,0X20,0X74,0X6F,0X20,0X72,0X65,0X73,0X74,0X61,0X72,0X74,0X0A,0X00};

int main(void) {
  write_tilemap();
  unsigned *p = (unsigned*)RESOLUTION_REG;
  // decrease resolution
  *p = 1;

  print(msg);

  p = (unsigned*)INPUT_STREAM;

  while (1){
    int d = 0;
    int i = 0;
    while (1){
      d = *p; // read input
      if (d != 0) {
        putchar(d);
        if (d < ZERO_CHAR || d > ZERO_CHAR + 9) goto end; // invalid input
        digits[i] = d - ZERO_CHAR; // store input
        ++i;
        if (i == 3) break;
      }
    }

    unsigned result = read_num();
    if (result < 1) goto end; // invalid input
    putchar(10);
    print_seq(result);
    putchar(10);
    print(msg3);
    print(msg2);

    while (1){
      d = *p; // start over on next keypress
      if (d != 0) {
        if (d == 0x71) return 0; // this was a q
        end: clear_screen();
        print(msg);
        break;
      }
    }
  }
}