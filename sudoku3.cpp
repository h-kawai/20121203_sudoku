/* sudoku3.cpp */
/* 方針: makeCheckCell()の利用 */

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
    void makeCheckCell();
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
        switch (i) {
        case  0:
            return  board[ 0] | board[ 1] | board[ 2] | board[ 3] | board[ 4] |
                    board[ 5] | board[ 6] | board[ 7] | board[ 8] | board[ 9] |
                    board[10] | board[11] | board[18] | board[19] | board[20] |
                    board[27] | board[36] | board[45] | board[54] | board[63];

        case  1:
            return  board[ 0] | board[ 1] | board[ 2] | board[ 3] | board[ 4] |
                    board[ 5] | board[ 6] | board[ 7] | board[ 8] | board[ 9] |
                    board[10] | board[11] | board[18] | board[19] | board[20] |
                    board[28] | board[37] | board[46] | board[55] | board[64];

        case  2:
            return  board[ 0] | board[ 1] | board[ 2] | board[ 3] | board[ 4] |
                    board[ 5] | board[ 6] | board[ 7] | board[ 8] | board[ 9] |
                    board[10] | board[11] | board[18] | board[19] | board[20] |
                    board[29] | board[38] | board[47] | board[56] | board[65];

        case  3:
            return  board[ 0] | board[ 1] | board[ 2] | board[ 3] | board[ 4] |
                    board[ 5] | board[ 6] | board[ 7] | board[ 8] | board[12] |
                    board[13] | board[14] | board[21] | board[22] | board[23] |
                    board[30] | board[39] | board[48] | board[57] | board[66];

        case  4:
            return  board[ 0] | board[ 1] | board[ 2] | board[ 3] | board[ 4] |
                    board[ 5] | board[ 6] | board[ 7] | board[ 8] | board[12] |
                    board[13] | board[14] | board[21] | board[22] | board[23] |
                    board[31] | board[40] | board[49] | board[58] | board[67];

        case  5:
            return  board[ 0] | board[ 1] | board[ 2] | board[ 3] | board[ 4] |
                    board[ 5] | board[ 6] | board[ 7] | board[ 8] | board[12] |
                    board[13] | board[14] | board[21] | board[22] | board[23] |
                    board[32] | board[41] | board[50] | board[59] | board[68];

        case  6:
            return  board[ 0] | board[ 1] | board[ 2] | board[ 3] | board[ 4] |
                    board[ 5] | board[ 6] | board[ 7] | board[ 8] | board[15] |
                    board[16] | board[17] | board[24] | board[25] | board[26] |
                    board[33] | board[42] | board[51] | board[60] | board[69];

        case  7:
            return  board[ 0] | board[ 1] | board[ 2] | board[ 3] | board[ 4] |
                    board[ 5] | board[ 6] | board[ 7] | board[ 8] | board[15] |
                    board[16] | board[17] | board[24] | board[25] | board[26] |
                    board[34] | board[43] | board[52] | board[61] | board[70];

        case  8:
            return  board[ 0] | board[ 1] | board[ 2] | board[ 3] | board[ 4] |
                    board[ 5] | board[ 6] | board[ 7] | board[ 8] | board[15] |
                    board[16] | board[17] | board[24] | board[25] | board[26] |
                    board[35] | board[44] | board[53] | board[62] | board[71];

        case  9:
            return  board[ 0] | board[ 1] | board[ 2] | board[ 9] | board[10] |
                    board[11] | board[12] | board[13] | board[14] | board[15] |
                    board[16] | board[17] | board[18] | board[19] | board[20] |
                    board[27] | board[36] | board[45] | board[54] | board[63];

        case 10:
            return  board[ 0] | board[ 1] | board[ 2] | board[ 9] | board[10] |
                    board[11] | board[12] | board[13] | board[14] | board[15] |
                    board[16] | board[17] | board[18] | board[19] | board[20] |
                    board[28] | board[37] | board[46] | board[55] | board[64];

        case 11:
            return  board[ 0] | board[ 1] | board[ 2] | board[ 9] | board[10] |
                    board[11] | board[12] | board[13] | board[14] | board[15] |
                    board[16] | board[17] | board[18] | board[19] | board[20] |
                    board[29] | board[38] | board[47] | board[56] | board[65];

        case 12:
            return  board[ 3] | board[ 4] | board[ 5] | board[ 9] | board[10] |
                    board[11] | board[12] | board[13] | board[14] | board[15] |
                    board[16] | board[17] | board[21] | board[22] | board[23] |
                    board[30] | board[39] | board[48] | board[57] | board[66];

        case 13:
            return  board[ 3] | board[ 4] | board[ 5] | board[ 9] | board[10] |
                    board[11] | board[12] | board[13] | board[14] | board[15] |
                    board[16] | board[17] | board[21] | board[22] | board[23] |
                    board[31] | board[40] | board[49] | board[58] | board[67];

        case 14:
            return  board[ 3] | board[ 4] | board[ 5] | board[ 9] | board[10] |
                    board[11] | board[12] | board[13] | board[14] | board[15] |
                    board[16] | board[17] | board[21] | board[22] | board[23] |
                    board[32] | board[41] | board[50] | board[59] | board[68];

        case 15:
            return  board[ 6] | board[ 7] | board[ 8] | board[ 9] | board[10] |
                    board[11] | board[12] | board[13] | board[14] | board[15] |
                    board[16] | board[17] | board[24] | board[25] | board[26] |
                    board[33] | board[42] | board[51] | board[60] | board[69];

        case 16:
            return  board[ 6] | board[ 7] | board[ 8] | board[ 9] | board[10] |
                    board[11] | board[12] | board[13] | board[14] | board[15] |
                    board[16] | board[17] | board[24] | board[25] | board[26] |
                    board[34] | board[43] | board[52] | board[61] | board[70];

        case 17:
            return  board[ 6] | board[ 7] | board[ 8] | board[ 9] | board[10] |
                    board[11] | board[12] | board[13] | board[14] | board[15] |
                    board[16] | board[17] | board[24] | board[25] | board[26] |
                    board[35] | board[44] | board[53] | board[62] | board[71];

        case 18:
            return  board[ 0] | board[ 1] | board[ 2] | board[ 9] | board[10] |
                    board[11] | board[18] | board[19] | board[20] | board[21] |
                    board[22] | board[23] | board[24] | board[25] | board[26] |
                    board[27] | board[36] | board[45] | board[54] | board[63];

        case 19:
            return  board[ 0] | board[ 1] | board[ 2] | board[ 9] | board[10] |
                    board[11] | board[18] | board[19] | board[20] | board[21] |
                    board[22] | board[23] | board[24] | board[25] | board[26] |
                    board[28] | board[37] | board[46] | board[55] | board[64];

        case 20:
            return  board[ 0] | board[ 1] | board[ 2] | board[ 9] | board[10] |
                    board[11] | board[18] | board[19] | board[20] | board[21] |
                    board[22] | board[23] | board[24] | board[25] | board[26] |
                    board[29] | board[38] | board[47] | board[56] | board[65];

        case 21:
            return  board[ 3] | board[ 4] | board[ 5] | board[12] | board[13] |
                    board[14] | board[18] | board[19] | board[20] | board[21] |
                    board[22] | board[23] | board[24] | board[25] | board[26] |
                    board[30] | board[39] | board[48] | board[57] | board[66];

        case 22:
            return  board[ 3] | board[ 4] | board[ 5] | board[12] | board[13] |
                    board[14] | board[18] | board[19] | board[20] | board[21] |
                    board[22] | board[23] | board[24] | board[25] | board[26] |
                    board[31] | board[40] | board[49] | board[58] | board[67];

        case 23:
            return  board[ 3] | board[ 4] | board[ 5] | board[12] | board[13] |
                    board[14] | board[18] | board[19] | board[20] | board[21] |
                    board[22] | board[23] | board[24] | board[25] | board[26] |
                    board[32] | board[41] | board[50] | board[59] | board[68];

        case 24:
            return  board[ 6] | board[ 7] | board[ 8] | board[15] | board[16] |
                    board[17] | board[18] | board[19] | board[20] | board[21] |
                    board[22] | board[23] | board[24] | board[25] | board[26] |
                    board[33] | board[42] | board[51] | board[60] | board[69];

        case 25:
            return  board[ 6] | board[ 7] | board[ 8] | board[15] | board[16] |
                    board[17] | board[18] | board[19] | board[20] | board[21] |
                    board[22] | board[23] | board[24] | board[25] | board[26] |
                    board[34] | board[43] | board[52] | board[61] | board[70];

        case 26:
            return  board[ 6] | board[ 7] | board[ 8] | board[15] | board[16] |
                    board[17] | board[18] | board[19] | board[20] | board[21] |
                    board[22] | board[23] | board[24] | board[25] | board[26] |
                    board[35] | board[44] | board[53] | board[62] | board[71];

        case 27:
            return  board[ 0] | board[ 9] | board[18] | board[27] | board[28] |
                    board[29] | board[30] | board[31] | board[32] | board[33] |
                    board[34] | board[35] | board[36] | board[37] | board[38] |
                    board[45] | board[46] | board[47] | board[54] | board[63];

        case 28:
            return  board[ 1] | board[10] | board[19] | board[27] | board[28] |
                    board[29] | board[30] | board[31] | board[32] | board[33] |
                    board[34] | board[35] | board[36] | board[37] | board[38] |
                    board[45] | board[46] | board[47] | board[55] | board[64];

        case 29:
            return  board[ 2] | board[11] | board[20] | board[27] | board[28] |
                    board[29] | board[30] | board[31] | board[32] | board[33] |
                    board[34] | board[35] | board[36] | board[37] | board[38] |
                    board[45] | board[46] | board[47] | board[56] | board[65];

        case 30:
            return  board[ 3] | board[12] | board[21] | board[27] | board[28] |
                    board[29] | board[30] | board[31] | board[32] | board[33] |
                    board[34] | board[35] | board[39] | board[40] | board[41] |
                    board[48] | board[49] | board[50] | board[57] | board[66];

        case 31:
            return  board[ 4] | board[13] | board[22] | board[27] | board[28] |
                    board[29] | board[30] | board[31] | board[32] | board[33] |
                    board[34] | board[35] | board[39] | board[40] | board[41] |
                    board[48] | board[49] | board[50] | board[58] | board[67];

        case 32:
            return  board[ 5] | board[14] | board[23] | board[27] | board[28] |
                    board[29] | board[30] | board[31] | board[32] | board[33] |
                    board[34] | board[35] | board[39] | board[40] | board[41] |
                    board[48] | board[49] | board[50] | board[59] | board[68];

        case 33:
            return  board[ 6] | board[15] | board[24] | board[27] | board[28] |
                    board[29] | board[30] | board[31] | board[32] | board[33] |
                    board[34] | board[35] | board[42] | board[43] | board[44] |
                    board[51] | board[52] | board[53] | board[60] | board[69];

        case 34:
            return  board[ 7] | board[16] | board[25] | board[27] | board[28] |
                    board[29] | board[30] | board[31] | board[32] | board[33] |
                    board[34] | board[35] | board[42] | board[43] | board[44] |
                    board[51] | board[52] | board[53] | board[61] | board[70];

        case 35:
            return  board[ 8] | board[17] | board[26] | board[27] | board[28] |
                    board[29] | board[30] | board[31] | board[32] | board[33] |
                    board[34] | board[35] | board[42] | board[43] | board[44] |
                    board[51] | board[52] | board[53] | board[62] | board[71];

        case 36:
            return  board[ 0] | board[ 9] | board[18] | board[27] | board[28] |
                    board[29] | board[36] | board[37] | board[38] | board[39] |
                    board[40] | board[41] | board[42] | board[43] | board[44] |
                    board[45] | board[46] | board[47] | board[54] | board[63];

        case 37:
            return  board[ 1] | board[10] | board[19] | board[27] | board[28] |
                    board[29] | board[36] | board[37] | board[38] | board[39] |
                    board[40] | board[41] | board[42] | board[43] | board[44] |
                    board[45] | board[46] | board[47] | board[55] | board[64];

        case 38:
            return  board[ 2] | board[11] | board[20] | board[27] | board[28] |
                    board[29] | board[36] | board[37] | board[38] | board[39] |
                    board[40] | board[41] | board[42] | board[43] | board[44] |
                    board[45] | board[46] | board[47] | board[56] | board[65];

        case 39:
            return  board[ 3] | board[12] | board[21] | board[30] | board[31] |
                    board[32] | board[36] | board[37] | board[38] | board[39] |
                    board[40] | board[41] | board[42] | board[43] | board[44] |
                    board[48] | board[49] | board[50] | board[57] | board[66];

        case 40:
            return  board[ 4] | board[13] | board[22] | board[30] | board[31] |
                    board[32] | board[36] | board[37] | board[38] | board[39] |
                    board[40] | board[41] | board[42] | board[43] | board[44] |
                    board[48] | board[49] | board[50] | board[58] | board[67];

        case 41:
            return  board[ 5] | board[14] | board[23] | board[30] | board[31] |
                    board[32] | board[36] | board[37] | board[38] | board[39] |
                    board[40] | board[41] | board[42] | board[43] | board[44] |
                    board[48] | board[49] | board[50] | board[59] | board[68];

        case 42:
            return  board[ 6] | board[15] | board[24] | board[33] | board[34] |
                    board[35] | board[36] | board[37] | board[38] | board[39] |
                    board[40] | board[41] | board[42] | board[43] | board[44] |
                    board[51] | board[52] | board[53] | board[60] | board[69];

        case 43:
            return  board[ 7] | board[16] | board[25] | board[33] | board[34] |
                    board[35] | board[36] | board[37] | board[38] | board[39] |
                    board[40] | board[41] | board[42] | board[43] | board[44] |
                    board[51] | board[52] | board[53] | board[61] | board[70];

        case 44:
            return  board[ 8] | board[17] | board[26] | board[33] | board[34] |
                    board[35] | board[36] | board[37] | board[38] | board[39] |
                    board[40] | board[41] | board[42] | board[43] | board[44] |
                    board[51] | board[52] | board[53] | board[62] | board[71];

        case 45:
            return  board[ 0] | board[ 9] | board[18] | board[27] | board[28] |
                    board[29] | board[36] | board[37] | board[38] | board[45] |
                    board[46] | board[47] | board[48] | board[49] | board[50] |
                    board[51] | board[52] | board[53] | board[54] | board[63];

        case 46:
            return  board[ 1] | board[10] | board[19] | board[27] | board[28] |
                    board[29] | board[36] | board[37] | board[38] | board[45] |
                    board[46] | board[47] | board[48] | board[49] | board[50] |
                    board[51] | board[52] | board[53] | board[55] | board[64];

        case 47:
            return  board[ 2] | board[11] | board[20] | board[27] | board[28] |
                    board[29] | board[36] | board[37] | board[38] | board[45] |
                    board[46] | board[47] | board[48] | board[49] | board[50] |
                    board[51] | board[52] | board[53] | board[56] | board[65];

        case 48:
            return  board[ 3] | board[12] | board[21] | board[30] | board[31] |
                    board[32] | board[39] | board[40] | board[41] | board[45] |
                    board[46] | board[47] | board[48] | board[49] | board[50] |
                    board[51] | board[52] | board[53] | board[57] | board[66];

        case 49:
            return  board[ 4] | board[13] | board[22] | board[30] | board[31] |
                    board[32] | board[39] | board[40] | board[41] | board[45] |
                    board[46] | board[47] | board[48] | board[49] | board[50] |
                    board[51] | board[52] | board[53] | board[58] | board[67];

        case 50:
            return  board[ 5] | board[14] | board[23] | board[30] | board[31] |
                    board[32] | board[39] | board[40] | board[41] | board[45] |
                    board[46] | board[47] | board[48] | board[49] | board[50] |
                    board[51] | board[52] | board[53] | board[59] | board[68];

        case 51:
            return  board[ 6] | board[15] | board[24] | board[33] | board[34] |
                    board[35] | board[42] | board[43] | board[44] | board[45] |
                    board[46] | board[47] | board[48] | board[49] | board[50] |
                    board[51] | board[52] | board[53] | board[60] | board[69];

        case 52:
            return  board[ 7] | board[16] | board[25] | board[33] | board[34] |
                    board[35] | board[42] | board[43] | board[44] | board[45] |
                    board[46] | board[47] | board[48] | board[49] | board[50] |
                    board[51] | board[52] | board[53] | board[61] | board[70];

        case 53:
            return  board[ 8] | board[17] | board[26] | board[33] | board[34] |
                    board[35] | board[42] | board[43] | board[44] | board[45] |
                    board[46] | board[47] | board[48] | board[49] | board[50] |
                    board[51] | board[52] | board[53] | board[62] | board[71];

        case 54:
            return  board[ 0] | board[ 9] | board[18] | board[27] | board[36] |
                    board[45] | board[54] | board[55] | board[56] | board[57] |
                    board[58] | board[59] | board[60] | board[61] | board[62] |
                    board[63] | board[64] | board[65] | board[72] | board[73];

        case 55:
            return  board[ 1] | board[10] | board[19] | board[28] | board[37] |
                    board[46] | board[54] | board[55] | board[56] | board[57] |
                    board[58] | board[59] | board[60] | board[61] | board[62] |
                    board[63] | board[64] | board[65] | board[72] | board[73];

        case 56:
            return  board[ 2] | board[11] | board[20] | board[29] | board[38] |
                    board[47] | board[54] | board[55] | board[56] | board[57] |
                    board[58] | board[59] | board[60] | board[61] | board[62] |
                    board[63] | board[64] | board[65] | board[72] | board[73];

        case 57:
            return  board[ 3] | board[12] | board[21] | board[30] | board[39] |
                    board[48] | board[54] | board[55] | board[56] | board[57] |
                    board[58] | board[59] | board[60] | board[61] | board[62] |
                    board[66] | board[67] | board[68] | board[75] | board[76];

        case 58:
            return  board[ 4] | board[13] | board[22] | board[31] | board[40] |
                    board[49] | board[54] | board[55] | board[56] | board[57] |
                    board[58] | board[59] | board[60] | board[61] | board[62] |
                    board[66] | board[67] | board[68] | board[75] | board[76];

        case 59:
            return  board[ 5] | board[14] | board[23] | board[32] | board[41] |
                    board[50] | board[54] | board[55] | board[56] | board[57] |
                    board[58] | board[59] | board[60] | board[61] | board[62] |
                    board[66] | board[67] | board[68] | board[75] | board[76];

        case 60:
            return  board[ 6] | board[15] | board[24] | board[33] | board[42] |
                    board[51] | board[54] | board[55] | board[56] | board[57] |
                    board[58] | board[59] | board[60] | board[61] | board[62] |
                    board[69] | board[70] | board[71] | board[78] | board[79];

        case 61:
            return  board[ 7] | board[16] | board[25] | board[34] | board[43] |
                    board[52] | board[54] | board[55] | board[56] | board[57] |
                    board[58] | board[59] | board[60] | board[61] | board[62] |
                    board[69] | board[70] | board[71] | board[78] | board[79];

        case 62:
            return  board[ 8] | board[17] | board[26] | board[35] | board[44] |
                    board[53] | board[54] | board[55] | board[56] | board[57] |
                    board[58] | board[59] | board[60] | board[61] | board[62] |
                    board[69] | board[70] | board[71] | board[78] | board[79];

        case 63:
            return  board[ 0] | board[ 9] | board[18] | board[27] | board[36] |
                    board[45] | board[54] | board[55] | board[56] | board[63] |
                    board[64] | board[65] | board[66] | board[67] | board[68] |
                    board[69] | board[70] | board[71] | board[72] | board[73];

        case 64:
            return  board[ 1] | board[10] | board[19] | board[28] | board[37] |
                    board[46] | board[54] | board[55] | board[56] | board[63] |
                    board[64] | board[65] | board[66] | board[67] | board[68] |
                    board[69] | board[70] | board[71] | board[72] | board[73];

        case 65:
            return  board[ 2] | board[11] | board[20] | board[29] | board[38] |
                    board[47] | board[54] | board[55] | board[56] | board[63] |
                    board[64] | board[65] | board[66] | board[67] | board[68] |
                    board[69] | board[70] | board[71] | board[72] | board[73];

        case 66:
            return  board[ 3] | board[12] | board[21] | board[30] | board[39] |
                    board[48] | board[57] | board[58] | board[59] | board[63] |
                    board[64] | board[65] | board[66] | board[67] | board[68] |
                    board[69] | board[70] | board[71] | board[75] | board[76];

        case 67:
            return  board[ 4] | board[13] | board[22] | board[31] | board[40] |
                    board[49] | board[57] | board[58] | board[59] | board[63] |
                    board[64] | board[65] | board[66] | board[67] | board[68] |
                    board[69] | board[70] | board[71] | board[75] | board[76];

        case 68:
            return  board[ 5] | board[14] | board[23] | board[32] | board[41] |
                    board[50] | board[57] | board[58] | board[59] | board[63] |
                    board[64] | board[65] | board[66] | board[67] | board[68] |
                    board[69] | board[70] | board[71] | board[75] | board[76];

        case 69:
            return  board[ 6] | board[15] | board[24] | board[33] | board[42] |
                    board[51] | board[60] | board[61] | board[62] | board[63] |
                    board[64] | board[65] | board[66] | board[67] | board[68] |
                    board[69] | board[70] | board[71] | board[78] | board[79];

        case 70:
            return  board[ 7] | board[16] | board[25] | board[34] | board[43] |
                    board[52] | board[60] | board[61] | board[62] | board[63] |
                    board[64] | board[65] | board[66] | board[67] | board[68] |
                    board[69] | board[70] | board[71] | board[78] | board[79];

        case 71:
            return  board[ 8] | board[17] | board[26] | board[35] | board[44] |
                    board[53] | board[60] | board[61] | board[62] | board[63] |
                    board[64] | board[65] | board[66] | board[67] | board[68] |
                    board[69] | board[70] | board[71] | board[78] | board[79];

        case 72:
            return  board[ 0] | board[ 9] | board[18] | board[27] | board[36] |
                    board[45] | board[54] | board[55] | board[56] | board[63] |
                    board[64] | board[65] | board[72] | board[73] | board[74] |
                    board[75] | board[76] | board[77] | board[78] | board[79];

        case 73:
            return  board[ 1] | board[10] | board[19] | board[28] | board[37] |
                    board[46] | board[54] | board[55] | board[56] | board[63] |
                    board[64] | board[65] | board[72] | board[73] | board[74] |
                    board[75] | board[76] | board[77] | board[78] | board[79];

        case 74:
            return  board[ 2] | board[11] | board[20] | board[29] | board[38] |
                    board[47] | board[54] | board[55] | board[56] | board[63] |
                    board[64] | board[65] | board[72] | board[73] | board[74] |
                    board[75] | board[76] | board[77] | board[78] | board[79];

        case 75:
            return  board[ 3] | board[12] | board[21] | board[30] | board[39] |
                    board[48] | board[57] | board[58] | board[59] | board[66] |
                    board[67] | board[68] | board[72] | board[73] | board[74] |
                    board[75] | board[76] | board[77] | board[78] | board[79];

        case 76:
            return  board[ 4] | board[13] | board[22] | board[31] | board[40] |
                    board[49] | board[57] | board[58] | board[59] | board[66] |
                    board[67] | board[68] | board[72] | board[73] | board[74] |
                    board[75] | board[76] | board[77] | board[78] | board[79];

        case 77:
            return  board[ 5] | board[14] | board[23] | board[32] | board[41] |
                    board[50] | board[57] | board[58] | board[59] | board[66] |
                    board[67] | board[68] | board[72] | board[73] | board[74] |
                    board[75] | board[76] | board[77] | board[78] | board[79];

        case 78:
            return  board[ 6] | board[15] | board[24] | board[33] | board[42] |
                    board[51] | board[60] | board[61] | board[62] | board[69] |
                    board[70] | board[71] | board[72] | board[73] | board[74] |
                    board[75] | board[76] | board[77] | board[78] | board[79];

        case 79:
            return  board[ 7] | board[16] | board[25] | board[34] | board[43] |
                    board[52] | board[60] | board[61] | board[62] | board[69] |
                    board[70] | board[71] | board[72] | board[73] | board[74] |
                    board[75] | board[76] | board[77] | board[78] | board[79];

        case 80:
            return  board[ 8] | board[17] | board[26] | board[35] | board[44] |
                    board[53] | board[60] | board[61] | board[62] | board[69] |
                    board[70] | board[71] | board[72] | board[73] | board[74] |
                    board[75] | board[76] | board[77] | board[78] | board[79];

        }
        return 0; /* duumy */
    } else {
        FlagsType flags = (FlagsType) 0;
        for (int j = 0; j < (BoardSize - 1) * 3 - (BoardSizeSub - 1) * 2; j++)
            flags |= board[table[i][j]];
        return flags;
    }
}

