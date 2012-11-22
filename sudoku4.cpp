/* sudoku4.cpp */
/* 方針: makeAsm()の利用 */

#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>

const int BoardSize = 9; /* 数独のサイズ */
const int BoardSizeSub = 3; /* = sqrt(BoardSize) */
typedef int FlagsType; /* long long にすれば、64x64までいける */
typedef int CountType; /* long long にすれば、9.2e+18まで数えられる */
const FlagsType MaskFlags = 0x1ff; /* == (1 << BoardSize) - 1 */
const CountType CountTypeMax = 0x7fffffff;

extern "C" {
    void count9Asm(class SolveSudoku *ss, int *board, int *pn);
    void storeResultAndTestLimit(class SolveSudoku *ss);
}

class Board {
public:
    unsigned char num[BoardSize][BoardSize];
    void print() const;
};

class SolveSudoku {
public:
    int init(const Board &quiz);
    void makeAsm();
    CountType solve(Board ans[], CountType limit, CountType offset);
    enum { ErrorInvalidBoard = 1, ErrorInvalidNumber };
protected:
    void storeResult();
    FlagsType checkCell(int i) const;
    void count(int i);
    int intLog2(int i) const;
    void initTable();
    inline static int index(int x, int y) { return y * BoardSize + x; }
    friend void storeResultAndTestLimit(SolveSudoku *ss);
    FlagsType board[BoardSize * BoardSize];
    int table[BoardSize * BoardSize][(BoardSize - 1) * 3 - (BoardSizeSub - 1) * 2];
    CountType n, nLimit; /* 答えを数える */
    Board *answer; /* 答えを格納する配列 */
    jmp_buf env; /* extern "C" な関数内では例外が使えないので、setjmp/longjmpに切り替え */
};

void Board::print() const
{
    for (int y = 0; y < BoardSize; y++) {
        for (int x = 0; x < BoardSize; x++)
            printf("%3d ", num[y][x]);
        printf("\n");
    }
}

int SolveSudoku::init(const Board &quiz)
{
    int i, num;
    initTable();
    for (i = 0; i < BoardSize * BoardSize; i++)
        board[i] = (FlagsType) 0;
    for (i = 0; i < BoardSize * BoardSize; i++) {
        FlagsType flags = (FlagsType) 0;
        num = quiz.num[i / BoardSize][i % BoardSize];
        if (num > 0) {
            if (num > BoardSize)
                return ErrorInvalidNumber;
            flags = ((FlagsType) 1) << (num - 1);
            if ((checkCell(i) & flags) != (FlagsType) 0)
                return ErrorInvalidBoard;
        }
        board[i] = flags;
    }
    return 0;
}

void SolveSudoku::initTable()
{
    char tmp[BoardSize * BoardSize];
    int i, j, k, x0, y0, x, y;
    for (i = 0; i < BoardSize * BoardSize; i++) {
        for (j = 0; j < BoardSize * BoardSize; j++)
            tmp[j] = 0;
        x0 = i % BoardSize;
        y0 = i / BoardSize;
        for (j = 0; j < BoardSize; j++)
            tmp[index(j, y0)] = tmp[index(x0, j)] = 1;
        x0 -= x0 % BoardSizeSub;
        y0 -= y0 % BoardSizeSub;
        for (y = 0; y < BoardSizeSub; y++) {
            for (x = 0; x < BoardSizeSub; x++)
                tmp[index(x0 + x, y0 + y)] = 1;
        }
        for (j = k = 0; j < BoardSize * BoardSize; j++) {
            if (tmp[j] != 0) {
                table[i][k] = j;
                k++;
            }
        }
    }
}

FlagsType SolveSudoku::checkCell(int i) const
{
    FlagsType flags = (FlagsType) 0;
    for (int j = 0; j < (BoardSize - 1) * 3 - (BoardSizeSub - 1) * 2; j++)
        flags |= board[table[i][j]];
    return flags;
}

