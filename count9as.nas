[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[FILE "count9as.nas"]
[INSTRSET "i486p"]
[BITS 32]

[SECTION .data]
    ALIGNB  4
table:
    dd      case00,case01,case02,case03,case04,case05,case06,case07,case08
    dd      case09,case10,case11,case12,case13,case14,case15,case16,case17
    dd      case18,case19,case20,case21,case22,case23,case24,case25,case26
    dd      case27,case28,case29,case30,case31,case32,case33,case34,case35
    dd      case36,case37,case38,case39,case40,case41,case42,case43,case44
    dd      case45,case46,case47,case48,case49,case50,case51,case52,case53
    dd      case54,case55,case56,case57,case58,case59,case60,case61,case62
    dd      case63,case64,case65,case66,case67,case68,case69,case70,case71
    dd      case72,case73,case74,case75,case76,case77,case78,case79,case80

[SECTION .text]
    ALIGN   32
    EXTERN  _storeResultAndTestLimit
    GLOBAL  _count9Asm

_count9Asm:
    PUSH    EDI
    PUSH    ESI
    PUSH    EBP
    PUSH    EBX
    MOV     EAX,[ESP+20]
    MOV     ESI,[ESP+24]
    MOV     EDX,[ESP+28]
    PUSH    EDX
    PUSH    EAX
    MOV     EBP,ESP
    XOR     EBX,EBX
    MOV     EDI,[EDX]
    CALL    subsub
    POP     EAX
    POP     EDX
    MOV     [EDX],EDI
    POP     EBX
    POP     EBP
    POP     ESI
    POP     EDI
    RET

    ALIGN   32
caseend:
    OR      EAX,EDX
    OR      EAX,ECX
    XOR     EDX,EDX
    XOR     EAX,0x1FF
    JZ      fin
    INC     EBX
loop0:
    SUB     EDX,EAX
    PUSH    EAX
    AND     EAX,EDX
    MOV     [ESI+EBX*4-4],EAX
    CALL    subsub
    POP     EAX
    XOR     EDX,EDX
    XOR     EAX,[ESI+EBX*4-4]
    JNZ     loop0
    MOV     [ESI+EBX*4-4],EDX
    DEC     EBX
fin:
    RET

    ALIGN   8
subsub:
    CMP     EBX,81
    JGE     skip0
    CMP     DWORD [ESI+EBX*4],0
    JNE     skip1
    JMP     DWORD [table+EBX*4]
skip1:
    INC     EBX
    CALL    subsub
    DEC     EBX
    JMP     fin
skip0:
    TEST    EDI,EDI
    JGE     callback
    INC     EDI
    JMP     fin
callback:
    MOV     EDX,[EBP+4]
    PUSH    DWORD [EBP+0]
    MOV     [EDX],EDI
    CALL    _storeResultAndTestLimit
    INC     EDI
    POP     EAX
    JMP     fin

    ALIGN   8
case00:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+  4]
    MOV     EDX,[ESI+  8]
    OR      EAX,[ESI+ 12]
    OR      ECX,[ESI+ 16]
    OR      EDX,[ESI+ 20]
    OR      EAX,[ESI+ 24]
    OR      ECX,[ESI+ 28]
    OR      EDX,[ESI+ 32]
    OR      EAX,[ESI+ 36]
    OR      ECX,[ESI+ 40]
    OR      EDX,[ESI+ 44]
    OR      EAX,[ESI+ 72]
    OR      ECX,[ESI+ 76]
    OR      EDX,[ESI+ 80]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+144]
    OR      EDX,[ESI+180]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+252]
    JMP     caseend

    ALIGN   8
case01:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+  4]
    MOV     EDX,[ESI+  8]
    OR      EAX,[ESI+ 12]
    OR      ECX,[ESI+ 16]
    OR      EDX,[ESI+ 20]
    OR      EAX,[ESI+ 24]
    OR      ECX,[ESI+ 28]
    OR      EDX,[ESI+ 32]
    OR      EAX,[ESI+ 36]
    OR      ECX,[ESI+ 40]
    OR      EDX,[ESI+ 44]
    OR      EAX,[ESI+ 72]
    OR      ECX,[ESI+ 76]
    OR      EDX,[ESI+ 80]
    OR      EAX,[ESI+112]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+184]
    OR      EAX,[ESI+220]
    OR      ECX,[ESI+256]
    JMP     caseend

    ALIGN   8
case02:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+  4]
    MOV     EDX,[ESI+  8]
    OR      EAX,[ESI+ 12]
    OR      ECX,[ESI+ 16]
    OR      EDX,[ESI+ 20]
    OR      EAX,[ESI+ 24]
    OR      ECX,[ESI+ 28]
    OR      EDX,[ESI+ 32]
    OR      EAX,[ESI+ 36]
    OR      ECX,[ESI+ 40]
    OR      EDX,[ESI+ 44]
    OR      EAX,[ESI+ 72]
    OR      ECX,[ESI+ 76]
    OR      EDX,[ESI+ 80]
    OR      EAX,[ESI+116]
    OR      ECX,[ESI+152]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+224]
    OR      ECX,[ESI+260]
    JMP     caseend

    ALIGN   8
case03:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+  4]
    MOV     EDX,[ESI+  8]
    OR      EAX,[ESI+ 12]
    OR      ECX,[ESI+ 16]
    OR      EDX,[ESI+ 20]
    OR      EAX,[ESI+ 24]
    OR      ECX,[ESI+ 28]
    OR      EDX,[ESI+ 32]
    OR      EAX,[ESI+ 48]
    OR      ECX,[ESI+ 52]
    OR      EDX,[ESI+ 56]
    OR      EAX,[ESI+ 84]
    OR      ECX,[ESI+ 88]
    OR      EDX,[ESI+ 92]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+156]
    OR      EDX,[ESI+192]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+264]
    JMP     caseend

    ALIGN   8
case04:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+  4]
    MOV     EDX,[ESI+  8]
    OR      EAX,[ESI+ 12]
    OR      ECX,[ESI+ 16]
    OR      EDX,[ESI+ 20]
    OR      EAX,[ESI+ 24]
    OR      ECX,[ESI+ 28]
    OR      EDX,[ESI+ 32]
    OR      EAX,[ESI+ 48]
    OR      ECX,[ESI+ 52]
    OR      EDX,[ESI+ 56]
    OR      EAX,[ESI+ 84]
    OR      ECX,[ESI+ 88]
    OR      EDX,[ESI+ 92]
    OR      EAX,[ESI+124]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+196]
    OR      EAX,[ESI+232]
    OR      ECX,[ESI+268]
    JMP     caseend

    ALIGN   8
case05:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+  4]
    MOV     EDX,[ESI+  8]
    OR      EAX,[ESI+ 12]
    OR      ECX,[ESI+ 16]
    OR      EDX,[ESI+ 20]
    OR      EAX,[ESI+ 24]
    OR      ECX,[ESI+ 28]
    OR      EDX,[ESI+ 32]
    OR      EAX,[ESI+ 48]
    OR      ECX,[ESI+ 52]
    OR      EDX,[ESI+ 56]
    OR      EAX,[ESI+ 84]
    OR      ECX,[ESI+ 88]
    OR      EDX,[ESI+ 92]
    OR      EAX,[ESI+128]
    OR      ECX,[ESI+164]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+236]
    OR      ECX,[ESI+272]
    JMP     caseend

    ALIGN   8
