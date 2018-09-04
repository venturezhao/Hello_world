# sample assemble
define IMG_ADDR   0x10000
define IMG_L_LEN  0x00100
define WT_ADDR    0x20000

.data_sect(0x10000)


.text_sect(0x0000)
    # load weight data
    addr r11, r0, WT_ADDR
    xload ry0(0), r11
    jnz csr.ld $
    # load 1st line of featuremap
    addi r10, r0, IMG_ADDR
    xload rx0(1), r10
    jnz csr.ld $
    # load 2nd line of featuremap
    addi r10, r10, LMG_L_LEN
    xload rx0(1), r10
    jnz csr.ld $
    # feed padding
    # set offest
    addi r12, r0, 0
    addi r13, r0, 0
    # do conv operation
    xmul rp0, rx0(r12), ry0(r13)
    addi r12, r12, 1
    addi r13, r13, 1
    xmac rp0, rx0(r12), ry0(r13), 8
    # 