void SolveSudoku::makeAsm()
{
    int i, j;
    initTable();
    printf(
        "[FORMAT \"WCOFF\"]\n"
        "[INSTRSET \"i486p\"]\n"
        "[FILE \"count9as.nas\"]\n"
        "[INSTRSET \"i486p\"]\n"
        "[BITS 32]\n"
        "\n"
        "[SECTION .data]\n"
        "    ALIGNB  4\n"
        "table:\n"
    );
    for (i = 0; i < 9; i++) {
        printf("    dd      ");
        for (j = 0; j < 9; j++) {
            printf("case%02d", i * 9 + j);
            if (j < 8)
                printf(",");
        }
        printf("\n");
    }
    printf(
        "\n"
        "[SECTION .text]\n"
        "    ALIGN   32\n"
        "    EXTERN  _storeResultAndTestLimit\n"
        "    GLOBAL  _count9Asm\n"
        "\n"
        "_count9Asm:\n"
        "    PUSH    EDI\n"
        "    PUSH    ESI\n"
        "    PUSH    EBP\n"
        "    PUSH    EBX\n"
        "    MOV     EAX,[ESP+20]\n"  /* ss */
        "    MOV     ESI,[ESP+24]\n"  /* board */
        "    MOV     EDX,[ESP+28]\n"  /* &n */
        "    PUSH    EDX\n"           /* [EBP+4] = &n */
        "    PUSH    EAX\n"           /* [EBP+0] = ss */
        "    MOV     EBP,ESP\n"
        "    XOR     EBX,EBX\n"
        "    MOV     EDI,[EDX]\n"
        "    CALL    subsub\n"
        "    POP     EAX\n"
        "    POP     EDX\n"
        "    MOV     [EDX],EDI\n"
        "    POP     EBX\n"
        "    POP     EBP\n"
        "    POP     ESI\n"
        "    POP     EDI\n"
        "    RET\n"
        "\n"
        "    ALIGN   32\n"
        "caseend:\n"
        "    OR      EAX,EDX\n"
        "    OR      EAX,ECX\n"
        "    XOR     EDX,EDX\n"
        "    XOR     EAX,0x1FF\n"
        "    JZ      fin\n"
        "    INC     EBX\n"
        "loop0:\n"
        "    SUB     EDX,EAX\n"
        "    PUSH    EAX\n"
        "    AND     EAX,EDX\n"
        "    MOV     [ESI+EBX*4-4],EAX\n"
        "    CALL    subsub\n"
        "    POP     EAX\n"
        "    XOR     EDX,EDX\n"
        "    XOR     EAX,[ESI+EBX*4-4]\n"
        "    JNZ     loop0\n"
        "    MOV     [ESI+EBX*4-4],EDX\n"
        "    DEC     EBX\n"
        "fin:\n"
        "    RET\n"
        "\n"
        "    ALIGN   8\n"
        "subsub:\n"
        "    CMP     EBX,81\n"
        "    JGE     skip0\n"
        "    CMP     DWORD [ESI+EBX*4],0\n"
        "    JNE     skip1\n"
        "    JMP     DWORD [table+EBX*4]\n"
        "skip1:\n"
        "    INC     EBX\n"
        "    CALL    subsub\n"
        "    DEC     EBX\n"
        "    JMP     fin\n"
        "skip0:\n"
        "    TEST    EDI,EDI\n"
        "    JGE     callback\n"
        "    INC     EDI\n"
        "    JMP     fin\n"
        "callback:\n"
        "    MOV     EDX,[EBP+4]\n"
        "    PUSH    DWORD [EBP+0]\n"
        "    MOV     [EDX],EDI\n"
        "    CALL    _storeResultAndTestLimit\n"
        "    INC     EDI\n"
        "    POP     EAX\n"
        "    JMP     fin\n"
    );

    for (i = 80; i >= 0; i--) { /* このように逆順にしたほうがほんの少し速かった */
        printf(
            "\n"
            "    ALIGN   8\n"
        );
        printf("case%02d:\n", i);
        printf("    MOV     EAX,[ESI+%3d]\n", table[i][0] * 4);
        printf("    MOV     ECX,[ESI+%3d]\n", table[i][1] * 4);
        printf("    MOV     EDX,[ESI+%3d]\n", table[i][2] * 4);
        for (j = 3; j < 18; j += 3) {
            printf("    OR      EAX,[ESI+%3d]\n", table[i][j + 0] * 4);
            printf("    OR      ECX,[ESI+%3d]\n", table[i][j + 1] * 4);
            printf("    OR      EDX,[ESI+%3d]\n", table[i][j + 2] * 4);
        }
        printf("    OR      EAX,[ESI+%3d]\n", table[i][18] * 4);
        printf("    OR      ECX,[ESI+%3d]\n", table[i][19] * 4);
        if (i < 80)
            printf("    JMP     caseend\n");
        else {
            printf(
                "    OR      EAX,EDX\n"
                "    OR      EAX,ECX\n"
                "    XOR     EAX,0x1FF\n"
                "    JZ      fin\n"
                "    TEST    EDI,EDI\n"
                "    JGE     skip80\n"
                "    INC     EDI\n"
                "    JMP     fin\n"
                "skip80:\n"
                "    MOV     [ESI+EBX*4],EAX\n"
                "    CALL    callback\n"
                "    MOV     DWORD [ESI+EBX*4],0\n"
                "    JMP     fin\n"
            );
        }
    }
}

void storeResultAndTestLimit(SolveSudoku *ss)
{
    if (ss->n >= (CountType) 0)
        ss->storeResult();
    ss->n++;
    if (ss->n >= ss->nLimit)
        longjmp(ss->env, 1);
}

