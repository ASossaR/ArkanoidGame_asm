bits 64
default rel

;Here comes the defines
sys_read: equ 0 
sys_write:  equ 1
sys_nanosleep:  equ 35
sys_time:   equ 201
sys_fcntl:  equ 72

STDIN_FILENO: equ 0

F_SETFL:	equ 0x0004
O_NONBLOCK: equ 0x0004

;screen definition
row_cells:  equ 32  ; set to any (reasonable) value you wish
column_cells:   equ 80 ; set to any (reasonable) value you wish
array_length:   equ row_cells * column_cells + row_cells ; cells are mapped to bytes in the array and a new line char ends each row

;This is regarding the sleep time
timespec:
    tv_sec  dq 0
    tv_nsec dq 10000000 

;This is for cleaning up the screen
clear:      db 27, "[2J", 27, "[H"
clear_length:   equ $-clear
    
; Start Message
msg0: db "________________________________________________________________________________", 0xA
msg1: db "                                                                                ", 0xA, 0xA, 0xA, 0xA, 0xA
msg2: db "               __________________________________________________               ", 0xA
msg3: db "                                                                                ", 0xA, 0xA, 0xA, 0xA, 0xA, 0xA, 0xA
msg4: db "                            TECNOLOGICO DE COSTA RICA                           ", 0xA, 0xD 
msg5: db "                         ARQUITECTURA DE COMPUTADORAS I                         ", 0xA, 0xD
msg6: db "                               ALVARO SOSSA ROJAS                               ", 0xA, 0xD
msg7: db "                           GENESIS SOFIA MENDEZ CASTRO                          ", 0xA, 0xD
msg8: db "                                    ARKANOID                                    ", 0xA, 0xD
msg9: db "                     PRESIONE CUALQUIER TECLA PARA INICIAR                      ", 0xA, 0xD
msg10: db "                                                                                ", 0xA, 0xA, 0xA, 0xA, 0xA, 0xA, 0xA
msg11: db "               __________________________________________________               ", 0xA
msg12: db "                                                                                ", 0xA, 0xA, 0xA, 0xA, 0xA
msg13: db "________________________________________________________________________________", 0xA
msg0_length:	equ $-msg0
msg1_length:	equ $-msg1
msg2_length:	equ $-msg2
msg3_length:	equ $-msg3
msg4_length:	equ $-msg4
msg5_length:    equ $-msg5
msg6_length:    equ $-msg6
msg7_length:    equ $-msg7
msg8_length:    equ $-msg8
msg9_length:    equ $-msg9
msg10_length:    equ $-msg10
msg11_length:    equ $-msg11
msg12_length:    equ $-msg12
msg13_length:    equ $-msg13

; Game Over Message
game_over_word0: db "________________________________________________________________________________", 0xA
game_over_word1: db "                                                                                ", 0xA, 0xA, 0xA, 0xA, 0xA
game_over_word2: db "               __________________________________________________               ", 0xA
game_over_word3: db "                                                                                ", 0xA, 0xA, 0xA, 0xA, 0xA, 0xA, 0xA
game_over_word4: db "                                    Game Over                                   ", 0xA, 0xD 
game_over_word5: db "                                                                                ", 0xA, 0xD
game_over_word6: db "                                    Game Over                                   ", 0xA, 0xD
game_over_word7: db "                                                                                ", 0xA, 0xD
game_over_word8: db "                                    Game Over                                   ", 0xA, 0xD
game_over_word9: db "                                                                                ", 0xA, 0xD
game_over_word10: db "                                                                                ", 0xA, 0xA, 0xA, 0xA, 0xA, 0xA, 0xA
game_over_word11: db "               __________________________________________________               ", 0xA
game_over_word12: db "                                                                                ", 0xA, 0xA, 0xA, 0xA, 0xA
game_over_word13: db "________________________________________________________________________________", 0xA
game_over_word0_length:    equ $-game_over_word0
game_over_word1_length:    equ $-game_over_word1
game_over_word2_length:    equ $-game_over_word2
game_over_word3_length:    equ $-game_over_word3
game_over_word4_length:    equ $-game_over_word4
game_over_word5_length:    equ $-game_over_word5
game_over_word6_length:    equ $-game_over_word6
game_over_word7_length:    equ $-game_over_word7
game_over_word8_length:    equ $-game_over_word8
game_over_word9_length:    equ $-game_over_word9
game_over_word10_length:    equ $-game_over_word10
game_over_word11_length:    equ $-game_over_word11
game_over_word12_length:    equ $-game_over_word12
game_over_word13_length:    equ $-game_over_word13

; You Win Message
you_win_word0: db "________________________________________________________________________________", 0xA
you_win_word1: db "                                                                                ", 0xA, 0xA, 0xA, 0xA, 0xA
you_win_word2: db "               __________________________________________________               ", 0xA
you_win_word3: db "                                                                                ", 0xA, 0xA, 0xA, 0xA, 0xA, 0xA, 0xA
you_win_word4: db "                                     You Win                                    ", 0xA, 0xD 
you_win_word5: db "                                                                                ", 0xA, 0xD
you_win_word6: db "                                     You Win                                    ", 0xA, 0xD
you_win_word7: db "                                                                                ", 0xA, 0xD
you_win_word8: db "                                     You Win                                    ", 0xA, 0xD
you_win_word9: db "                                                                                ", 0xA, 0xD
you_win_word10: db "                                                                                ", 0xA, 0xA, 0xA, 0xA, 0xA, 0xA, 0xA
you_win_word11: db "               __________________________________________________               ", 0xA
you_win_word12: db "                                                                                ", 0xA, 0xA, 0xA, 0xA, 0xA
you_win_word13: db "________________________________________________________________________________", 0xA
you_win_word0_length:    equ $-you_win_word0
you_win_word1_length:    equ $-you_win_word1
you_win_word2_length:    equ $-you_win_word2
you_win_word3_length:    equ $-you_win_word3
you_win_word4_length:    equ $-you_win_word4
you_win_word5_length:    equ $-you_win_word5
you_win_word6_length:    equ $-you_win_word6
you_win_word7_length:    equ $-you_win_word7
you_win_word8_length:    equ $-you_win_word8
you_win_word9_length:    equ $-you_win_word9
you_win_word10_length:    equ $-you_win_word10
you_win_word11_length:    equ $-you_win_word11
you_win_word12_length:    equ $-you_win_word12
you_win_word13_length:    equ $-you_win_word13

; Usefull macros
%macro setnonblocking 0
	mov rax, sys_fcntl
    mov rdi, STDIN_FILENO
    mov rsi, F_SETFL
    mov rdx, O_NONBLOCK
    syscall
%endmacro

%macro unsetnonblocking 0
	mov rax, sys_fcntl
    mov rdi, STDIN_FILENO
    mov rsi, F_SETFL
    mov rdx, 0
    syscall
%endmacro

%macro full_line 0              ;bottom line
    times column_cells db "_"
    db 0x0a, 0xD
%endmacro

%macro full_line_up 0           ;top line
    times column_cells db "_"
    db 0x0a, 0xD
%endmacro

