/* sudoku0.cpp */
/* 方針: できるだけシンプルに少ない行数で書く */

#include <stdio.h>
#include <time.h>
#include <stdlib.h>

const int BoardSize = 9; /* 数独のサイズ */
const int BoardSizeSub = 3; /* = sqrt(BoardSize) */
typedef int FlagsType; /* long long にすれば、64x64までいける */
typedef int CountType; /* long long にすれば、9.2e+18まで数えられる */
const FlagsType MaskFlags = 0x1ff; /* == (1 << BoardSize) - 1 */
const CountType CountTypeMax = 0x7fffffff;

class Board {
public:
    unsigned char num[BoardSize][BoardSize];
    void print() const;
};

class SolveSudoku {
public:
    int init(const Board &quiz);
    CountType solve(Board ans[], CountType limit, CountType offset);
    enum { ErrorInvalidBoard = 1, ErrorInvalidNumber };
protected:
    void storeResult();
    FlagsType checkCell(int x0, int y0) const;
    void count(int x, int y);
    int intLog2(int i) const;
    static const int ErrorCodeReachLimit = 1;
    FlagsType board[BoardSize][BoardSize];
    CountType n, nLimit; /* 答えを数える */
    Board *answer; /* 答えを格納する配列 */
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
    for (int y = 0; y < BoardSize; y++) {
        for (int x = 0; x < BoardSize; x++)
            board[y][x] = (FlagsType) 0;
    }
    for (int y = 0; y < BoardSize; y++) {
        for (int x = 0; x < BoardSize; x++) {
            FlagsType flags = (FlagsType) 0;
            if (quiz.num[y][x] > 0) {
                if (quiz.num[y][x] > BoardSize)
                    return ErrorInvalidNumber;
                flags = ((FlagsType) 1) << (quiz.num[y][x] - 1);
                if ((checkCell(x, y) & flags) != (FlagsType) 0)
                    return ErrorInvalidBoard;
            }
            board[y][x] = flags;
        }
    }
    return 0;
}

FlagsType SolveSudoku::checkCell(int x0, int y0) const
{
    FlagsType flags = (FlagsType) 0;
    for (int i = 0; i < BoardSize; i++)
        flags |= board[y0][i] | board[i][x0];
    x0 -= x0 % BoardSizeSub;
    y0 -= y0 % BoardSizeSub;
    for (int y = 0; y < BoardSizeSub; y++) {
        for (int x = 0; x < BoardSizeSub; x++)
            flags |= board[y0 + y][x0 + x];
    }
    return flags;
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
    try {
        count(0, 0);
    } catch (int e) {
        if (e != ErrorCodeReachLimit)
            throw e;
        /* ReachLimitの時はなにもしないで終了 */
    }
    return n + offset;
}

void SolveSudoku::count(int x, int y)
/* ヒントとして探し始めの位置を教えてやる（そのほうが少し速い） */
{
    while (y < BoardSize && board[y][x] != (FlagsType) 0) {
        x++;
        if (x >= BoardSize) {
            x = 0;
            y++;
        }
    }
    if (y >= BoardSize) { /* 空きがすべて埋まった！ */
        if (n >= (CountType) 0)
            storeResult();
        n++;
        if (n >= nLimit)
            throw ErrorCodeReachLimit;
        return;
    }
    FlagsType flags = checkCell(x, y) ^ MaskFlags;
    if (flags != (FlagsType) 0) { /* 数字を置くことができる */
        for (FlagsType i = (FlagsType) 1; i < MaskFlags; i <<= 1) {
            if ((flags & i) != (FlagsType) 0) {
                board[y][x] = i;
                count(x, y); /* 再帰呼び出し */
            }
        }
        board[y][x] = (FlagsType) 0;
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
    for (int y = 0; y < BoardSize; y++) {
        for (int x = 0; x < BoardSize; x++)
            answer[n].num[y][x] = intLog2(board[y][x]) + 1;
    }
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
    if (argc == 2) return solver(argv[1], 0);
    if (argc == 3) return solver(argv[1], strtol(argv[2], NULL, 0));
    fprintf(stderr, "usage>sudoku quiz-file [offset]\n");
    return 1;
}

/*

solver()について、
>C++プログラマとしてはせめてsolverからファイル読み込みを独立させてBoardにloadメソッドぐらいにして欲しい…．
という指摘を受けて、改善例も示してもらいました。しかし私としては151行目の理由により、これをこのままにしておきます。

*/