case06:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+  4]
    MOV     EDX,[ESI+  8]
    OR      EAX,[ESI+ 12]
    OR      ECX,[ESI+ 16]
    OR      EDX,[ESI+ 20]
    OR      EAX,[ESI+ 24]
    OR      ECX,[ESI+ 28]
    OR      EDX,[ESI+ 32]
    OR      EAX,[ESI+ 60]
    OR      ECX,[ESI+ 64]
    OR      EDX,[ESI+ 68]
    OR      EAX,[ESI+ 96]
    OR      ECX,[ESI+100]
    OR      EDX,[ESI+104]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+168]
    OR      EDX,[ESI+204]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+276]
    JMP     caseend

    ALIGN   8
case07:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+  4]
    MOV     EDX,[ESI+  8]
    OR      EAX,[ESI+ 12]
    OR      ECX,[ESI+ 16]
    OR      EDX,[ESI+ 20]
    OR      EAX,[ESI+ 24]
    OR      ECX,[ESI+ 28]
    OR      EDX,[ESI+ 32]
    OR      EAX,[ESI+ 60]
    OR      ECX,[ESI+ 64]
    OR      EDX,[ESI+ 68]
    OR      EAX,[ESI+ 96]
    OR      ECX,[ESI+100]
    OR      EDX,[ESI+104]
    OR      EAX,[ESI+136]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+208]
    OR      EAX,[ESI+244]
    OR      ECX,[ESI+280]
    JMP     caseend

    ALIGN   8
case08:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+  4]
    MOV     EDX,[ESI+  8]
    OR      EAX,[ESI+ 12]
    OR      ECX,[ESI+ 16]
    OR      EDX,[ESI+ 20]
    OR      EAX,[ESI+ 24]
    OR      ECX,[ESI+ 28]
    OR      EDX,[ESI+ 32]
    OR      EAX,[ESI+ 60]
    OR      ECX,[ESI+ 64]
    OR      EDX,[ESI+ 68]
    OR      EAX,[ESI+ 96]
    OR      ECX,[ESI+100]
    OR      EDX,[ESI+104]
    OR      EAX,[ESI+140]
    OR      ECX,[ESI+176]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+248]
    OR      ECX,[ESI+284]
    JMP     caseend

    ALIGN   8
case09:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+  4]
    MOV     EDX,[ESI+  8]
    OR      EAX,[ESI+ 36]
    OR      ECX,[ESI+ 40]
    OR      EDX,[ESI+ 44]
    OR      EAX,[ESI+ 48]
    OR      ECX,[ESI+ 52]
    OR      EDX,[ESI+ 56]
    OR      EAX,[ESI+ 60]
    OR      ECX,[ESI+ 64]
    OR      EDX,[ESI+ 68]
    OR      EAX,[ESI+ 72]
    OR      ECX,[ESI+ 76]
    OR      EDX,[ESI+ 80]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+144]
    OR      EDX,[ESI+180]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+252]
    JMP     caseend

    ALIGN   8
case10:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+  4]
    MOV     EDX,[ESI+  8]
    OR      EAX,[ESI+ 36]
    OR      ECX,[ESI+ 40]
    OR      EDX,[ESI+ 44]
    OR      EAX,[ESI+ 48]
    OR      ECX,[ESI+ 52]
    OR      EDX,[ESI+ 56]
    OR      EAX,[ESI+ 60]
    OR      ECX,[ESI+ 64]
    OR      EDX,[ESI+ 68]
    OR      EAX,[ESI+ 72]
    OR      ECX,[ESI+ 76]
    OR      EDX,[ESI+ 80]
    OR      EAX,[ESI+112]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+184]
    OR      EAX,[ESI+220]
    OR      ECX,[ESI+256]
    JMP     caseend

    ALIGN   8
case11:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+  4]
    MOV     EDX,[ESI+  8]
    OR      EAX,[ESI+ 36]
    OR      ECX,[ESI+ 40]
    OR      EDX,[ESI+ 44]
    OR      EAX,[ESI+ 48]
    OR      ECX,[ESI+ 52]
    OR      EDX,[ESI+ 56]
    OR      EAX,[ESI+ 60]
    OR      ECX,[ESI+ 64]
    OR      EDX,[ESI+ 68]
    OR      EAX,[ESI+ 72]
    OR      ECX,[ESI+ 76]
    OR      EDX,[ESI+ 80]
    OR      EAX,[ESI+116]
    OR      ECX,[ESI+152]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+224]
    OR      ECX,[ESI+260]
    JMP     caseend

    ALIGN   8
case12:
    MOV     EAX,[ESI+ 12]
    MOV     ECX,[ESI+ 16]
    MOV     EDX,[ESI+ 20]
    OR      EAX,[ESI+ 36]
    OR      ECX,[ESI+ 40]
    OR      EDX,[ESI+ 44]
    OR      EAX,[ESI+ 48]
    OR      ECX,[ESI+ 52]
    OR      EDX,[ESI+ 56]
    OR      EAX,[ESI+ 60]
    OR      ECX,[ESI+ 64]
    OR      EDX,[ESI+ 68]
    OR      EAX,[ESI+ 84]
    OR      ECX,[ESI+ 88]
    OR      EDX,[ESI+ 92]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+156]
    OR      EDX,[ESI+192]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+264]
    JMP     caseend

    ALIGN   8
case13:
    MOV     EAX,[ESI+ 12]
    MOV     ECX,[ESI+ 16]
    MOV     EDX,[ESI+ 20]
    OR      EAX,[ESI+ 36]
    OR      ECX,[ESI+ 40]
    OR      EDX,[ESI+ 44]
    OR      EAX,[ESI+ 48]
    OR      ECX,[ESI+ 52]
    OR      EDX,[ESI+ 56]
    OR      EAX,[ESI+ 60]
    OR      ECX,[ESI+ 64]
    OR      EDX,[ESI+ 68]
    OR      EAX,[ESI+ 84]
    OR      ECX,[ESI+ 88]
    OR      EDX,[ESI+ 92]
    OR      EAX,[ESI+124]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+196]
    OR      EAX,[ESI+232]
    OR      ECX,[ESI+268]
    JMP     caseend

    ALIGN   8
case14:
    MOV     EAX,[ESI+ 12]
    MOV     ECX,[ESI+ 16]
    MOV     EDX,[ESI+ 20]
    OR      EAX,[ESI+ 36]
    OR      ECX,[ESI+ 40]
    OR      EDX,[ESI+ 44]
    OR      EAX,[ESI+ 48]
    OR      ECX,[ESI+ 52]
    OR      EDX,[ESI+ 56]
    OR      EAX,[ESI+ 60]
    OR      ECX,[ESI+ 64]
    OR      EDX,[ESI+ 68]
    OR      EAX,[ESI+ 84]
    OR      ECX,[ESI+ 88]
    OR      EDX,[ESI+ 92]
    OR      EAX,[ESI+128]
    OR      ECX,[ESI+164]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+236]
    OR      ECX,[ESI+272]
    JMP     caseend

    ALIGN   8
