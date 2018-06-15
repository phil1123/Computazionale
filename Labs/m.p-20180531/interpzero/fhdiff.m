function df = fhdiff(f)

syms fsym(x);
eval(['fsym(x)=' func2str(f) ';'])
dfsym = diff(fsym);
eval(['df = @(x)' char(formula(dfsym)) ';'])