%macro hollow_line 0            ;line of the sides
    db "|"
    times column_cells-2 db " "
    db "|", 0x0a, 0xD
%endmacro

%macro print 2
	mov eax, sys_write 
	mov edi, 1 	; stdout
	mov rsi, %1 ;
	mov edx, %2 ;
	syscall
%endmacro

%macro getchar 0
	mov     rax, sys_read
    mov     rdi, STDIN_FILENO
    mov     rsi, input_char
    mov     rdx, 1 ; number of bytes to read
    syscall        ;read text input from keyboard
%endmacro

%macro sleeptime 0
	mov eax, sys_nanosleep
	mov rdi, timespec
	xor esi, esi		; ignore remaining time in case of call interruption
	syscall			    ; sleep for tv_sec seconds + tv_nsec nanoseconds
%endmacro

%macro save_value 2     ;function to save value in global variable
    push rax
    mov rax, [%1]
    mov rax, %2
    mov [%1], rax
    pop rax 
%endmacro

%macro blocks_draw 3 ; function to draw blocks
    mov r10, board + %1 + %2 * (column_cells+2)
    mov byte [r10], %3
    mov byte [r10+1], %3
    mov byte [r10-1], %3
%endmacro

%macro draw_clean_blocks 3 ;to clean all the map
    mov r10, board + %1 + %2 * (column_cells+2)
    mov byte [r10], %3
    mov byte [r10-1], %3
    mov byte [r10+1], %3
    mov byte [r10+2], %3
    mov byte [r10+3], %3
    mov byte [r10+4], %3
    mov byte [r10+5], %3
    mov byte [r10+6], %3
    mov byte [r10+7], %3
    mov byte [r10+8], %3
    mov byte [r10+9], %3
    mov byte [r10+10], %3
    mov byte [r10+11], %3
    mov byte [r10+12], %3
    mov byte [r10+13], %3
    mov byte [r10+14], %3
    mov byte [r10+15], %3
    mov byte [r10+16], %3
    mov byte [r10+17], %3
    mov byte [r10+18], %3
    mov byte [r10+19], %3
    mov byte [r10+20], %3
    mov byte [r10+21], %3
    mov byte [r10+22], %3
    mov byte [r10+23], %3
    mov byte [r10+24], %3
    mov byte [r10+25], %3
    mov byte [r10+26], %3
    mov byte [r10+27], %3
    mov byte [r10+28], %3
    mov byte [r10+29], %3
    mov byte [r10+30], %3
    mov byte [r10+31], %3
    mov byte [r10+32], %3
    mov byte [r10+33], %3
    mov byte [r10+34], %3
    mov byte [r10+35], %3
    mov byte [r10+36], %3
    mov byte [r10+37], %3
    mov byte [r10+38], %3
    mov byte [r10+39], %3
    mov byte [r10+40], %3
    mov byte [r10+41], %3
    mov byte [r10+42], %3
    mov byte [r10+43], %3
    mov byte [r10+44], %3
    mov byte [r10+45], %3
    mov byte [r10+46], %3
    mov byte [r10+47], %3
    mov byte [r10+48], %3
    mov byte [r10+49], %3
    mov byte [r10+50], %3
    mov byte [r10+51], %3
    mov byte [r10+52], %3
    mov byte [r10+53], %3
    mov byte [r10+54], %3
    mov byte [r10+55], %3
    mov byte [r10+56], %3
    mov byte [r10+57], %3
    mov byte [r10+58], %3
    mov byte [r10+59], %3
    mov byte [r10+60], %3
    mov byte [r10+61], %3
    mov byte [r10+62], %3
    mov byte [r10+63], %3
    mov byte [r10+64], %3
    mov byte [r10+65], %3
    mov byte [r10+66], %3
    mov byte [r10+67], %3
    mov byte [r10+68], %3
    mov byte [r10+69], %3
    mov byte [r10+70], %3
    mov byte [r10+71], %3
    mov byte [r10+72], %3
    mov byte [r10+73], %3
    mov byte [r10+74], %3
    mov byte [r10+75], %3
    mov byte [r10+76], %3
%endmacro
;________________________________________________________________________________

global _start


section .bss ; 
    input_char: resb 1    ;The value read from the keyboard is stored in memory.

;________________________________________________________________________________

section .data ; Here you write the variables

    board: ;Here the action board is drawn
        db "                     "
        times column_cells-20 db " "
        db 0x0a, 0xD
        full_line_up
        %rep 30
        hollow_line
        %endrep
        full_line
    board_size:   equ   $ - board

    ; Added for the terminal issue
    termios:        times 36 db 0
    stdin:          equ 0
    ICANON:         equ 1<<1
    ECHO:           equ 1<<3
    VTIME: 			equ 5
    VMIN:			equ 6
    CC_C:			equ 18

    setcolor db 27, '[40m', 0 ; To change background color
    .len equ $ - setcolor

;___________________________________ Screen Up ___________________________________

    level_word: db "     LEVEL: "
    level_word_length: equ $-level_word
    counter_level: db 49                        ; initiates counter level in: 49 -> 1 (first level)
    counter_level_length: equ $-counter_level

    score_word: db "                      SCORE: "
    score_word_length: equ $-score_word
    counter_tens_score: dq 48                   ; initiates counter tens score in: 48 -> 0 (zero points)
    counter_tens_score_length: equ $-counter_tens_score
    counter_units_score: dq 48                  ; initiates counter units score in: 48 -> 0 (zero points)
    counter_units_score_length: equ $-counter_units_score
   
    lives_word: db "                     LIVES: "
    lives_word_length: equ $-lives_word
    counter_lives: dq 51, 0xA                   ; initiates counter lives in: 51 -> 3 (three first lives)
    counter_live_length: equ $-counter_lives

    msg00: db "________________________________________________________________________________", 0xA
    msg00_length:    equ $-msg00


;___________________________________ Variables ___________________________________

    variable_power dq 0 
    variable_animation_power dq 0 
    variable_shot dq 0 
    variable_animation_shot dq 0 
    variable_life dq 0 
    variable_animation_life dq 0 
    variable_game_speed dq 0 
    
;________________________________________________________________________________


section .text
;;;;;;;;;;;;;;;;;;;;for the working of the terminal;;;;;;;;;;;;;;;;;

    canonical_off:
        call read_stdin_termios

        ;clear canonical bit in local mode flags
        push rax
        mov eax, ICANON
        not eax
        and [termios+12], eax
        mov byte[termios+CC_C+VTIME], 0
        mov byte[termios+CC_C+VMIN], 0
        pop rax

        call write_stdin_termios
        ret

    echo_off:
        call read_stdin_termios

        ; clear echo bit in local mode flags
        push rax
        mov eax, ECHO
        not eax
        and [termios+12], eax
        pop rax
        call write_stdin_termios
        ret

    canonical_on:
        call read_stdin_termios

        ;set canonical bit in local mode flags
        or dword [termios+12], ICANON
        mov byte[termios+CC_C+VTIME], 0
        mov byte[termios+CC_C+VMIN], 1
        call write_stdin_termios
        ret

    echo_on:
        call read_stdin_termios

        ; set echo bit in local mode flags
        or dword [termios+12], ECHO
        call write_stdin_termios
        ret

    read_stdin_termios:
        push rax
        push rbx
        push rcx
        push rdx

        mov eax, 36h
        mov ebx, stdin
        mov ecx, 5401h
        mov edx, termios
        int 80h

        pop rdx
        pop rcx
        pop rbx
        pop rax
        ret

    write_stdin_termios:
        push rax
        push rbx
        push rcx
        push rdx

        mov eax, 36h
        mov ebx, stdin
        mov ecx, 5402h
        mov edx, termios
        int 80h

        pop rdx
        pop rcx
        pop rbx
        pop rax
        ret