void SolveSudoku::makeCheckCell()
{
    initTable();
    printf("FlagsType SolveSudoku::checkCell(int i) const\n");
    printf("{\n");
    printf("    if (BoardSize == 9) {\n");
    printf("        switch (i) {\n");
    for (int i = 0; i < 81; i++) {
        printf("        case %2d:\n", i);
        printf("            return  ");
        for (int j = 0; j < 4; j++) {
            if (j > 0)
                printf("                    ");
            for (int k = 0; k < 5; k++) {
                printf("board[%2d]", table[i][j * 5 + k]);
                if (k < 4)
                    printf(" | ");
            }
            if (j < 3)
                printf(" |\n");
        }
        printf(";\n\n");
    }
    printf("        }\n");
    printf("        return 0; /* duumy */\n");
    printf("    } else {\n");
    printf("        FlagsType flags = (FlagsType) 0;\n");
    printf("        for (int j = 0; j < (BoardSize - 1) * 3 - (BoardSizeSub - 1) * 2; j++)\n");
    printf("            flags |= board[table[i][j]];\n");
    printf("        return flags;\n");
    printf("    }\n");
    printf("}\n");
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
    if (argc == 2 && strcmp(argv[1], "makeCheckCell") == 0) {
        SolveSudoku ss;
        ss.makeCheckCell();
        return 0;
    }
    if (argc == 2) return solver(argv[1], 0);
    if (argc == 3) return solver(argv[1], strtol(argv[2], NULL, 0));
    fprintf(stderr, "usage>sudoku quiz-file [offset]\n");
    return 1;
}