case15:
    MOV     EAX,[ESI+ 24]
    MOV     ECX,[ESI+ 28]
    MOV     EDX,[ESI+ 32]
    OR      EAX,[ESI+ 36]
    OR      ECX,[ESI+ 40]
    OR      EDX,[ESI+ 44]
    OR      EAX,[ESI+ 48]
    OR      ECX,[ESI+ 52]
    OR      EDX,[ESI+ 56]
    OR      EAX,[ESI+ 60]
    OR      ECX,[ESI+ 64]
    OR      EDX,[ESI+ 68]
    OR      EAX,[ESI+ 96]
    OR      ECX,[ESI+100]
    OR      EDX,[ESI+104]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+168]
    OR      EDX,[ESI+204]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+276]
    JMP     caseend

    ALIGN   8
case16:
    MOV     EAX,[ESI+ 24]
    MOV     ECX,[ESI+ 28]
    MOV     EDX,[ESI+ 32]
    OR      EAX,[ESI+ 36]
    OR      ECX,[ESI+ 40]
    OR      EDX,[ESI+ 44]
    OR      EAX,[ESI+ 48]
    OR      ECX,[ESI+ 52]
    OR      EDX,[ESI+ 56]
    OR      EAX,[ESI+ 60]
    OR      ECX,[ESI+ 64]
    OR      EDX,[ESI+ 68]
    OR      EAX,[ESI+ 96]
    OR      ECX,[ESI+100]
    OR      EDX,[ESI+104]
    OR      EAX,[ESI+136]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+208]
    OR      EAX,[ESI+244]
    OR      ECX,[ESI+280]
    JMP     caseend

    ALIGN   8
case17:
    MOV     EAX,[ESI+ 24]
    MOV     ECX,[ESI+ 28]
    MOV     EDX,[ESI+ 32]
    OR      EAX,[ESI+ 36]
    OR      ECX,[ESI+ 40]
    OR      EDX,[ESI+ 44]
    OR      EAX,[ESI+ 48]
    OR      ECX,[ESI+ 52]
    OR      EDX,[ESI+ 56]
    OR      EAX,[ESI+ 60]
    OR      ECX,[ESI+ 64]
    OR      EDX,[ESI+ 68]
    OR      EAX,[ESI+ 96]
    OR      ECX,[ESI+100]
    OR      EDX,[ESI+104]
    OR      EAX,[ESI+140]
    OR      ECX,[ESI+176]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+248]
    OR      ECX,[ESI+284]
    JMP     caseend

    ALIGN   8
case18:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+  4]
    MOV     EDX,[ESI+  8]
    OR      EAX,[ESI+ 36]
    OR      ECX,[ESI+ 40]
    OR      EDX,[ESI+ 44]
    OR      EAX,[ESI+ 72]
    OR      ECX,[ESI+ 76]
    OR      EDX,[ESI+ 80]
    OR      EAX,[ESI+ 84]
    OR      ECX,[ESI+ 88]
    OR      EDX,[ESI+ 92]
    OR      EAX,[ESI+ 96]
    OR      ECX,[ESI+100]
    OR      EDX,[ESI+104]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+144]
    OR      EDX,[ESI+180]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+252]
    JMP     caseend

    ALIGN   8
case19:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+  4]
    MOV     EDX,[ESI+  8]
    OR      EAX,[ESI+ 36]
    OR      ECX,[ESI+ 40]
    OR      EDX,[ESI+ 44]
    OR      EAX,[ESI+ 72]
    OR      ECX,[ESI+ 76]
    OR      EDX,[ESI+ 80]
    OR      EAX,[ESI+ 84]
    OR      ECX,[ESI+ 88]
    OR      EDX,[ESI+ 92]
    OR      EAX,[ESI+ 96]
    OR      ECX,[ESI+100]
    OR      EDX,[ESI+104]
    OR      EAX,[ESI+112]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+184]
    OR      EAX,[ESI+220]
    OR      ECX,[ESI+256]
    JMP     caseend

    ALIGN   8
case20:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+  4]
    MOV     EDX,[ESI+  8]
    OR      EAX,[ESI+ 36]
    OR      ECX,[ESI+ 40]
    OR      EDX,[ESI+ 44]
    OR      EAX,[ESI+ 72]
    OR      ECX,[ESI+ 76]
    OR      EDX,[ESI+ 80]
    OR      EAX,[ESI+ 84]
    OR      ECX,[ESI+ 88]
    OR      EDX,[ESI+ 92]
    OR      EAX,[ESI+ 96]
    OR      ECX,[ESI+100]
    OR      EDX,[ESI+104]
    OR      EAX,[ESI+116]
    OR      ECX,[ESI+152]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+224]
    OR      ECX,[ESI+260]
    JMP     caseend

    ALIGN   8
case21:
    MOV     EAX,[ESI+ 12]
    MOV     ECX,[ESI+ 16]
    MOV     EDX,[ESI+ 20]
    OR      EAX,[ESI+ 48]
    OR      ECX,[ESI+ 52]
    OR      EDX,[ESI+ 56]
    OR      EAX,[ESI+ 72]
    OR      ECX,[ESI+ 76]
    OR      EDX,[ESI+ 80]
    OR      EAX,[ESI+ 84]
    OR      ECX,[ESI+ 88]
    OR      EDX,[ESI+ 92]
    OR      EAX,[ESI+ 96]
    OR      ECX,[ESI+100]
    OR      EDX,[ESI+104]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+156]
    OR      EDX,[ESI+192]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+264]
    JMP     caseend

    ALIGN   8
case22:
    MOV     EAX,[ESI+ 12]
    MOV     ECX,[ESI+ 16]
    MOV     EDX,[ESI+ 20]
    OR      EAX,[ESI+ 48]
    OR      ECX,[ESI+ 52]
    OR      EDX,[ESI+ 56]
    OR      EAX,[ESI+ 72]
    OR      ECX,[ESI+ 76]
    OR      EDX,[ESI+ 80]
    OR      EAX,[ESI+ 84]
    OR      ECX,[ESI+ 88]
    OR      EDX,[ESI+ 92]
    OR      EAX,[ESI+ 96]
    OR      ECX,[ESI+100]
    OR      EDX,[ESI+104]
    OR      EAX,[ESI+124]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+196]
    OR      EAX,[ESI+232]
    OR      ECX,[ESI+268]
    JMP     caseend

    ALIGN   8
case23:
    MOV     EAX,[ESI+ 12]
    MOV     ECX,[ESI+ 16]
    MOV     EDX,[ESI+ 20]
    OR      EAX,[ESI+ 48]
    OR      ECX,[ESI+ 52]
    OR      EDX,[ESI+ 56]
    OR      EAX,[ESI+ 72]
    OR      ECX,[ESI+ 76]
    OR      EDX,[ESI+ 80]
    OR      EAX,[ESI+ 84]
    OR      ECX,[ESI+ 88]
    OR      EDX,[ESI+ 92]
    OR      EAX,[ESI+ 96]
    OR      ECX,[ESI+100]
    OR      EDX,[ESI+104]
    OR      EAX,[ESI+128]
    OR      ECX,[ESI+164]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+236]
    OR      ECX,[ESI+272]
    JMP     caseend

    ALIGN   8