;;;;;;;;;;;;;;;;;;;;end for the working of the terminal;;;;;;;;;;;;

;________________________________________________________________________________


_start:

;___________________________________ Background Color ___________________________________

    mov eax, 4
    mov ebx, 1
    mov ecx, setcolor
    mov edx, setcolor.len
    int 80h
	mov eax, 1
    xor ebx, ebx

;_________________________________ Initialize Registers _________________________________

    mov r8,0  ; board
    mov r9,0  ; ball
    mov r10,0 ; direct ball
    mov r12,0
    mov r15,0 ; init game char 's'
    mov r14,0
    mov r13,0

	call canonical_off
    print clear, clear_length	; clean the screen
	call start_screen	        ; call start screen, wait to press any key
    mov r10, board + 1 + 1 * (column_cells+2)
    mov r13,13

Refresh_level:
    call select_level

	mov r8, board + 40 + 31 * (column_cells+2)   ; Move init position paddle

    mov r9, board + 40 + 30 * (column_cells+2)


    mov r10, 83  ; Initial direction of the ball

;____________________ draw initial position of padle _______________________
    mov byte [r8],   '#'
    mov byte [r8+1], '#'
    mov byte [r8-1], '#'
    mov byte [r8+2], '#' 
    mov byte [r8-2], '#' 

.main_loop:
main_looop:

    mov byte [r9], '0' ; ball

    print level_word, level_word_length
    print counter_level, counter_level_length
    print score_word, score_word_length
    print counter_tens_score, counter_tens_score_length
    print counter_units_score, counter_units_score_length
    print lives_word, lives_word_length
    print counter_lives, counter_live_length
    print msg00, msg00_length 
    print board, board_size			  

.read_more:	            ; Read input for them act
    getchar	            ; Read input char	
    cmp rax, 1          ; there is a key?
    jne .done           ; go to do nothing with input char
    mov al,[input_char]
    cmp al, 'w'
    jne .move_paddle_left
    mov r15, 10
    jmp .done

.move_paddle_left:
    cmp al, 'a'
    jne .move_paddle_rigth
    push r14
    mov r14, [variable_power]
    cmp r14, 4
    je .move_paddle_left_power
    cmp r14, 6
    je .move_paddle_left_power
    cmp r14, 8
    je .move_paddle_left_power
    pop r14
    cmp byte[r8-3],'|'
    je .done
    cmp byte[r8-4],'|'
    je .done
    cmp byte[r8-3],'0'
    je .done
    cmp byte[r8-4],'0'
    je .done
    sub r8, 2
 
    mov byte [r8-2], '#'
    mov byte [r8-1], '#'
    mov byte [r8],   '#'
    mov byte [r8+1], '#'
    mov byte [r8+2], '#'
    mov byte [r8+3], ' '
    mov byte [r8+4], ' ' 
  
    call move_left_paddle_with_ball
    jmp .done

.move_paddle_left_power:
    cmp byte[r8-4],'|'
    je .done
    cmp byte[r8-5],'|'
    je .done
    cmp byte[r8-4],'0'
    je .done
    cmp byte[r8-5],'0'
    je .done
    sub r8, 2

    mov byte [r8-3], '#'
    mov byte [r8-2], '#'
    mov byte [r8-1], '#'
    mov byte [r8],   '#'
    mov byte [r8+1], '#'
    mov byte [r8+2], '#'
    mov byte [r8+3], '#'
    mov byte [r8+4], ' '
    mov byte [r8+5], ' '

    call move_left_paddle_with_ball
    jmp .done

.move_paddle_rigth:
    cmp al, 'd'
    jne .puss_button_shot
    push r14
    mov r14, [variable_power]
    cmp r14, 4
    je .move_paddle_rigth_power
    cmp r14, 6
    je .move_paddle_rigth_power
    cmp r14, 8
    je .move_paddle_rigth_power
    pop r14
    cmp byte[r8+3],'|'
    je .done 
    cmp byte[r8+4],'|'
    je .done
    cmp byte[r8+3],'0'
    je .done
    cmp byte[r8+4],'0'
    je .done
    add r8, 2

    mov byte [r8-4], ' '
    mov byte [r8-3], ' '   
    mov byte [r8-2], '#'
    mov byte [r8-1], '#'
    mov byte [r8],   '#'
    mov byte [r8+1], '#'
    mov byte [r8+2], '#'

    call move_rigth_paddle_with_ball
    jmp .done

.move_paddle_rigth_power:
    cmp byte[r8+4],'|'
    je .done
    cmp byte[r8+5],'|'
    je .done
    cmp byte[r8+4],'0'
    je .done
    cmp byte[r8+5],'0'
    je .done
    add r8, 2

    mov byte [r8-5], ' '
    mov byte [r8-4], ' '   
    mov byte [r8-3], '#'
    mov byte [r8-2], '#'
    mov byte [r8-1], '#'
    mov byte [r8],   '#'
    mov byte [r8+1], '#'
    mov byte [r8+2], '#'
    mov byte [r8+3], '#'

    call move_rigth_paddle_with_ball
    jmp .done

.puss_button_shot:
    cmp al, ' '
    jne .done
    push r14
    mov r14, [variable_power]
    cmp r14, 5
    je .shot_active
    cmp r14, 7
    je .shot_active
    cmp r14, 9
    je .shot_active
    pop r14
    jmp .done

.shot_active:                                   
    mov r14, [variable_shot]
    cmp r14, 1
    je .desshot_active
    save_value variable_shot, 1
    push r8
    sub r8, 82
    save_value variable_animation_shot, r8
    pop r8
    pop r14
    jmp .done

.desshot_active:
    pop r14
    jmp .done

.done:		
    sleeptime
    print clear, clear_length
    cmp r15, 20
    je .wait_key_ball
    push r14
    mov r14, [variable_game_speed]
    inc r14
    cmp r14, 8
    jne .game_speed
    xor r14, 8
    call ball_collision
    call double_PowerUp
    call mov_PowerUP_live
    call PowerUP_on
    call shot_on

.game_speed: 
    mov [variable_game_speed], r14
    pop r14

.wait_key_ball:
    jmp check_level

start_screen:
	print msg0, msg0_length	
	getchar
    cmp rax, 1
    jne .done2
	ret

.done2:         ; Any button
    sleeptime
    print clear, clear_length
    jmp start_screen

exit: 
	call canonical_on
	mov    rax, 60
    mov    rdi, 0
    syscall
  
