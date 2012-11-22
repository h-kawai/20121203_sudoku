/* sudoku2.cpp */
/* 方針: checkCell()とcount()のループを展開, count()で選択肢が一つの場合を特別扱いに */

#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>

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
    FlagsType checkCell(int i) const;
    void count(int i);
    int intLog2(int i) const;
    void initTable();
    inline static int index(int x, int y) { return y * BoardSize + x; }
    static const int ErrorCodeReachLimit = 1;
    FlagsType board[BoardSize * BoardSize];
    int table[BoardSize * BoardSize][(BoardSize - 1) * 3 - (BoardSizeSub - 1) * 2];
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
    if (BoardSize == 9) {
        /* (BoardSize - 1) * 3 - (BoardSizeSub - 1) * 2 == 20 なので全部展開してしまう */
        return board[table[i][ 0]] | board[table[i][ 1]] | board[table[i][ 2]] | board[table[i][ 3]] |
               board[table[i][ 4]] | board[table[i][ 5]] | board[table[i][ 6]] | board[table[i][ 7]] |
               board[table[i][ 8]] | board[table[i][ 9]] | board[table[i][10]] | board[table[i][11]] |
               board[table[i][12]] | board[table[i][13]] | board[table[i][14]] | board[table[i][15]] |
               board[table[i][16]] | board[table[i][17]] | board[table[i][18]] | board[table[i][19]];
    } else {
        FlagsType flags = (FlagsType) 0;
        for (int j = 0; j < (BoardSize - 1) * 3 - (BoardSizeSub - 1) * 2; j++)
            flags |= board[table[i][j]];
        return flags;
    }
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
        count(0);
    } catch (int e) {
        if (e != ErrorCodeReachLimit)
            throw e;
        /* ReachLimitの時はなにもしないで終了 */
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
            throw ErrorCodeReachLimit;
        return;
    }
    FlagsType flags = checkCell(i) ^ MaskFlags;
    if (flags != (FlagsType) 0) { /* 数字を置くことができる */
        if ((flags & (flags - 1)) == (FlagsType) 0) { /* 選択肢は一つしかない */
            board[i] = flags;
            count(i + 1); /* 再帰呼び出し */
        } else { /* 選択肢は複数ある */ 
            if (BoardSize == 9) {
                if (flags & 0x001) { board[i] = 0x001; count(i + 1); }
                if (flags & 0x002) { board[i] = 0x002; count(i + 1); }
                if (flags & 0x004) { board[i] = 0x004; count(i + 1); }
                if (flags & 0x008) { board[i] = 0x008; count(i + 1); }
                if (flags & 0x010) { board[i] = 0x010; count(i + 1); }
                if (flags & 0x020) { board[i] = 0x020; count(i + 1); }
                if (flags & 0x040) { board[i] = 0x040; count(i + 1); }
                if (flags & 0x080) { board[i] = 0x080; count(i + 1); }
                if (flags & 0x100) { board[i] = 0x100; count(i + 1); }
            } else {
                for (FlagsType j = (FlagsType) 1; j < MaskFlags; j <<= 1) {
                    if ((flags & j) != (FlagsType) 0) {
                        board[i] = j;
                        count(i + 1); /* 再帰呼び出し */
                    }
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
    if (argc == 2) return solver(argv[1], 0);
    if (argc == 3) return solver(argv[1], strtol(argv[2], NULL, 0));
    fprintf(stderr, "usage>sudoku quiz-file [offset]\n");
    return 1;
}