case24:
    MOV     EAX,[ESI+ 24]
    MOV     ECX,[ESI+ 28]
    MOV     EDX,[ESI+ 32]
    OR      EAX,[ESI+ 60]
    OR      ECX,[ESI+ 64]
    OR      EDX,[ESI+ 68]
    OR      EAX,[ESI+ 72]
    OR      ECX,[ESI+ 76]
    OR      EDX,[ESI+ 80]
    OR      EAX,[ESI+ 84]
    OR      ECX,[ESI+ 88]
    OR      EDX,[ESI+ 92]
    OR      EAX,[ESI+ 96]
    OR      ECX,[ESI+100]
    OR      EDX,[ESI+104]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+168]
    OR      EDX,[ESI+204]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+276]
    JMP     caseend

    ALIGN   8
case25:
    MOV     EAX,[ESI+ 24]
    MOV     ECX,[ESI+ 28]
    MOV     EDX,[ESI+ 32]
    OR      EAX,[ESI+ 60]
    OR      ECX,[ESI+ 64]
    OR      EDX,[ESI+ 68]
    OR      EAX,[ESI+ 72]
    OR      ECX,[ESI+ 76]
    OR      EDX,[ESI+ 80]
    OR      EAX,[ESI+ 84]
    OR      ECX,[ESI+ 88]
    OR      EDX,[ESI+ 92]
    OR      EAX,[ESI+ 96]
    OR      ECX,[ESI+100]
    OR      EDX,[ESI+104]
    OR      EAX,[ESI+136]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+208]
    OR      EAX,[ESI+244]
    OR      ECX,[ESI+280]
    JMP     caseend

    ALIGN   8
case26:
    MOV     EAX,[ESI+ 24]
    MOV     ECX,[ESI+ 28]
    MOV     EDX,[ESI+ 32]
    OR      EAX,[ESI+ 60]
    OR      ECX,[ESI+ 64]
    OR      EDX,[ESI+ 68]
    OR      EAX,[ESI+ 72]
    OR      ECX,[ESI+ 76]
    OR      EDX,[ESI+ 80]
    OR      EAX,[ESI+ 84]
    OR      ECX,[ESI+ 88]
    OR      EDX,[ESI+ 92]
    OR      EAX,[ESI+ 96]
    OR      ECX,[ESI+100]
    OR      EDX,[ESI+104]
    OR      EAX,[ESI+140]
    OR      ECX,[ESI+176]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+248]
    OR      ECX,[ESI+284]
    JMP     caseend

    ALIGN   8
case27:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+ 36]
    MOV     EDX,[ESI+ 72]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+112]
    OR      EDX,[ESI+116]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+124]
    OR      EDX,[ESI+128]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+136]
    OR      EDX,[ESI+140]
    OR      EAX,[ESI+144]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+152]
    OR      EAX,[ESI+180]
    OR      ECX,[ESI+184]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+252]
    JMP     caseend

    ALIGN   8
case28:
    MOV     EAX,[ESI+  4]
    MOV     ECX,[ESI+ 40]
    MOV     EDX,[ESI+ 76]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+112]
    OR      EDX,[ESI+116]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+124]
    OR      EDX,[ESI+128]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+136]
    OR      EDX,[ESI+140]
    OR      EAX,[ESI+144]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+152]
    OR      EAX,[ESI+180]
    OR      ECX,[ESI+184]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+220]
    OR      ECX,[ESI+256]
    JMP     caseend

    ALIGN   8
case29:
    MOV     EAX,[ESI+  8]
    MOV     ECX,[ESI+ 44]
    MOV     EDX,[ESI+ 80]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+112]
    OR      EDX,[ESI+116]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+124]
    OR      EDX,[ESI+128]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+136]
    OR      EDX,[ESI+140]
    OR      EAX,[ESI+144]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+152]
    OR      EAX,[ESI+180]
    OR      ECX,[ESI+184]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+224]
    OR      ECX,[ESI+260]
    JMP     caseend

    ALIGN   8
case30:
    MOV     EAX,[ESI+ 12]
    MOV     ECX,[ESI+ 48]
    MOV     EDX,[ESI+ 84]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+112]
    OR      EDX,[ESI+116]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+124]
    OR      EDX,[ESI+128]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+136]
    OR      EDX,[ESI+140]
    OR      EAX,[ESI+156]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+164]
    OR      EAX,[ESI+192]
    OR      ECX,[ESI+196]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+264]
    JMP     caseend

    ALIGN   8
case31:
    MOV     EAX,[ESI+ 16]
    MOV     ECX,[ESI+ 52]
    MOV     EDX,[ESI+ 88]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+112]
    OR      EDX,[ESI+116]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+124]
    OR      EDX,[ESI+128]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+136]
    OR      EDX,[ESI+140]
    OR      EAX,[ESI+156]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+164]
    OR      EAX,[ESI+192]
    OR      ECX,[ESI+196]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+232]
    OR      ECX,[ESI+268]
    JMP     caseend

    ALIGN   8
case32:
    MOV     EAX,[ESI+ 20]
    MOV     ECX,[ESI+ 56]
    MOV     EDX,[ESI+ 92]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+112]
    OR      EDX,[ESI+116]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+124]
    OR      EDX,[ESI+128]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+136]
    OR      EDX,[ESI+140]
    OR      EAX,[ESI+156]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+164]
    OR      EAX,[ESI+192]
    OR      ECX,[ESI+196]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+236]
    OR      ECX,[ESI+272]
    JMP     caseend

    ALIGN   8
case33:
    MOV     EAX,[ESI+ 24]
    MOV     ECX,[ESI+ 60]
    MOV     EDX,[ESI+ 96]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+112]
    OR      EDX,[ESI+116]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+124]
    OR      EDX,[ESI+128]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+136]
    OR      EDX,[ESI+140]
    OR      EAX,[ESI+168]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+176]
    OR      EAX,[ESI+204]
    OR      ECX,[ESI+208]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+276]
    JMP     caseend

    ALIGN   8
case34:
    MOV     EAX,[ESI+ 28]
    MOV     ECX,[ESI+ 64]
    MOV     EDX,[ESI+100]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+112]
    OR      EDX,[ESI+116]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+124]
    OR      EDX,[ESI+128]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+136]
    OR      EDX,[ESI+140]
    OR      EAX,[ESI+168]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+176]
    OR      EAX,[ESI+204]
    OR      ECX,[ESI+208]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+244]
    OR      ECX,[ESI+280]
    JMP     caseend

    ALIGN   8
case35:
    MOV     EAX,[ESI+ 32]
    MOV     ECX,[ESI+ 68]
    MOV     EDX,[ESI+104]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+112]
    OR      EDX,[ESI+116]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+124]
    OR      EDX,[ESI+128]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+136]
    OR      EDX,[ESI+140]
    OR      EAX,[ESI+168]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+176]
    OR      EAX,[ESI+204]
    OR      ECX,[ESI+208]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+248]
    OR      ECX,[ESI+284]
    JMP     caseend

    ALIGN   8