move_rigth_paddle_with_ball:
	cmp r15, 20
	jne .rigth_not_execute
    add r9,2
    mov byte [r9-1], ' '
    mov byte [r9-2], ' '

.rigth_not_execute:
	ret

move_left_paddle_with_ball:
	cmp r15, 20
	jne .left_not_execute
    sub r9, 2
    mov byte [r9+1], ' '
    mov byte [r9+2], ' '
    ret
.left_not_execute:
	ret

up_lives:
    push    rax
    mov     rax, [counter_lives]
    dec     rax 
    mov     [counter_lives], rax  
    pop     rax   
    ret  

select_level: 
    cmp r13, 13
    je .Level1
    cmp r13, 14
    je .Level2
    cmp r13, 15
    je .Level3  
    cmp r13, 16
    je .Level4
    cmp r13, 17
    je .Level5

;____________________ Clean BackGround___________________

.levelUp_Clean_Screen:
    push rax
    mov rax, [variable_power]
    cmp rax, 4
    jne .clean_power_up_paddle
    mov byte [r8],   ' '
    mov byte [r8+1], ' '
    mov byte [r8-1], ' '
    mov byte [r8+2], ' ' 
    mov byte [r8-2], ' ' 

    .clean_power_up_paddle:
    mov byte [r8],   ' '
    mov byte [r8+1], ' '
    mov byte [r8-1], ' '
    mov byte [r8+2], ' ' 
    mov byte [r8-2], ' ' 
    mov byte [r8+3], ' ' 
    mov byte [r8-3], ' ' 
    pop rax
    mov r10, board + 1 + 1 * (column_cells+2)
    mov r8, board + 40 + 31 * (column_cells+2)
    mov r9, board + 40 + 30 * (column_cells+2)
    save_value variable_animation_power, 0

    ;______________________ Clean Map ______________________

    draw_clean_blocks 3,2,' '
    draw_clean_blocks 3,3,' '
    draw_clean_blocks 3,4,' '
    draw_clean_blocks 3,5,' '
    draw_clean_blocks 3,6,' '
    draw_clean_blocks 3,7,' '
    draw_clean_blocks 3,8,' '
    draw_clean_blocks 3,9,' '
    draw_clean_blocks 3,10,' '
    draw_clean_blocks 3,11,' '
    draw_clean_blocks 3,12,' '
    draw_clean_blocks 3,13,' '
    draw_clean_blocks 3,14,' '
    draw_clean_blocks 3,15,' '
    draw_clean_blocks 3,16,' '
    draw_clean_blocks 3,17,' '
    draw_clean_blocks 3,18,' '
    draw_clean_blocks 3,19,' '
    draw_clean_blocks 3,20,' '
    draw_clean_blocks 3,21,' '
    draw_clean_blocks 3,22,' '
    draw_clean_blocks 3,23,' '
    draw_clean_blocks 3,24,' '
    draw_clean_blocks 3,25,' '
    draw_clean_blocks 3,26,' '
    draw_clean_blocks 3,27,' '
    draw_clean_blocks 3,28,' '
    ;______________________________________________________

    ret

;___________________Level 1___________________
.Level1:

    blocks_draw 3,2,'H'
    blocks_draw 7,2,'H'
    blocks_draw 11,2,'H'
    blocks_draw 15,2,'H'
    blocks_draw 19,2,'H'
    blocks_draw 23,2,'H'
    blocks_draw 27,2,'H'
    blocks_draw 31,2,'H'
    blocks_draw 35,2,'H'
    blocks_draw 39,2,'H'
    blocks_draw 43,2,'H'
    blocks_draw 47,2,'H'
    blocks_draw 51,2,'H'
    blocks_draw 55,2,'H'
    blocks_draw 59,2,'H'
    blocks_draw 63,2,'H'
    blocks_draw 67,2,'H'
    blocks_draw 71,2,'H'
    blocks_draw 75,2,'H'

    blocks_draw 19,9,'L'
    blocks_draw 23,9,'H'
    blocks_draw 27,9,'H'
    blocks_draw 31,9,'H'
    blocks_draw 35,9,'H'
    blocks_draw 39,9,'H'
    blocks_draw 43,9,'H'
    blocks_draw 47,9,'H'
    blocks_draw 51,9,'H'
    blocks_draw 55,9,'H'
    blocks_draw 59,9,'L'

    blocks_draw 31,16,'E'
    blocks_draw 35,16,'H'
    blocks_draw 39,16,'H'
    blocks_draw 43,16,'H'
    blocks_draw 47,16,'E'

    blocks_draw 35,20,'L'
    blocks_draw 39,20,'L'
    blocks_draw 43,20,'L'

    ret
;___________________Level 2___________________

.Level2:
    call .levelUp_Clean_Screen

    blocks_draw 31,6,'H'
    blocks_draw 35,6,'H'
    blocks_draw 39,6,'H'
    blocks_draw 43,6,'H'
    blocks_draw 47,6,'H'

    blocks_draw 23,10,'H'
    blocks_draw 27,10,'%'
    blocks_draw 31,10,'H'

    blocks_draw 47,10,'H'
    blocks_draw 51,10,'%'
    blocks_draw 55,10,'H'

    blocks_draw 15,14,'E'
    blocks_draw 19,14,'%'
    blocks_draw 23,14,'L'
    
    blocks_draw 55,14,'L'
    blocks_draw 59,14,'%'
    blocks_draw 63,14,'E'

    blocks_draw 35,18,'U'
    blocks_draw 39,18,'U'
    blocks_draw 43,18,'U'

    ret

;___________________Level 3___________________ 

.Level3:
    call .levelUp_Clean_Screen
  
    blocks_draw 11,4,'H'
    blocks_draw 15,4,'H'
 
    blocks_draw 63,4,'H'
    blocks_draw 67,4,'H'

    blocks_draw 39,6,'%'

    blocks_draw 11,8,'%'
    blocks_draw 15,8,'%'
 
    blocks_draw 63,8,'%'
    blocks_draw 67,8,'%'

    blocks_draw 35,10,'L'
    blocks_draw 39,10,'%'
    blocks_draw 43,10,'L'

    blocks_draw 11,12,'H'
    blocks_draw 15,12,'H'
 
    blocks_draw 63,12,'H'
    blocks_draw 67,12,'H'

    blocks_draw 39,14,'%'

    blocks_draw 11,16,'E'
    blocks_draw 15,16,'E'
 
    blocks_draw 63,16,'E'
    blocks_draw 67,16,'E'

    ret

;__________________Level 4____________________

.Level4:
    call .levelUp_Clean_Screen

    blocks_draw 7,18,'%'
    blocks_draw 11,18,'%'

    blocks_draw 7,2,'H'
    blocks_draw 11,4,'H'
    blocks_draw 15,6,'H'
    blocks_draw 19,8,'H'
    blocks_draw 23,10,'H'
    blocks_draw 27,12,'E'
    blocks_draw 31,14,'L'
 
    blocks_draw 35,5,'H'
    blocks_draw 39,5,'H'
    blocks_draw 43,5,'H'

    blocks_draw 39,9,'U'

    blocks_draw 47,14,'L'
    blocks_draw 51,12,'E'
    blocks_draw 55,10,'H'
    blocks_draw 59,8,'H'
    blocks_draw 63,6,'H'
    blocks_draw 67,4,'H'
    blocks_draw 71,2,'H'

    blocks_draw 67,18,'%'
    blocks_draw 71,18,'%'

    ret