CountType SolveSudoku::solve(Board ans[], CountType limit, CountType offset)
/* limit  == -1 は limit  = CountTypeMax の代用 */
/* offset == -1 は offset = CountTypeMax の代用 */
/* 普通の場合、ansは2つ分用意して、limit=2, offset=0 ... これで1が返ってくれば成功 */
/* 解の個数を数えるだけなら、limit=0, offset=-1, r=NULL でOK */
/* 返値 - offset == limit では終了 */
{
    if (limit  == (CountType) -1) limit  = CountTypeMax;
    if (offset == (CountType) -1) offset = CountTypeMax;
    n = - offset;
    nLimit = limit;
    answer = ans;
    if (setjmp(env) == 0) {
        if (BoardSize == 9)
            count9Asm(this, board, &n);
        else
            count(0);
    }
    return n + offset;
}

void SolveSudoku::count(int i)
/* ヒントとして探し始めの位置を教えてやる（そのほうが少し速い） */
{
    while (i < BoardSize * BoardSize && board[i] != (FlagsType) 0)
        i++;
    if (i >= BoardSize * BoardSize) { /* 空きがすべて埋まった！ */
        if (n >= (CountType) 0)
            storeResult();
        n++;
        if (n >= nLimit)
            longjmp(env, 1);
        return;
    }
    FlagsType flags = checkCell(i) ^ MaskFlags;
    if (flags != (FlagsType) 0) { /* 数字を置くことができる */
        if ((flags & (flags - 1)) == (FlagsType) 0) { /* 選択肢は一つしかない */
            board[i] = flags;
            count(i + 1); /* 再帰呼び出し */
        } else { /* 選択肢は複数ある */ 
            for (FlagsType j = (FlagsType) 1; j < MaskFlags; j <<= 1) {
                if ((flags & j) != (FlagsType) 0) {
                    board[i] = j;
                    count(i + 1); /* 再帰呼び出し */
                }
            }
        }
        board[i] = (FlagsType) 0;
    }
}

int SolveSudoku::intLog2(int i) const
{
    int n;
    for (n = 0; i > ((FlagsType) 1) << n; n++);
    return n;
}

void SolveSudoku::storeResult()
{
    for (int i = 0; i < BoardSize * BoardSize; i++)
        answer[n].num[i / BoardSize][i % BoardSize] = intLog2(board[i]) + 1;
}

int solver(const char *filepath, int offset)
/* 手抜き: limitは5固定, offsetも答えnもint固定 */
/* ファイル読み込み部が分かれていないのは、再利用する価値がないと考えているため */
{
    FILE *fp = fopen(filepath, "r");
    char buf[1024];
    int i, n, xy, num;
    const int Limit = 5;
    SolveSudoku ss;
    Board board, ans[5];

    /* ファイル読み込み部 */
    if (fp == NULL) {
        fprintf(stderr, "fopen error: %s\n", filepath);
        return 1;
    }
    i = fread(buf, 1, (sizeof buf) - 2, fp);
    fclose(fp);
    buf[i] = '\0';
    for (xy = i = 0; xy < BoardSize * BoardSize; i++) {
        num = -1;
        if (buf[i] == '\0') {
            fprintf(stderr, "load error: %s\n", filepath);
            return 1;
        }
        if (buf[i] == '\n') {
            if (xy % BoardSize != 0) {
                fprintf(stderr, "LF error: %s\n", filepath);
                return 1;
            }
            continue;
        }
        if (buf[i] == ' ') continue;
        if (buf[i] == '-' || buf[i] == '.') num = 0;
        if ('1' <= buf[i] && buf[i] <= '9') num = buf[i] - '0';
        if (num < 0) {
            fprintf(stderr, "charactor error: %s (buf[%d]=0x%02X)\n", filepath, i, buf[i]);
            return 1;
        }
        board.num[xy / BoardSize][xy % BoardSize] = num;
        xy++;
    }

    /* 問題を解いて結果を表示 */
    if (ss.init(board) != 0) {
        fprintf(stderr, "quiz error: %s\n", filepath);
        return 1;
    }
    if (offset < 0)
        offset = CountTypeMax - Limit;
    n = ss.solve(ans, Limit, offset);
    printf("n=%d%s (%.3f[sec])\n", n,
        (n < offset + Limit) ? "" : "(or over)", clock() / (double) CLOCKS_PER_SEC);
    for (i = offset; i < n; i++) {
        printf("\nans[%d]:\n", i);
        ans[i - offset].print();
    }
    return 0;
}

int main(int argc, const char **argv)
{
    if (argc == 2 && strcmp(argv[1], "makeAsm") == 0) {
        SolveSudoku ss;
        ss.makeAsm();
        return 0;
    }
    if (argc == 2) return solver(argv[1], 0);
    if (argc == 3) return solver(argv[1], strtol(argv[2], NULL, 0));
    fprintf(stderr, "usage>sudoku quiz-file [offset]\n");
    return 1;
}

//void count9Asm(class SolveSudoku *ss, int *board, int *pn) { }
