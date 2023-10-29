d = {}
ws = [' ', '\t', '\n']

with open("rules.h", "r") as f:
    for l in f:
        if l.startswith("    { \""):
            s = l.split("\", \"")
            d[s[0][7:]] = s[1][:-5]

with open("/usr/share/nvim/runtime/syntax/c.vim", "r") as f:
    c = ""

    for l in f:
        nl = l

        if "syn" in l:
            for x in d:
                if x == "case" and "keyword" not in l:
                    continue

                if x.startswith('#'):
                    nl = nl.replace(x[1:], d[x][1:])
                else:
                    for w1 in ws:
                        for w2 in ws:
                            nl = nl.replace("".join([w1, x, w2]), "".join([w1, d[x], w2]))

        c += nl

with open("syntax.vim", "w") as f:
    f.write(c)

