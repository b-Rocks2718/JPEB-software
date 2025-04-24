
extern unsigned UART_TX_REG;
extern unsigned INPUT_STREAM;

// hello\n
// unsigned text[6] = {0x68, 0x65, 0x6C, 0x6C, 0x6F, 0x0A};

// unsigned main(void) {
//     unsigned* ptr = (unsigned*) UART_TX_REG;
//     while (1) {
//         for (int i = 0; i < 6; ++i) {
//             *ptr = text[i];
//         }
//         for (unsigned delay = 0; delay < 1000; ++delay) {
//             for (unsigned delay2 = 0; delay2 < 1000; ++delay2);
//         }
//     }
// }

// Prints what is typed to serial
unsigned main(void) {

    unsigned* txPtr = (unsigned*) UART_TX_REG;
    unsigned* inputPtr = (unsigned*) INPUT_STREAM;
    
    while (1) {
        unsigned key = *inputPtr;
        // Not empty and not key release
        if ((key & 0x00FF) != 0 && (key & 0xFF00) != 0xF000) {
            *txPtr = key;
        }
        for (unsigned delay = 0; delay < 100; ++delay);
    }
}