;__________________Level 5____________________

.Level5:
    call .levelUp_Clean_Screen

    blocks_draw 39,4,'H'

    blocks_draw 7,10,'H'
    blocks_draw 15,8,'%'
    blocks_draw 23,6,'H'
    blocks_draw 31,8,'H'
    blocks_draw 39,10,'H'
    blocks_draw 47,8,'%'
    blocks_draw 55,6,'H'
    blocks_draw 63,8,'%'
    blocks_draw 71,10,'H'

    blocks_draw 15,12,'L'
    blocks_draw 23,14,'H'
    blocks_draw 31,12,'L'
    blocks_draw 47,12,'L'
    blocks_draw 55,14,'H'
    blocks_draw 63,12,'L'
    blocks_draw 39,16,'E'

    ret

.exit_level:
    ret

;___________________SCORE___________________

units_score:                            ;to count units
    mov     rax, [counter_units_score]
    inc     rax
    mov     [counter_units_score], rax          
    ret

dozens_score:                           ;to count dozens
    mov     rbx, [counter_tens_score]
    inc     rbx 
    mov     [counter_tens_score], rbx         
    ret

check_score:
    push rax
    push rbx
    mov rax, [counter_units_score]
    cmp rax, 58
    jne .score_out
    mov rax, 48
    mov [counter_units_score], rax
    call dozens_score
    mov rbx, [counter_tens_score]
    cmp rbx, 58
    jne .score_out
    mov rbx, 48
    mov [counter_tens_score], rbx 

.score_out:
    pop rax
    pop rbx
    ret
;_______________________________________________


;__________________CHECK LEVELS________________

check_level:

    push rax
    push rbx 
    push rcx

    mov rbx, [counter_tens_score]
    mov rcx, [counter_units_score]
    mov rax, [counter_level]


    cmp rbx, '0'   
    jne .skip_Level1
    
    cmp rcx, '8'
    jne .skip_Level1
    
    cmp r13, 13
    jne .skip_Level1
    
    call .funct_level_counter
    mov r13, 14
    jmp .Exit_check_level2

.skip_Level1:
    cmp rbx, '1'   
    jne .skip_Level2
    
    cmp rcx, '6'
    jne .skip_Level2

    cmp r13, 14
    jne .skip_Level2

    call .funct_level_counter
    mov r13, 15
    jmp .Exit_check_level2

.skip_Level2:
    cmp rbx, '2'
    jne .skip_Level3
    
    cmp rcx, '4'
    jne .skip_Level3

    cmp r13, 15
    jne .skip_Level3

    call .funct_level_counter
    mov r13, 16
    jmp .Exit_check_level2

.skip_Level3:
    cmp rbx, '3'
    jne .skip_Level4
    
    cmp rcx, '2'
    jne .skip_Level4

    cmp r13, 16
    jne .skip_Level4

    call .funct_level_counter
    mov r13, 17
    jmp .Exit_check_level2


.skip_Level4:
    cmp rbx, '4'
    jne .skip_Level5
    
    cmp rcx, '0'
    jne .skip_Level5

    print you_win_word0, you_win_word0_length
    jmp exit

.skip_Level5:
    jmp .Exit_check_level

.Exit_check_level:
    pop rax
    pop rbx
    pop rcx
    jmp main_looop  

.Exit_check_level2:
    pop rax
    pop rbx
    pop rcx
    jmp Refresh_level

.funct_level_counter:
    push rdx
    mov  rdx, [counter_level]
    inc  rdx 
    mov  [counter_level], rdx         
    pop  rdx
    ret
;____________________________________________


;___________________LIVES____________________

;left side
rigth_counter_life:
    call up_lives
    push rdx
    mov rdx, [variable_shot]
    cmp rdx, 1
    jne .left_track
    mov rdx, [variable_animation_shot]
    mov byte[rdx-1],' '
    mov byte[rdx+1],' '

.left_track:
    ;;(trayectoria)
    pop rdx
    mov byte [r9-81], ' '
    push rax
    mov rax, [variable_power]
    cmp rax, 4
    jne .power_up_barra
    mov byte [r8-3], ' '
    mov byte [r8-2], ' '
    mov byte [r8-1], ' '
    mov byte [r8], ' '
    mov byte [r8+1], ' '
    mov byte [r8+2], ' '
    mov byte [r8+3], ' '

.power_up_barra:
    mov byte [r8-3], ' '
    mov byte [r8-2], ' '
    mov byte [r8-1], ' '
    mov byte [r8], ' '
    mov byte [r8+1], ' '
    mov byte [r8+2], ' '
    mov byte [r8+3], ' '
    pop rax
    mov r8, board + 40 + 31 * (column_cells+2) 
    mov byte [r8-2], '#'
    mov byte [r8-1], '#'
    mov byte [r8], '#'
    mov byte [r8+1], '#'
    mov byte [r8+2], '#'
    mov r9, board + 40 + 30 * (column_cells+2)
    save_value variable_power, 0
    mov r10, 81 ;
    mov r15, 20
    push rbx
    mov rbx, [counter_lives] 
    cmp rbx, 48
    jne .exit_barra
    print game_over_word0, game_over_word0_length
    jmp exit

.exit_barra:   
    pop rbx
    ret

left_counter_life:
    call up_lives
    push rcx
    mov rcx, [variable_shot]
    cmp rcx, 1
    jne .right_track
    mov rcx, [variable_animation_shot]
    mov byte[rcx-1],' '
    mov byte[rcx+1],' '

.right_track:
    pop rcx
    mov byte [r9-83], ' '
    push rax
    mov rax, [variable_power]
    cmp rax, 4
    jne .power_up_barra
    mov byte [r8-3], ' '
    mov byte [r8-2], ' '
    mov byte [r8-1], ' '
    mov byte [r8], ' '
    mov byte [r8+1], ' '
    mov byte [r8+2], ' '
    mov byte [r8+3], ' '

    ;;preguntar porque hay dos power_up_barra y dos exit_barra
.power_up_barra:
    mov byte [r8-3], ' '
    mov byte [r8-2], ' '
    mov byte [r8-1], ' '
    mov byte [r8], ' '
    mov byte [r8+1], ' '
    mov byte [r8+2], ' '
    mov byte [r8+3], ' '
    pop rax
    mov r8, board + 40 + 31 * (column_cells+2) 
    mov byte [r8-2], '#'
    mov byte [r8-1], '#'
    mov byte [r8], '#'
    mov byte [r8+1], '#'
    mov byte [r8+2], '#'
    mov r9, board + 40 + 30 * (column_cells+2)
    save_value variable_power, 0
    mov r10, 83 ;
    mov r15, 20
    push rbx
    mov rbx, [counter_lives] 
    cmp rbx, 48
    jne .exit_barra
    print game_over_word0, game_over_word0_length
    jmp exit

.exit_barra:   
    pop rbx
    ret

;____________________________________COLLISIONS___________________________________

