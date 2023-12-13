disas
    int REGISTER1;
    bin REGISTER2;
    hex REGISTER3;

    se-o-ber (REGISTER1 leo 10) {
        REGISTER1 = 20;
    } senao-o-ber {
        REGISTER2 = 0b101010;
    }
    
    enquanto-o-ber (REGISTER2 lucca 0b111111) {
        REGISTER2 = REGISTER2 + 0b1;
    }

    REGISTER3 = 0x1af;
    
.leo