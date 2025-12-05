	.global	start
	.type	start, %function
start:
    // STUDENTS, DO NOT MODIFY
    // Load tree into x0
    adrp    x0, .root
    add     x0, x0, :lo12:.root
    bl       tree_depth

    // Print result
    movz    x1, 0
    mvn     x1, x1
    stur    x0, [x1]
    movz    x30, 0
    ret

.size	start, .-start


    .type tree_depth, %function
tree_depth:
    MOVZ X1, #0
    CMP X0, X1 
    B.EQ base_case // root = NULL

    LDUR X1, [X0, #0]  // X1 = root->left
    SUB SP, SP, #16
    STUR X0, [SP, #8] // store root pointer
    STUR X30, [SP, #0] // store return address

    MOVZ X0, #0
    ADDS X0, X0, X1
    BL tree_depth

    MOVZ X2, #0
    ADDS X2, X2, X0 // X2 = left_depth

    LDUR X30, [SP, #0] // restore return address
    LDUR X0, [SP, #8] // restore root pointer
    ADD SP, SP, #16 // pop stack



    //right_depth

    LDUR X1, [X0, #8] // x1 = root->right
    SUB SP, SP, #16
    STUR X2, [SP, #8] //store root pointer
    STUR X30, [SP, #0] //store return address

    MOVZ X0, #0
    ADDS X0, X0, X1
    BL tree_depth

    MOVZ X3, #0
    ADDS X3, X3, X0 // X3 = right_depth

    LDUR X30, [SP, #0] // restore return address
    LDUR X2, [SP, #8] // restore root pointer
    ADD SP, SP, #16 // pop stack

    // compare left depth to right depth
    CMP X2, X3
    B.GE left_bigger

    ADD X0, X3, #1
    RET

    left_bigger:
        ADD X0, X2, #1
        RET

    base_case:
        MOVZ X0, #0
        RET

        .size	tree_depth, .-tree_depth


    // DO NOT MODIFY BELOW HERE
    .size	tree_depth, .-tree_depth


.data
.align 3

.root:
.tn0:
        .xword  .tn1
        .xword  .tn9
        .xword  628175011
.tn1:
        .xword  .tn2
        .xword  .tn4
        .xword  1656478042
.tn2:
        .xword  0
        .xword  .tn3
        .xword  1131176229
.tn3:
        .xword  0
        .xword  0
        .xword  1653377373
.tn4:
        .xword  .tn5
        .xword  .tn6
        .xword  859484421
.tn5:
        .xword  0
        .xword  0
        .xword  1914544919
.tn6:
        .xword  .tn7
        .xword  .tn8
        .xword  608413784
.tn7:
        .xword  0
        .xword  0
        .xword  756898537
.tn8:
        .xword  0
        .xword  0
        .xword  1734575198
.tn9:
        .xword  .tn10
        .xword  .tn18
        .xword  1973594324
.tn10:
        .xword  .tn11
        .xword  .tn12
        .xword  149798315
.tn11:
        .xword  0
        .xword  0
        .xword  2038664370
.tn12:
        .xword  .tn13
        .xword  .tn17
        .xword  1129566413
.tn13:
        .xword  .tn14
        .xword  .tn16
        .xword  184803526
.tn14:
        .xword  0
        .xword  .tn15
        .xword  412776091
.tn15:
        .xword  0
        .xword  0
        .xword  1424268980
.tn16:
        .xword  0
        .xword  0
        .xword  1911759956
.tn17:
        .xword  0
        .xword  0
        .xword  749241873
.tn18:
        .xword  0
        .xword  0
        .xword  137806862