ball_collision: 
    cmp r10, 3
    je left_down_diagonal
    cmp r10, 1
    je right_diagonal_down
    sub r9, r10
    cmp byte[r9], 'H'
    jne collision_H
    mov byte [r9+r10], ' ' 
    xor r10, 80
    ret 
;___________________Up Collisions____________________  

collision_H:
    cmp r10, 81
    jne vertical_edge_collision
    cmp byte[r9-81], '|'
    jne collision__
    mov byte [r9+r10], ' ' 
    xor r10, 2
    ret

vertical_edge_collision:
    cmp byte[r9-83], '|'
    jne collision__
    mov byte [r9+r10], ' ' 
    xor r10, 2
    ret   

collision__:
    cmp byte[r9-82], '_'
    jne powerUpcollision_Louble
    mov byte [r9+r10], ' ' 
    xor r10, 80
    jmp vertical_edge_collision2
    ret

vertical_edge_collision2:
    cmp byte[r9-1], '|'
    jne vertical_edge_collision3 
    xor r10, 2
    ret

vertical_edge_collision3:
    cmp byte[r9+1], '|'
    jne exit_crashes 
    xor r10, 2
    ret

exit_crashes:
    ret
    ;;revisar que hace esto y si se puede borrar o acomodar

powerUpcollision_Louble:
    cmp byte[r9], '%' 
    jne collision_E
    mov byte [r9+r10], ' '  
    xor r10, 80
    ret

collision_E:
    cmp byte[r9], 'E'   
    jne collision_L
    call PowerUP_paddle
    mov byte [r9+r10], ' '  
    xor r10, 80
    ret

collision_L:
    cmp byte[r9], 'L' 
    jne live_PowerUp_Collision
    call detect_L
    mov byte [r9+r10], ' '  
    xor r10, 80
    ret 

;;Revisar colisiones con D y T 

live_PowerUp_Collision:
    cmp byte[r9], 'U' 
    jne block_change
    save_value variable_life, 1
    save_value variable_animation_life, r9
    mov byte [r9+r10], ' '  
    xor r10, 80
    ret

block_change:
    call PowerUP_block_change
    ret 

;___________________Left Collitions (down)____________________

left_down_diagonal: 
    add r9, 81 
    cmp byte[r9+81],'#'
    jne collision_player_left
    call paddle_powerup_collision
    ret   

collision_player_left:
    cmp byte[r9+81], '|'
    jne vertical_edge_collision_left
    mov byte [r9-81], ' '
    mov r10, 1
    ret

vertical_edge_collision_left:
    cmp byte[r9], 'H'
    jne left_H_collision
    mov byte [r9-81], ' '
    add r10, 80
    ret

left_H_collision:
    cmp byte[r9], '%'   
    jne PowerUp_collision_Louble_left
    mov byte [r9-81], ' '
    add r10, 80
    ret

PowerUp_collision_Louble_left:
    cmp byte[r9], 'E'   
    jne collision_E_left
    call PowerUP_paddle
    mov byte [r9-81], ' '
    add r10, 80
    ret

collision_E_left:
    cmp byte[r9], 'L' 
    jne collision_L_left
    call detect_L   
    mov byte [r9-81], ' '
    add r10, 80
    ret

collision_L_left:
    cmp byte[r9], 'U' 
    jne collisionPowerUP_left_live
    save_value variable_life, 1
    save_value variable_animation_life, r9
    mov byte [r9-81], ' '
    add r10, 80
    ret

collisionPowerUP_left_live:
    cmp byte[r9], '_' 
    jne left_collision
    call rigth_counter_life
    ret

left_collision:
    call PowerUP_block_change 
    ret 

;___________________Rigth collisions (Down)____________________

right_diagonal_down: 
    add r9, 83 
    cmp byte[r9+83],'#'
    jne player_collision_right
    call paddle_powerup_collision
    ret

player_collision_right:
    cmp byte[r9+83], '|'
    jne vertical_edge_collision_right
    mov byte [r9-83], ' '
    mov r10, 3
    ret

vertical_edge_collision_right:
    cmp byte[r9], 'H'
    jne collision_H_right
    mov byte [r9-83], ' '
    add r10, 80
    ret

collision_H_right:
    cmp byte[r9], '%'
    jne PowerUPCollision_right_double
    mov byte [r9-83], ' '
    add r10, 80
    ret

PowerUPCollision_right_double:
    cmp byte[r9], 'E' 
    jne collision_E_right
    call PowerUP_paddle
    mov byte [r9-83], ' '
    add r10, 80
    ret

collision_E_right:
    cmp byte[r9], 'L'
    jne collision_L_right
    call detect_L 
    mov byte [r9-83], ' '
    add r10, 80
    ret

collision_L_right:
    cmp byte[r9], 'U' 
    jne collisionPowerUP
    save_value variable_life, 1
    save_value variable_animation_life, r9
    mov byte [r9-83], ' '
    add r10, 80
    ret

collisionPowerUP:
    cmp byte[r9], '_' 
    jne left_collision
    call left_counter_life
    ret

rigth_collision:
    call PowerUP_block_change
    ret 
;________________________________________________________________________________


;_________________________________Blocks_________________________________________   ; Para borrar bloques cuando son colisionados

Block_H:
    cmp byte[r9], 'H'
    jne block_E
    cmp byte[r9-1], 'H'
    jne clean_left_block
    cmp byte[r9+1], 'H'
    jne clean_right_block
    mov byte [r9-1], ' '
    mov byte [r9], ' '
    mov byte [r9+1], ' '
    call units_score
    call check_score
    ret

block_E:
    cmp byte[r9], 'E'
    jne block_L
    cmp byte[r9-1], 'E'
    jne clean_left_block
    cmp byte[r9+1], 'E'
    jne clean_right_block
    mov byte [r9-1], ' '
    mov byte [r9], ' '
    mov byte [r9+1], ' '
    call units_score
    call check_score
    ret

block_L:
    cmp byte[r9], 'L' 
    jne block_live
    cmp byte[r9-1], 'L'
    jne clean_left_block
    cmp byte[r9+1], 'L'
    jne clean_right_block
    mov byte [r9-1], ' '
    mov byte [r9], ' '
    mov byte [r9+1], ' '
    call units_score
    call check_score
    ret

block_live:
    cmp byte[r9], 'U' 
    jne exit_block_live
    cmp byte[r9-1], 'U'
    jne clean_left_block
    cmp byte[r9+1], 'U'
    jne clean_right_block
    mov byte [r9-1], ' '
    mov byte [r9], ' '
    mov byte [r9+1], ' '
    call units_score
    call check_score
    ret

exit_block_live:
    ret

;___________________Double Block____________________ ; Esto es para % solamente 

double_PowerUp:    
    cmp byte[r9], '%'
    jne Block_H
    cmp byte[r9-1], '%'
    jne doubleBlock_enable_left
    cmp byte[r9+1], '%'
    jne doubleBlock_enable_right
    mov byte [r9-1], 'H'
    mov byte [r9], 'H'
    mov byte [r9+1], 'H'
    call units_score
    call check_score
    ret