case36:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+ 36]
    MOV     EDX,[ESI+ 72]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+112]
    OR      EDX,[ESI+116]
    OR      EAX,[ESI+144]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+152]
    OR      EAX,[ESI+156]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+164]
    OR      EAX,[ESI+168]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+176]
    OR      EAX,[ESI+180]
    OR      ECX,[ESI+184]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+252]
    JMP     caseend

    ALIGN   8
case37:
    MOV     EAX,[ESI+  4]
    MOV     ECX,[ESI+ 40]
    MOV     EDX,[ESI+ 76]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+112]
    OR      EDX,[ESI+116]
    OR      EAX,[ESI+144]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+152]
    OR      EAX,[ESI+156]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+164]
    OR      EAX,[ESI+168]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+176]
    OR      EAX,[ESI+180]
    OR      ECX,[ESI+184]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+220]
    OR      ECX,[ESI+256]
    JMP     caseend

    ALIGN   8
case38:
    MOV     EAX,[ESI+  8]
    MOV     ECX,[ESI+ 44]
    MOV     EDX,[ESI+ 80]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+112]
    OR      EDX,[ESI+116]
    OR      EAX,[ESI+144]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+152]
    OR      EAX,[ESI+156]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+164]
    OR      EAX,[ESI+168]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+176]
    OR      EAX,[ESI+180]
    OR      ECX,[ESI+184]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+224]
    OR      ECX,[ESI+260]
    JMP     caseend

    ALIGN   8
case39:
    MOV     EAX,[ESI+ 12]
    MOV     ECX,[ESI+ 48]
    MOV     EDX,[ESI+ 84]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+124]
    OR      EDX,[ESI+128]
    OR      EAX,[ESI+144]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+152]
    OR      EAX,[ESI+156]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+164]
    OR      EAX,[ESI+168]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+176]
    OR      EAX,[ESI+192]
    OR      ECX,[ESI+196]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+264]
    JMP     caseend

    ALIGN   8
case40:
    MOV     EAX,[ESI+ 16]
    MOV     ECX,[ESI+ 52]
    MOV     EDX,[ESI+ 88]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+124]
    OR      EDX,[ESI+128]
    OR      EAX,[ESI+144]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+152]
    OR      EAX,[ESI+156]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+164]
    OR      EAX,[ESI+168]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+176]
    OR      EAX,[ESI+192]
    OR      ECX,[ESI+196]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+232]
    OR      ECX,[ESI+268]
    JMP     caseend

    ALIGN   8
case41:
    MOV     EAX,[ESI+ 20]
    MOV     ECX,[ESI+ 56]
    MOV     EDX,[ESI+ 92]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+124]
    OR      EDX,[ESI+128]
    OR      EAX,[ESI+144]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+152]
    OR      EAX,[ESI+156]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+164]
    OR      EAX,[ESI+168]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+176]
    OR      EAX,[ESI+192]
    OR      ECX,[ESI+196]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+236]
    OR      ECX,[ESI+272]
    JMP     caseend

    ALIGN   8
case42:
    MOV     EAX,[ESI+ 24]
    MOV     ECX,[ESI+ 60]
    MOV     EDX,[ESI+ 96]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+136]
    OR      EDX,[ESI+140]
    OR      EAX,[ESI+144]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+152]
    OR      EAX,[ESI+156]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+164]
    OR      EAX,[ESI+168]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+176]
    OR      EAX,[ESI+204]
    OR      ECX,[ESI+208]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+276]
    JMP     caseend

    ALIGN   8
case43:
    MOV     EAX,[ESI+ 28]
    MOV     ECX,[ESI+ 64]
    MOV     EDX,[ESI+100]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+136]
    OR      EDX,[ESI+140]
    OR      EAX,[ESI+144]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+152]
    OR      EAX,[ESI+156]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+164]
    OR      EAX,[ESI+168]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+176]
    OR      EAX,[ESI+204]
    OR      ECX,[ESI+208]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+244]
    OR      ECX,[ESI+280]
    JMP     caseend

    ALIGN   8
case44:
    MOV     EAX,[ESI+ 32]
    MOV     ECX,[ESI+ 68]
    MOV     EDX,[ESI+104]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+136]
    OR      EDX,[ESI+140]
    OR      EAX,[ESI+144]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+152]
    OR      EAX,[ESI+156]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+164]
    OR      EAX,[ESI+168]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+176]
    OR      EAX,[ESI+204]
    OR      ECX,[ESI+208]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+248]
    OR      ECX,[ESI+284]
    JMP     caseend

    ALIGN   8
case45:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+ 36]
    MOV     EDX,[ESI+ 72]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+112]
    OR      EDX,[ESI+116]
    OR      EAX,[ESI+144]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+152]
    OR      EAX,[ESI+180]
    OR      ECX,[ESI+184]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+192]
    OR      ECX,[ESI+196]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+204]
    OR      ECX,[ESI+208]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+252]
    JMP     caseend

    ALIGN   8
case46:
    MOV     EAX,[ESI+  4]
    MOV     ECX,[ESI+ 40]
    MOV     EDX,[ESI+ 76]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+112]
    OR      EDX,[ESI+116]
    OR      EAX,[ESI+144]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+152]
    OR      EAX,[ESI+180]
    OR      ECX,[ESI+184]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+192]
    OR      ECX,[ESI+196]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+204]
    OR      ECX,[ESI+208]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+220]
    OR      ECX,[ESI+256]
    JMP     caseend

    ALIGN   8
case47:
    MOV     EAX,[ESI+  8]
    MOV     ECX,[ESI+ 44]
    MOV     EDX,[ESI+ 80]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+112]
    OR      EDX,[ESI+116]
    OR      EAX,[ESI+144]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+152]
    OR      EAX,[ESI+180]
    OR      ECX,[ESI+184]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+192]
    OR      ECX,[ESI+196]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+204]
    OR      ECX,[ESI+208]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+224]
    OR      ECX,[ESI+260]
    JMP     caseend

    ALIGN   8
case48:
    MOV     EAX,[ESI+ 12]
    MOV     ECX,[ESI+ 48]
    MOV     EDX,[ESI+ 84]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+124]
    OR      EDX,[ESI+128]
    OR      EAX,[ESI+156]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+164]
    OR      EAX,[ESI+180]
    OR      ECX,[ESI+184]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+192]
    OR      ECX,[ESI+196]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+204]
    OR      ECX,[ESI+208]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+264]
    JMP     caseend

    ALIGN   8
case49:
    MOV     EAX,[ESI+ 16]
    MOV     ECX,[ESI+ 52]
    MOV     EDX,[ESI+ 88]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+124]
    OR      EDX,[ESI+128]
    OR      EAX,[ESI+156]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+164]
    OR      EAX,[ESI+180]
    OR      ECX,[ESI+184]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+192]
    OR      ECX,[ESI+196]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+204]
    OR      ECX,[ESI+208]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+232]
    OR      ECX,[ESI+268]
    JMP     caseend

    ALIGN   8
