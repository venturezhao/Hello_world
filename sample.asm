# sample assemble
define IMG_ADDR 0x0000
define WT_ADDR 0x10000

.text_sect
    # load fm & weight data
    addi r10, r0, IMG_ADDR
    xload rx0, r10, 0
    addr r11, r0, WT_ADDR
    xload ry0, r11, 0
    # set offest
    addi r12, r0, 0
    addi r13, r0, 0
    # do conv operation
    xmul rp0, rx0, ry0, r12, r13
    addi r12, r12, 1
    addi r13, r13, 1
    xmac rp0, rx0, ry0, r12, r13, 8
