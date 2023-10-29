#include <stdbool.h>
#include <stdio.h>
#include "rules.h"

char is[RULES_LEN];

int main()
{
    int i, bi, mi;
    char c, b[256];
    bool db;

    bi = 0;

    while((c = getchar()) != EOF)
    {
        mi = 0;

        for(i = 0; i < RULES_LEN; i++)
        {
            if(c == rules[i][1][is[i]])
            {
                is[i]++;

                if(is[i] > mi)
                    mi = is[i];
            }
            else
                is[i] = 0;
        }

        db = false;

        for(i = 0; i < RULES_LEN; i++)
        {
            if(rules[i][1][is[i]] != '\0')
                continue;

            if(mi <= is[i])
            {
                fputs(rules[i][0], stdout);

                bi = 0;
                db = true;

                break;
            }
            else
                is[i] = 0;
        }

        if(db)
            continue;

        b[bi++] = c;

        for(i = 0; i < bi - mi; i++)
            putchar(b[i]);

        for(i = 0; i < mi; i++)
            b[i] = b[i + bi - mi];

        bi = mi;
    }

    return 0;
}