case50:
    MOV     EAX,[ESI+ 20]
    MOV     ECX,[ESI+ 56]
    MOV     EDX,[ESI+ 92]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+124]
    OR      EDX,[ESI+128]
    OR      EAX,[ESI+156]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+164]
    OR      EAX,[ESI+180]
    OR      ECX,[ESI+184]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+192]
    OR      ECX,[ESI+196]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+204]
    OR      ECX,[ESI+208]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+236]
    OR      ECX,[ESI+272]
    JMP     caseend

    ALIGN   8
case51:
    MOV     EAX,[ESI+ 24]
    MOV     ECX,[ESI+ 60]
    MOV     EDX,[ESI+ 96]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+136]
    OR      EDX,[ESI+140]
    OR      EAX,[ESI+168]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+176]
    OR      EAX,[ESI+180]
    OR      ECX,[ESI+184]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+192]
    OR      ECX,[ESI+196]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+204]
    OR      ECX,[ESI+208]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+276]
    JMP     caseend

    ALIGN   8
case52:
    MOV     EAX,[ESI+ 28]
    MOV     ECX,[ESI+ 64]
    MOV     EDX,[ESI+100]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+136]
    OR      EDX,[ESI+140]
    OR      EAX,[ESI+168]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+176]
    OR      EAX,[ESI+180]
    OR      ECX,[ESI+184]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+192]
    OR      ECX,[ESI+196]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+204]
    OR      ECX,[ESI+208]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+244]
    OR      ECX,[ESI+280]
    JMP     caseend

    ALIGN   8
case53:
    MOV     EAX,[ESI+ 32]
    MOV     ECX,[ESI+ 68]
    MOV     EDX,[ESI+104]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+136]
    OR      EDX,[ESI+140]
    OR      EAX,[ESI+168]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+176]
    OR      EAX,[ESI+180]
    OR      ECX,[ESI+184]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+192]
    OR      ECX,[ESI+196]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+204]
    OR      ECX,[ESI+208]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+248]
    OR      ECX,[ESI+284]
    JMP     caseend

    ALIGN   8
case54:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+ 36]
    MOV     EDX,[ESI+ 72]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+144]
    OR      EDX,[ESI+180]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+220]
    OR      EDX,[ESI+224]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+232]
    OR      EDX,[ESI+236]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+244]
    OR      EDX,[ESI+248]
    OR      EAX,[ESI+252]
    OR      ECX,[ESI+256]
    OR      EDX,[ESI+260]
    OR      EAX,[ESI+288]
    OR      ECX,[ESI+292]
    JMP     caseend

    ALIGN   8
case55:
    MOV     EAX,[ESI+  4]
    MOV     ECX,[ESI+ 40]
    MOV     EDX,[ESI+ 76]
    OR      EAX,[ESI+112]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+184]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+220]
    OR      EDX,[ESI+224]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+232]
    OR      EDX,[ESI+236]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+244]
    OR      EDX,[ESI+248]
    OR      EAX,[ESI+252]
    OR      ECX,[ESI+256]
    OR      EDX,[ESI+260]
    OR      EAX,[ESI+288]
    OR      ECX,[ESI+292]
    JMP     caseend

    ALIGN   8
case56:
    MOV     EAX,[ESI+  8]
    MOV     ECX,[ESI+ 44]
    MOV     EDX,[ESI+ 80]
    OR      EAX,[ESI+116]
    OR      ECX,[ESI+152]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+220]
    OR      EDX,[ESI+224]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+232]
    OR      EDX,[ESI+236]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+244]
    OR      EDX,[ESI+248]
    OR      EAX,[ESI+252]
    OR      ECX,[ESI+256]
    OR      EDX,[ESI+260]
    OR      EAX,[ESI+288]
    OR      ECX,[ESI+292]
    JMP     caseend

    ALIGN   8
case57:
    MOV     EAX,[ESI+ 12]
    MOV     ECX,[ESI+ 48]
    MOV     EDX,[ESI+ 84]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+156]
    OR      EDX,[ESI+192]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+220]
    OR      EDX,[ESI+224]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+232]
    OR      EDX,[ESI+236]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+244]
    OR      EDX,[ESI+248]
    OR      EAX,[ESI+264]
    OR      ECX,[ESI+268]
    OR      EDX,[ESI+272]
    OR      EAX,[ESI+300]
    OR      ECX,[ESI+304]
    JMP     caseend

    ALIGN   8
case58:
    MOV     EAX,[ESI+ 16]
    MOV     ECX,[ESI+ 52]
    MOV     EDX,[ESI+ 88]
    OR      EAX,[ESI+124]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+196]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+220]
    OR      EDX,[ESI+224]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+232]
    OR      EDX,[ESI+236]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+244]
    OR      EDX,[ESI+248]
    OR      EAX,[ESI+264]
    OR      ECX,[ESI+268]
    OR      EDX,[ESI+272]
    OR      EAX,[ESI+300]
    OR      ECX,[ESI+304]
    JMP     caseend

    ALIGN   8
case59:
    MOV     EAX,[ESI+ 20]
    MOV     ECX,[ESI+ 56]
    MOV     EDX,[ESI+ 92]
    OR      EAX,[ESI+128]
    OR      ECX,[ESI+164]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+220]
    OR      EDX,[ESI+224]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+232]
    OR      EDX,[ESI+236]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+244]
    OR      EDX,[ESI+248]
    OR      EAX,[ESI+264]
    OR      ECX,[ESI+268]
    OR      EDX,[ESI+272]
    OR      EAX,[ESI+300]
    OR      ECX,[ESI+304]
    JMP     caseend

    ALIGN   8
case60:
    MOV     EAX,[ESI+ 24]
    MOV     ECX,[ESI+ 60]
    MOV     EDX,[ESI+ 96]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+168]
    OR      EDX,[ESI+204]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+220]
    OR      EDX,[ESI+224]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+232]
    OR      EDX,[ESI+236]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+244]
    OR      EDX,[ESI+248]
    OR      EAX,[ESI+276]
    OR      ECX,[ESI+280]
    OR      EDX,[ESI+284]
    OR      EAX,[ESI+312]
    OR      ECX,[ESI+316]
    JMP     caseend

    ALIGN   8
case61:
    MOV     EAX,[ESI+ 28]
    MOV     ECX,[ESI+ 64]
    MOV     EDX,[ESI+100]
    OR      EAX,[ESI+136]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+208]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+220]
    OR      EDX,[ESI+224]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+232]
    OR      EDX,[ESI+236]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+244]
    OR      EDX,[ESI+248]
    OR      EAX,[ESI+276]
    OR      ECX,[ESI+280]
    OR      EDX,[ESI+284]
    OR      EAX,[ESI+312]
    OR      ECX,[ESI+316]
    JMP     caseend

    ALIGN   8
case62:
    MOV     EAX,[ESI+ 32]
    MOV     ECX,[ESI+ 68]
    MOV     EDX,[ESI+104]
    OR      EAX,[ESI+140]
    OR      ECX,[ESI+176]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+220]
    OR      EDX,[ESI+224]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+232]
    OR      EDX,[ESI+236]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+244]
    OR      EDX,[ESI+248]
    OR      EAX,[ESI+276]
    OR      ECX,[ESI+280]
    OR      EDX,[ESI+284]
    OR      EAX,[ESI+312]
    OR      ECX,[ESI+316]
    JMP     caseend

    ALIGN   8