doubleBlock_enable_left:
    mov byte [r9], 'H'
    mov byte [r9+1], 'H'
    mov byte [r9+2], 'H'
    call units_score
    call check_score
    ret

doubleBlock_enable_right:
    mov byte [r9], 'H'
    mov byte [r9-1], 'H'
    mov byte [r9-2], 'H'
    call units_score
    call check_score
    ret

;________clean the near blocks______________________  ; los bloques son de tres caracteres, cuando golpean uno borra los demás

clean_left_block:
    mov byte [r9], ' '
    mov byte [r9+1], ' '
    mov byte [r9+2], ' '
    call units_score
    call check_score
    ret

clean_right_block:
    mov byte [r9], ' '
    mov byte [r9-1], ' '
    mov byte [r9-2], ' '
    call units_score
    call check_score
    ret



;__________________________PowerUps____________________________________


;___________Paddle Collision with Power Up T __________________

paddle_powerup_collision:
    push rax
    mov rax, [variable_power]
    cmp rax, 4
    je paddle_powerUp_enable
    cmp rax, 6
    je paddle_powerUp_enable
    cmp rax, 7
    je paddle_powerUp_enable
    cmp r10, 1
    jne left_direct
    cmp byte[r9+81],' '
    je same_direct
    cmp byte[r9+80],' '
    je same_direct
    jmp opposite_direct

left_direct:
    cmp byte[r9+83],' '
    je same_direct
    cmp byte[r9+84],' '
    je same_direct
    jmp opposite_direct

same_direct:
    mov byte [r9-81], ' '
    mov byte [r9-83], ' '
    add r10, 80
    xor r10, 2
    pop rax
    ret

opposite_direct:
    mov byte [r9-83], ' '
    mov byte [r9-81], ' '
    add r10, 80
    pop rax 
    ret

paddle_powerUp_enable:
    cmp r10, 1
    jne left_direct_PowerUP
    cmp byte[r9+81],' '
    je same_direct
    cmp byte[r9+80],' '
    je same_direct
    cmp byte[r9+79],' '
    je same_direct
    jmp opposite_direct

    left_direct_PowerUP:
    cmp byte[r9+83],' '
    je same_direct
    cmp byte[r9+84],' '
    je same_direct
    cmp byte[r9+85],' '
    je same_direct
    jmp opposite_direct

PowerUP_block_change:
    cmp r10, 3
    je change_left_down_diagonal
    cmp r10, 1
    je change_right_diagonal_down
    cmp r10, 81
    je change_direct_rigthUp   
    cmp byte [r9+84], 'H'
    jne check1_H
    cmp byte [r9+86], 'H'
    je clean1_H
    mov byte [r9+r10], 'H'
    ret

check1_H: 
    cmp byte[r9+82], 'H'
    jne clean1_H
    cmp byte[r9+80], 'H'
    je clean1_H
    mov byte [r9+r10], 'H'
    ret

clean1_H:
    mov byte [r9+r10], ' ' 
    ret

change_direct_rigthUp:
    cmp byte[r9+80], 'H'
    jne check2_H 
    cmp byte[r9+78], 'H'
    je clean1_H
    mov byte [r9+r10], 'H'
    ret

check2_H:
    cmp byte[r9+82], 'H'
    jne clean1_H
    cmp byte[r9+84], 'H'
    je clean1_H
    mov byte [r9+r10], 'H'
    ret

change_left_down_diagonal:
    cmp byte [r9-80], 'H'
    jne check3_H
    cmp byte [r9-78], 'H'
    je clean2_H
    mov byte [r9-81], 'H'
    ret

check3_H: 
    cmp byte [r9-82], 'H'
    jne clean2_H
    cmp byte [r9-84], 'H'
    je clean2_H
    mov byte [r9-81], 'H'
    ret

clean2_H:
    mov byte [r9-81], ' ' 
    ret 

change_right_diagonal_down:
    cmp byte [r9-82], 'H'
    jne check4_H
    cmp byte [r9-80], 'H'
    je clean3_H
    mov byte [r9-83], 'H'
    ret

check4_H: 
    cmp byte [r9-84], 'H'
    jne clean3_H
    cmp byte [r9-86], 'H'
    je clean3_H
    mov byte [r9-83], 'H'
    ret

clean3_H:
    mov byte [r9-83], ' '
    ret 

;___________________Power Up selection___________________
PowerUP_on: 
    push rax
    mov rax, [variable_power]
    cmp rax, 1
    je powerUp_Paddle_Mov
    cmp rax, 2
    je movimiento_PowerUP_disparo
    pop rax
    ret

powerUp_Paddle_Mov: 
    mov rax, [variable_animation_power]
    add rax, 82
    mov byte[rax], 'E'
    mov byte[rax-82], ' '
    mov [variable_animation_power], rax
    cmp byte[rax+82], '#'
    je powerUp_Paddle_on
    cmp byte[rax+82], '_'
    je desenable_PowerUp     
    pop rax
    ret

powerUp_Paddle_on: 
    mov byte[rax], ' '
    mov rax, 4 ;poder 
    mov [variable_power], rax
    pop rax
    ret

desenable_PowerUp: 
    mov byte[rax], ' '
    mov rax, 0 
    mov [variable_power], rax
    pop rax
    ret

movimiento_PowerUP_disparo: 
    mov rax, [variable_animation_power]
    add rax, 82
    mov byte[rax], 'L'
    mov byte[rax-82], ' '
    mov [variable_animation_power], rax
    cmp byte[rax+82], '#'
    je shot_powerUp_on
    cmp byte[rax+82], '_'
    je desenable_PowerUp
    pop rax
    ret

shot_powerUp_on: 
    mov byte[rax], ' '
    mov rax, 5 
    mov [variable_power], rax
    pop rax
    ret

PowerUP_paddle:
    push rax
    mov rax, [variable_power]
    cmp rax,4 
    je PowerUP_paddle_1
    cmp rax,5 
    je PowerUP_paddle_2
    save_value variable_power, 1
    save_value variable_animation_power, r9
    pop rax
    ret

PowerUP_paddle_1:
    save_value variable_power, 6
    save_value variable_animation_power, r9
    pop rax
    ret

PowerUP_paddle_2:
    save_value variable_power, 7
    save_value variable_animation_power, r9
    pop rax
    ret

;___________________shot powerUp_________________
detect_L: 
    push rax
    mov rax, [variable_power]
    cmp rax,4 
    je detect_L_1
    cmp rax,5 
    je detect_L_2
    save_value variable_power, 2
    save_value variable_animation_power, r9
    pop rax
    ret

detect_L_1:
    save_value variable_power, 8
    save_value variable_animation_power, r9
    pop rax
    ret

detect_L_2:
    save_value variable_power, 9
    save_value variable_animation_power, r9
    pop rax
    ret

shot_on:
    push r14
    mov r14, [variable_shot]
    cmp r14, 1
    je shot_off
    pop r14
    ret

