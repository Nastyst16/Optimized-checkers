; Copyright 2023 Nastase Cristian-Gabriel 315CA

section .data

i: ; i = x
    dd 0
j: ; j = y
    dd 0
pos: ; position
    dd 0

board_0:    ; board[0] address
    dd 0
board_1:    ; board[1] address
    dd 0

section .text
    global bonus

bonus:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; board

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE

    ; for not losing the values of x and y
    ; we are going to store them in i and j
    mov [i], eax
    mov [j], ebx

    ; calculating position
    xor ebx, ebx
    mov ebx, 8
    mul ebx

    mov ebx, [j]
    add eax, ebx
    mov [pos], eax

    ; for not losing the values of board[0] and [1]
    ; we are going to store them
    mov [board_0], ecx
    add ecx, 4
    mov [board_1], ecx
    sub ecx,4

    if_1: ; if (57 <= pos <= 62) -> upper edge

        mov eax, [pos]
        cmp eax, 57
        jl end_if_1
        mov eax, [pos]
        cmp eax, 62
        jg end_if_1

        mov ebx, 5  ; in binary means 101
        mov ecx, [pos]
        sub ecx, 9

        ; shifting on board_0
        call shift_board_0

        jmp end
    end_if_1:


    if_2: ; if (1 <= pos <= 6) -> bottom edge

        mov eax, [pos]
        cmp eax, 1
        jl end_if_2
        mov eax, [pos]
        cmp eax, 6
        jg end_if_2

        mov ebx, 5  ; in binary means 101
        mov ecx, [pos]
        add ecx, 7

        call shift_board_1

        jmp end
    end_if_2:


    if_3: ; if (pos == 40)

        mov eax, [pos]
        cmp eax, 40
        jne end_if_3

        mov ebx, 1
        mov ecx, [pos]
        add ecx, 9
        call shift_board_0

        mov ebx, 1
        mov ecx, [pos]
        sub ecx, 7

        ; shifting on board_0
        call shift_board_0

        jmp end
    end_if_3:

    if_4: ; if (pos == 48)

        mov eax, [pos]
        cmp eax, 48
        jne end_if_4

        mov ebx, 1
        mov ecx, [pos]
        add ecx, 9
        call shift_board_0

        mov ebx, 1
        mov ecx, [pos]

        sub ecx, 7
        ; shifting on board_0
        call shift_board_0

        jmp end
    end_if_4:

    if_5: ; if (pos == 55)

        mov eax, [pos]
        cmp eax, 55
        jne end_if_5

        mov ebx, 1
        mov ecx, [pos]
        add ecx, 7

        call shift_board_0

        mov ebx, 1
        mov ecx, [pos]

        sub ecx, 9
        ; shifting on board_0
        call shift_board_0

        jmp end
    end_if_5:

    if_6: ; if (pos == 47)

        mov eax, [pos]
        cmp eax, 47
        jne end_if_6

        mov ebx, 1
        mov ecx, [pos]
        add ecx, 7
        call shift_board_0

        mov ebx, 1
        mov ecx, [pos]

        sub ecx, 9
        ; shifting on board_0
        call shift_board_0

        jmp end
    end_if_6:

    if_7: ; if (pos == 8)

        mov eax, [pos]
        cmp eax, 8
        jne end_if_7

        mov ebx, 1
        mov ecx, [pos]
        add ecx, 9
        call shift_board_1

        mov ebx, 1
        mov ecx, [pos]
        sub ecx, 7
        call shift_board_1
        jmp end

    end_if_7:

    if_8: ; if (pos == 16)

        mov eax, [pos]
        cmp eax, 16
        jne end_if_8

        mov ebx, 1
        mov ecx, [pos]
        add ecx, 9
        call shift_board_1

        mov ebx, 1
        mov ecx, [pos]
        sub ecx, 7
        call shift_board_1

        jmp end
    end_if_8:

    if_9: ; if (pos == 15)

        mov eax, [pos]
        cmp eax, 15
        jne end_if_9

        mov ebx, 1
        mov ecx, [pos]
        add ecx, 7
        call shift_board_1

        mov ebx, 1
        mov ecx, [pos]
        sub ecx, 9
        call shift_board_1

        jmp end
    end_if_9:

    if_10: ; if (pos == 23)

        mov eax, [pos]
        cmp eax, 23
        jne end_if_10

        mov ebx, 1
        mov ecx, [pos]
        add ecx, 7
        call shift_board_1

        mov ebx, 1
        mov ecx, [pos]
        sub ecx, 9
        call shift_board_1

        jmp end
    end_if_10:

    if_11: ; if (25 <= pos <= 38)

        mov eax, [pos]
        cmp eax, 31
        je if_17

        mov eax, [pos]
        cmp eax, 32
        je if_18

        mov eax, [pos]
        cmp eax, 25
        jl end_if_11

        mov eax, [pos]
        cmp eax, 38
        jg end_if_11

        mov ebx, 5  ; in binary means 101
        mov ecx, [pos]
        sub ecx, 25


        call shift_board_0

        mov ebx, 5  ; in binary means 101
        mov ecx, [pos]
        sub ecx, 9
        call shift_board_1

        jmp end
    end_if_11:

    if_12: ; if (pos == 0)

        mov eax, [pos]
        cmp eax, 0
        jne end_if_12

        mov ebx, 1
        mov ecx, [pos]
        add ecx, 9
        call shift_board_1

        jmp end
    end_if_12:

    if_13: ; if (pos == 7)

        mov eax, [pos]
        cmp eax, 7
        jne end_if_13

        mov ebx, 1
        mov ecx, [pos]
        add ecx, 7
        call shift_board_1

        jmp end
    end_if_13:

    if_14: ; if (pos == 56)

        mov eax, [pos]
        cmp eax, 56
        jne end_if_14

        mov ebx, 1
        mov ecx, [pos]

        sub ecx, 7
        ; shifting on board_0
        call shift_board_0

        jmp end
    end_if_14:

    if_15: ; if (pos == 63)

        mov eax, [pos]
        cmp eax, 63
        jne end_if_15

        mov ebx, 1
        mov ecx, [pos]

        sub ecx, 9
        ; shifting on board_0
        call shift_board_0

        jmp end
    end_if_15:

    if_16: ; if (pos == 24)

        mov eax, [pos]
        cmp eax, 24
        jne end_if_16

        mov ebx, 1
        mov ecx, [pos]
        sub ecx, 7
        call shift_board_1

        mov ebx, 1

        mov ecx, 1
        ; shifting on board_0
        call shift_board_0

        jmp end
    end_if_16:

    if_17: ; if (pos == 31)

        mov eax, [pos]
        cmp eax, 31
        jne end_if_17

        mov ebx, 1
        mov ecx, [pos]
        sub ecx, 9
        call shift_board_1

        mov ebx, 1

        mov ecx, 6
        ; shifting on board_0
        call shift_board_0

        jmp end
    end_if_17:

    if_18: ; if (pos == 32)

        mov eax, [pos]
        cmp eax, 32
        jne end_if_18

        mov ebx, 1
        mov ecx, [pos]
        sub ecx, 7
        call shift_board_1

        mov ebx, 1

        mov ecx, 9
        ; shifting on board_0
        call shift_board_0

        jmp end
    end_if_18:

    if_19: ; if (pos == 39)

        mov eax, [pos]
        cmp eax, 39
        jne end_if_19

        mov ebx, 1
        mov ecx, [pos]
        sub ecx, 9
        call shift_board_1

        mov ebx, 1
        mov ecx, 14


        ; shifting on board_0
        call shift_board_0

        jmp end
    end_if_19:

    ; if we reached here, we verify if we are
    ; inside of board[0] or board[1]
    if_20: ; if (pos > 32) -> inside board[0]

        mov eax, [pos]
        cmp eax, 32
        jl if_21

        mov ebx, 5  ; in binary means 101
        mov ecx, [pos]
        sub ecx, 32
        add ecx, 7
        call shift_board_0

        mov ebx, 5  ; in binary means 101
        mov ecx, [pos]
        sub ecx, 32

        sub ecx, 9
        ; shifting on board_0
        call shift_board_0

        jmp end
    end_if_20:

    if_21: ; if (pos < 32) -> inside board[1]

        ; we dont need to verify, because if we reached
        ; here, it means the condition is true

        mov ebx, 5  ; in binary means 101
        mov ecx, [pos]
        add ecx, 7
        call shift_board_1

        mov ebx, 5  ; in binary means 101
        mov ecx, [pos]
        sub ecx, 9
        call shift_board_1
        jmp end

    end_if_21:

    shift_board_0:
        shl ebx, cl
        mov ecx, [board_0]
        or dword [ecx], ebx
        ret

    shift_board_1:
        shl ebx, cl
        mov ecx, [board_1]
        or dword [ecx], ebx
        ret

    end:

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY

    ;  Bonus
    ;     This is the only implementation I could think of.
    ; There are 21 if-s that treats all the possible situations.

    ;     I modularised the shifting for board[0] (line 471->475) and
    ; board[1] (line 477->481)
    ;     The if-s are numbered and the comment tells what happens:
    ; example: (label)if_1: ; if (57 <= pos <= 62) -> upper edge