case63:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+ 36]
    MOV     EDX,[ESI+ 72]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+144]
    OR      EDX,[ESI+180]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+220]
    OR      EDX,[ESI+224]
    OR      EAX,[ESI+252]
    OR      ECX,[ESI+256]
    OR      EDX,[ESI+260]
    OR      EAX,[ESI+264]
    OR      ECX,[ESI+268]
    OR      EDX,[ESI+272]
    OR      EAX,[ESI+276]
    OR      ECX,[ESI+280]
    OR      EDX,[ESI+284]
    OR      EAX,[ESI+288]
    OR      ECX,[ESI+292]
    JMP     caseend

    ALIGN   8
case64:
    MOV     EAX,[ESI+  4]
    MOV     ECX,[ESI+ 40]
    MOV     EDX,[ESI+ 76]
    OR      EAX,[ESI+112]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+184]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+220]
    OR      EDX,[ESI+224]
    OR      EAX,[ESI+252]
    OR      ECX,[ESI+256]
    OR      EDX,[ESI+260]
    OR      EAX,[ESI+264]
    OR      ECX,[ESI+268]
    OR      EDX,[ESI+272]
    OR      EAX,[ESI+276]
    OR      ECX,[ESI+280]
    OR      EDX,[ESI+284]
    OR      EAX,[ESI+288]
    OR      ECX,[ESI+292]
    JMP     caseend

    ALIGN   8
case65:
    MOV     EAX,[ESI+  8]
    MOV     ECX,[ESI+ 44]
    MOV     EDX,[ESI+ 80]
    OR      EAX,[ESI+116]
    OR      ECX,[ESI+152]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+220]
    OR      EDX,[ESI+224]
    OR      EAX,[ESI+252]
    OR      ECX,[ESI+256]
    OR      EDX,[ESI+260]
    OR      EAX,[ESI+264]
    OR      ECX,[ESI+268]
    OR      EDX,[ESI+272]
    OR      EAX,[ESI+276]
    OR      ECX,[ESI+280]
    OR      EDX,[ESI+284]
    OR      EAX,[ESI+288]
    OR      ECX,[ESI+292]
    JMP     caseend

    ALIGN   8
case66:
    MOV     EAX,[ESI+ 12]
    MOV     ECX,[ESI+ 48]
    MOV     EDX,[ESI+ 84]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+156]
    OR      EDX,[ESI+192]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+232]
    OR      EDX,[ESI+236]
    OR      EAX,[ESI+252]
    OR      ECX,[ESI+256]
    OR      EDX,[ESI+260]
    OR      EAX,[ESI+264]
    OR      ECX,[ESI+268]
    OR      EDX,[ESI+272]
    OR      EAX,[ESI+276]
    OR      ECX,[ESI+280]
    OR      EDX,[ESI+284]
    OR      EAX,[ESI+300]
    OR      ECX,[ESI+304]
    JMP     caseend

    ALIGN   8
case67:
    MOV     EAX,[ESI+ 16]
    MOV     ECX,[ESI+ 52]
    MOV     EDX,[ESI+ 88]
    OR      EAX,[ESI+124]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+196]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+232]
    OR      EDX,[ESI+236]
    OR      EAX,[ESI+252]
    OR      ECX,[ESI+256]
    OR      EDX,[ESI+260]
    OR      EAX,[ESI+264]
    OR      ECX,[ESI+268]
    OR      EDX,[ESI+272]
    OR      EAX,[ESI+276]
    OR      ECX,[ESI+280]
    OR      EDX,[ESI+284]
    OR      EAX,[ESI+300]
    OR      ECX,[ESI+304]
    JMP     caseend

    ALIGN   8
case68:
    MOV     EAX,[ESI+ 20]
    MOV     ECX,[ESI+ 56]
    MOV     EDX,[ESI+ 92]
    OR      EAX,[ESI+128]
    OR      ECX,[ESI+164]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+232]
    OR      EDX,[ESI+236]
    OR      EAX,[ESI+252]
    OR      ECX,[ESI+256]
    OR      EDX,[ESI+260]
    OR      EAX,[ESI+264]
    OR      ECX,[ESI+268]
    OR      EDX,[ESI+272]
    OR      EAX,[ESI+276]
    OR      ECX,[ESI+280]
    OR      EDX,[ESI+284]
    OR      EAX,[ESI+300]
    OR      ECX,[ESI+304]
    JMP     caseend

    ALIGN   8
case69:
    MOV     EAX,[ESI+ 24]
    MOV     ECX,[ESI+ 60]
    MOV     EDX,[ESI+ 96]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+168]
    OR      EDX,[ESI+204]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+244]
    OR      EDX,[ESI+248]
    OR      EAX,[ESI+252]
    OR      ECX,[ESI+256]
    OR      EDX,[ESI+260]
    OR      EAX,[ESI+264]
    OR      ECX,[ESI+268]
    OR      EDX,[ESI+272]
    OR      EAX,[ESI+276]
    OR      ECX,[ESI+280]
    OR      EDX,[ESI+284]
    OR      EAX,[ESI+312]
    OR      ECX,[ESI+316]
    JMP     caseend

    ALIGN   8
case70:
    MOV     EAX,[ESI+ 28]
    MOV     ECX,[ESI+ 64]
    MOV     EDX,[ESI+100]
    OR      EAX,[ESI+136]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+208]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+244]
    OR      EDX,[ESI+248]
    OR      EAX,[ESI+252]
    OR      ECX,[ESI+256]
    OR      EDX,[ESI+260]
    OR      EAX,[ESI+264]
    OR      ECX,[ESI+268]
    OR      EDX,[ESI+272]
    OR      EAX,[ESI+276]
    OR      ECX,[ESI+280]
    OR      EDX,[ESI+284]
    OR      EAX,[ESI+312]
    OR      ECX,[ESI+316]
    JMP     caseend

    ALIGN   8
case71:
    MOV     EAX,[ESI+ 32]
    MOV     ECX,[ESI+ 68]
    MOV     EDX,[ESI+104]
    OR      EAX,[ESI+140]
    OR      ECX,[ESI+176]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+244]
    OR      EDX,[ESI+248]
    OR      EAX,[ESI+252]
    OR      ECX,[ESI+256]
    OR      EDX,[ESI+260]
    OR      EAX,[ESI+264]
    OR      ECX,[ESI+268]
    OR      EDX,[ESI+272]
    OR      EAX,[ESI+276]
    OR      ECX,[ESI+280]
    OR      EDX,[ESI+284]
    OR      EAX,[ESI+312]
    OR      ECX,[ESI+316]
    JMP     caseend

    ALIGN   8
case72:
    MOV     EAX,[ESI+  0]
    MOV     ECX,[ESI+ 36]
    MOV     EDX,[ESI+ 72]
    OR      EAX,[ESI+108]
    OR      ECX,[ESI+144]
    OR      EDX,[ESI+180]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+220]
    OR      EDX,[ESI+224]
    OR      EAX,[ESI+252]
    OR      ECX,[ESI+256]
    OR      EDX,[ESI+260]
    OR      EAX,[ESI+288]
    OR      ECX,[ESI+292]
    OR      EDX,[ESI+296]
    OR      EAX,[ESI+300]
    OR      ECX,[ESI+304]
    OR      EDX,[ESI+308]
    OR      EAX,[ESI+312]
    OR      ECX,[ESI+316]
    JMP     caseend

    ALIGN   8