shot_off: 
    mov r14, [variable_animation_shot]
    sub r14, 82
    mov [variable_animation_shot], r14
    cmp byte[r14-1], 'H'
    je shot_off_H
    cmp byte[r14+1], 'H'
    je shot_off_H
    cmp byte[r14-1], '%'
    je shot_off_left_doub
    cmp byte[r14+1], '%'
    je shot_off_Loble_rigth
    cmp byte[r14-1], 'E'
    je shot_off_T
    cmp byte[r14+1], 'E'
    je shot_off_T
    cmp byte[r14-1], 'L'
    je shot_off_L
    cmp byte[r14+1], 'L'
    je shot_off_L
    cmp byte[r14-1], 'U'
    je shot_off_live
    cmp byte[r14+1], 'U'
    je shot_off_live  
    cmp byte[r14], '_'
    je shot_off__
    mov byte [r14-1], '$'
    mov byte [r14], '$'
    mov byte [r14+1], '$'
    mov byte [r14+81], ' '
    mov byte [r14+82], ' '
    mov byte [r14+83], ' '
    pop r14
    ret 

shot_off_H:
    cmp byte[r14-2], 'H'
    jne clean_coll_shot
    cmp byte[r14], 'H'
    jne clean_coll_shot
    cmp byte [r14+2], 'H'
    jne clean_coll_shot
    mov byte [r14+1],'H'
    jne clean_coll_shot
    mov byte [r14+2], ' '
    mov byte [r14+1], ' '
    mov byte [r14-2], ' '
    mov byte [r14-1], ' '
    mov byte [r14], ' '
    mov byte [r14+81], ' '
    mov byte [r14+82], ' '
    mov byte [r14+83], ' '
    pop r14
    save_value variable_shot, 0
    call units_score
    call check_score
    ret

shot_off_left_doub: ; clean when there's a collision between the shot and the block
    cmp byte[r14-2], '%'
    jne clean_coll_shotdoub_1
    cmp byte[r14], '%'
    jne clean_coll_shotdoub_2
    mov byte [r14+1], 'H'
    mov byte [r14+2], 'H'
    mov byte [r14-2], 'H'
    mov byte [r14-1], 'H'
    mov byte [r14], 'H'
    mov byte [r14+81], ' '
    mov byte [r14+82], ' '
    mov byte [r14+83], ' '
    pop r14
    save_value variable_shot, 0
    call units_score
    call check_score
    ret
    
shot_off_Loble_rigth: 
    cmp byte[r14], '%'
    jne clean_coll_shotdoub_6
    cmp byte[r14+2], '%'
    jne clean_coll_shotdoub_1
    mov byte [r14], 'H'
    mov byte [r14+1], 'H'
    mov byte [r14+2], 'H'
    mov byte [r14+81], ' '
    mov byte [r14+82], ' '
    mov byte [r14+83], ' '
    pop r14
    save_value variable_shot, 0
    call units_score
    call check_score
    ret

clean_coll_shotdoub_1:
    mov byte [r14-1], 'H'
    mov byte [r14], 'H'
    mov byte [r14+1], 'H'
    mov byte [r14+81], ' '
    mov byte [r14+82], ' '
    mov byte [r14+83], ' '
    pop r14
    save_value variable_shot, 0
    call units_score
    call check_score
    ret

clean_coll_shotdoub_2:
    mov byte [r14-1], 'H'
    mov byte [r14-2], 'H'
    mov byte [r14-3], 'H'
    mov byte [r14+81], ' '
    mov byte [r14+82], ' '
    mov byte [r14+83], ' '
    pop r14
    save_value variable_shot, 0
    call units_score
    call check_score
    ret

clean_coll_shotdoub_6:
    mov byte [r14+1], 'H'
    mov byte [r14+2], 'H'
    mov byte [r14+3], 'H'
    mov byte [r14+81], ' '
    mov byte [r14+82], ' '
    mov byte [r14+83], ' '
    pop r14
    save_value variable_shot, 0
    call units_score
    call check_score
    ret

shot_off_T:
    cmp byte [r14-2], 'E'
    jne clean_coll_shot
    cmp byte [r14], 'E'
    jne clean_coll_shot
    cmp byte [r14+2], 'E'
    jne clean_coll_shot
    mov byte [r14-2], ' '
    mov byte [r14-1], ' '
    mov byte [r14], ' '
    mov byte [r14+1], ' '
    mov byte [r14+2], ' '
    mov byte [r14+81], ' '
    mov byte [r14+82], ' '
    mov byte [r14+83], ' '
    pop r14
    save_value variable_shot, 0
    call units_score
    call check_score
    ret

shot_off_L:
    cmp byte[r14-2], 'L'
    jne clean_coll_shot
    cmp byte[r14], 'L'
    jne clean_coll_shot
    cmp byte[r14+2], 'L'
    jne clean_coll_shot
    mov byte [r14-2], ' '
    mov byte [r14-1], ' '
    mov byte [r14], ' '
    mov byte [r14+1], ' '
    cmp byte [r14+2], 'L'
    mov byte [r14+81], ' '
    mov byte [r14+82], ' '
    mov byte [r14+83], ' '
    pop r14
    save_value variable_shot, 0
    call units_score
    call check_score
    ret

shot_off_live:
    cmp byte[r14-2], 'U'
    jne clean_coll_shot
    cmp byte[r14], 'U'
    jne clean_coll_shot
    cmp byte[r14+2], 'U'
    jne clean_coll_shot
    mov byte [r14-2], ' '
    mov byte [r14-1], ' '
    mov byte [r14], ' '
    mov byte [r14+81], ' '
    mov byte [r14+82], ' '
    mov byte [r14+83], ' '
    pop r14
    save_value variable_shot, 0
    call units_score
    call check_score
    ret

shot_off__:
    mov byte [r14+81], ' '
    mov byte [r14+82], ' '
    mov byte [r14+83], ' '
    pop r14
    save_value variable_shot, 0
    ret

clean_coll_shot:
    mov byte [r14-1], ' '
    mov byte [r14-2], ' '
    mov byte [r14-3], ' '
    mov byte [r14], ' '
    mov byte [r14+1], ' '
    mov byte [r14+2], ' '
    mov byte [r14+3], ' '
    mov byte [r14+81], ' '
    mov byte [r14+82], ' '
    mov byte [r14+83], ' '
    pop r14
    save_value variable_shot, 0
    call units_score
    call check_score
    ret 
;___________________Live Power Up_________________


mov_PowerUP_live:
    push rax
    mov rax, [variable_life]
    cmp rax, 1
    je live_mov
    pop rax 
    ret

live_mov:
    mov rax, [variable_animation_life]
    add rax, 82
    mov byte[rax], 'U'
    mov byte[rax-82], ' '
    
    mov [variable_animation_life], rax
    cmp byte[rax+82], '#'
    je PowerUP_live_on
    cmp byte[rax+82], '_'
    je PowerUP_live_off
    pop rax
    ret

PowerUP_live_on: 
    mov byte[rax], ' '
    mov rax, 0
    mov [variable_life], rax
    mov rax, [counter_lives]
    add rax, 1
    mov [counter_lives], rax
    pop rax
    ret

PowerUP_live_off: 
    mov byte[rax], ' '
    mov rax, 0 ;perdio el poder
    mov [variable_life], rax
    pop rax
    ret
;____________________________________________________
