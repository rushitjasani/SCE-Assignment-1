awk 'NR>1 {{ s = $3 + $4 + $5 } print $1,s; }' marks.txt