case73:
    MOV     EAX,[ESI+  4]
    MOV     ECX,[ESI+ 40]
    MOV     EDX,[ESI+ 76]
    OR      EAX,[ESI+112]
    OR      ECX,[ESI+148]
    OR      EDX,[ESI+184]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+220]
    OR      EDX,[ESI+224]
    OR      EAX,[ESI+252]
    OR      ECX,[ESI+256]
    OR      EDX,[ESI+260]
    OR      EAX,[ESI+288]
    OR      ECX,[ESI+292]
    OR      EDX,[ESI+296]
    OR      EAX,[ESI+300]
    OR      ECX,[ESI+304]
    OR      EDX,[ESI+308]
    OR      EAX,[ESI+312]
    OR      ECX,[ESI+316]
    JMP     caseend

    ALIGN   8
case74:
    MOV     EAX,[ESI+  8]
    MOV     ECX,[ESI+ 44]
    MOV     EDX,[ESI+ 80]
    OR      EAX,[ESI+116]
    OR      ECX,[ESI+152]
    OR      EDX,[ESI+188]
    OR      EAX,[ESI+216]
    OR      ECX,[ESI+220]
    OR      EDX,[ESI+224]
    OR      EAX,[ESI+252]
    OR      ECX,[ESI+256]
    OR      EDX,[ESI+260]
    OR      EAX,[ESI+288]
    OR      ECX,[ESI+292]
    OR      EDX,[ESI+296]
    OR      EAX,[ESI+300]
    OR      ECX,[ESI+304]
    OR      EDX,[ESI+308]
    OR      EAX,[ESI+312]
    OR      ECX,[ESI+316]
    JMP     caseend

    ALIGN   8
case75:
    MOV     EAX,[ESI+ 12]
    MOV     ECX,[ESI+ 48]
    MOV     EDX,[ESI+ 84]
    OR      EAX,[ESI+120]
    OR      ECX,[ESI+156]
    OR      EDX,[ESI+192]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+232]
    OR      EDX,[ESI+236]
    OR      EAX,[ESI+264]
    OR      ECX,[ESI+268]
    OR      EDX,[ESI+272]
    OR      EAX,[ESI+288]
    OR      ECX,[ESI+292]
    OR      EDX,[ESI+296]
    OR      EAX,[ESI+300]
    OR      ECX,[ESI+304]
    OR      EDX,[ESI+308]
    OR      EAX,[ESI+312]
    OR      ECX,[ESI+316]
    JMP     caseend

    ALIGN   8
case76:
    MOV     EAX,[ESI+ 16]
    MOV     ECX,[ESI+ 52]
    MOV     EDX,[ESI+ 88]
    OR      EAX,[ESI+124]
    OR      ECX,[ESI+160]
    OR      EDX,[ESI+196]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+232]
    OR      EDX,[ESI+236]
    OR      EAX,[ESI+264]
    OR      ECX,[ESI+268]
    OR      EDX,[ESI+272]
    OR      EAX,[ESI+288]
    OR      ECX,[ESI+292]
    OR      EDX,[ESI+296]
    OR      EAX,[ESI+300]
    OR      ECX,[ESI+304]
    OR      EDX,[ESI+308]
    OR      EAX,[ESI+312]
    OR      ECX,[ESI+316]
    JMP     caseend

    ALIGN   8
case77:
    MOV     EAX,[ESI+ 20]
    MOV     ECX,[ESI+ 56]
    MOV     EDX,[ESI+ 92]
    OR      EAX,[ESI+128]
    OR      ECX,[ESI+164]
    OR      EDX,[ESI+200]
    OR      EAX,[ESI+228]
    OR      ECX,[ESI+232]
    OR      EDX,[ESI+236]
    OR      EAX,[ESI+264]
    OR      ECX,[ESI+268]
    OR      EDX,[ESI+272]
    OR      EAX,[ESI+288]
    OR      ECX,[ESI+292]
    OR      EDX,[ESI+296]
    OR      EAX,[ESI+300]
    OR      ECX,[ESI+304]
    OR      EDX,[ESI+308]
    OR      EAX,[ESI+312]
    OR      ECX,[ESI+316]
    JMP     caseend

    ALIGN   8
case78:
    MOV     EAX,[ESI+ 24]
    MOV     ECX,[ESI+ 60]
    MOV     EDX,[ESI+ 96]
    OR      EAX,[ESI+132]
    OR      ECX,[ESI+168]
    OR      EDX,[ESI+204]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+244]
    OR      EDX,[ESI+248]
    OR      EAX,[ESI+276]
    OR      ECX,[ESI+280]
    OR      EDX,[ESI+284]
    OR      EAX,[ESI+288]
    OR      ECX,[ESI+292]
    OR      EDX,[ESI+296]
    OR      EAX,[ESI+300]
    OR      ECX,[ESI+304]
    OR      EDX,[ESI+308]
    OR      EAX,[ESI+312]
    OR      ECX,[ESI+316]
    JMP     caseend

    ALIGN   8
case79:
    MOV     EAX,[ESI+ 28]
    MOV     ECX,[ESI+ 64]
    MOV     EDX,[ESI+100]
    OR      EAX,[ESI+136]
    OR      ECX,[ESI+172]
    OR      EDX,[ESI+208]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+244]
    OR      EDX,[ESI+248]
    OR      EAX,[ESI+276]
    OR      ECX,[ESI+280]
    OR      EDX,[ESI+284]
    OR      EAX,[ESI+288]
    OR      ECX,[ESI+292]
    OR      EDX,[ESI+296]
    OR      EAX,[ESI+300]
    OR      ECX,[ESI+304]
    OR      EDX,[ESI+308]
    OR      EAX,[ESI+312]
    OR      ECX,[ESI+316]
    JMP     caseend

    ALIGN   8
case80:
    MOV     EAX,[ESI+ 32]
    MOV     ECX,[ESI+ 68]
    MOV     EDX,[ESI+104]
    OR      EAX,[ESI+140]
    OR      ECX,[ESI+176]
    OR      EDX,[ESI+212]
    OR      EAX,[ESI+240]
    OR      ECX,[ESI+244]
    OR      EDX,[ESI+248]
    OR      EAX,[ESI+276]
    OR      ECX,[ESI+280]
    OR      EDX,[ESI+284]
    OR      EAX,[ESI+288]
    OR      ECX,[ESI+292]
    OR      EDX,[ESI+296]
    OR      EAX,[ESI+300]
    OR      ECX,[ESI+304]
    OR      EDX,[ESI+308]
    OR      EAX,[ESI+312]
    OR      ECX,[ESI+316]
    OR      EAX,EDX
    OR      EAX,ECX
    XOR     EAX,0x1FF
    JZ      fin
    TEST    EDI,EDI
    JGE     skip80
    INC     EDI
    JMP     fin
skip80:
    MOV     [ESI+EBX*4],EAX
    CALL    callback
    MOV     DWORD [ESI+EBX*4],0
    JMP     fin
