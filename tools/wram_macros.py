"""Remplace les accès au tableau wram() par des macros PEEK/POKE (plus rapides).

  lecture   wram(x)          -> WR(x)
  écriture  wram(x) = v      -> WW(x, v)      (en position d'instruction)
  GetW(x) -> GW(x)   SetW(x, v) -> SW(x, v)   RoundHi(x) -> RH(x)

Boriel appelle une routine générique (__ARRAY, ~300 T) pour un indice
variable ; PEEK(@wram(0) + x) se compile en quelques instructions.
"""
import re
import sys

STMT_BEFORE = re.compile(r'(^|\bTHEN|\bELSE|:)\s*$', re.IGNORECASE)


def match_paren(s, i):
    """s[i] == '(' ; renvoie l'indice de la parenthèse fermante."""
    depth = 0
    for j in range(i, len(s)):
        if s[j] == '(':
            depth += 1
        elif s[j] == ')':
            depth -= 1
            if depth == 0:
                return j
    raise ValueError('parenthèses non équilibrées : ' + s)


def statement_end(s, i):
    """Fin de l'instruction commençant à i : ':' ou ' ELSE ' au niveau 0, ou fin de ligne."""
    depth = 0
    j = i
    in_str = False
    while j < len(s):
        c = s[j]
        if c == '"':
            in_str = not in_str
        elif not in_str:
            if c == '(':
                depth += 1
            elif c == ')':
                depth -= 1
            elif depth == 0 and c == ':':
                return j
            elif depth == 0 and c == "'":
                return j
            elif depth == 0 and re.match(r'\s+ELSE\b', s[j:], re.IGNORECASE):
                return j
        j += 1
    return len(s)


def convert_line(line):
    out = ''
    i = 0
    while True:
        m = re.search(r'\bwram\(', line[i:])
        if not m:
            out += line[i:]
            return out
        start = i + m.start()
        open_i = start + len('wram')
        close_i = match_paren(line, open_i)
        inner = line[open_i + 1:close_i]
        inner = convert_line(inner)
        after = line[close_i + 1:]
        am = re.match(r'\s*=(?!=)\s*', after)
        before = line[:start]
        if am and STMT_BEFORE.search(before):
            vstart = close_i + 1 + am.end()
            vend = statement_end(line, vstart)
            value = convert_line(line[vstart:vend].rstrip())
            trail = line[vstart:vend][len(line[vstart:vend].rstrip()):]
            out += line[i:start] + f'WW({inner}, {value})' + trail
            i = vend
        else:
            out += line[i:start] + f'WR({inner})'
            i = close_i + 1


def convert(text):
    lines = []
    for line in text.split('\n'):
        code, sep, comment = line, '', ''
        # ne pas toucher aux commentaires de fin de ligne
        k = None
        in_str = False
        for idx, ch in enumerate(line):
            if ch == '"':
                in_str = not in_str
            elif ch == "'" and not in_str:
                k = idx
                break
        if k is not None:
            code, comment = line[:k], line[k:]
        if code.strip().upper().startswith('DIM WRAM'):
            lines.append(line)
            continue
        code = convert_line(code)
        code = re.sub(r'\bGetW\(', 'GW(', code)
        code = re.sub(r'\bSetW\(', 'SW(', code)
        code = re.sub(r'\bRoundHi\(', 'RH(', code)
        lines.append(code + comment)
    return '\n'.join(lines)


if __name__ == '__main__':
    for path in sys.argv[1:]:
        src = open(path, encoding='utf-8').read()
        dst = convert(src)
        if dst != src:
            open(path, 'w', encoding='utf-8').write(dst)
            print('converti :', path)
