awk 'NR > 1{
    sum += $3 + $4 + $5
    tsum = $3 + $4 + $5
    if(tsum > max){
        max=tsum;
        topper=$1
    } 
    map[$1] = tsum;
}
END{
    print topper " is topper "
    print "above avg is : "
    {avg = sum / (NR-1)}
    for (l in map)
    {
        if ( map[l] >= avg )
        {
            print l
        }
    }
}' marks.txt