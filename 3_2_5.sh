awk '
    BEGIN{
        print "​***Grade Report for the ABC course ***​"
        min=100
    }
    NR > 1{
    sum += $3 + $4 + $5
    tsum = $3 + $4 + $5
    if(tsum > max){max=tsum;} 
    if(tsum < min){min=tsum;}
    if(tsum < 60 ){print $1, "F"} 
    else if(tsum < 70 ){print $1, "D"}
    else if(tsum < 75 ){print $1, "C-"}
    else if(tsum < 80 ){print $1, "C"}
    else if(tsum < 85 ){print $1, "B-"}
    else if(tsum < 90 ){print $1, "B"}
    else if(tsum < 95 ){print $1, "A-"}
    else{print $1, A}
}
END{
    {avg = sum / (NR-1)}
    print "Num of Students :", NR-1
    print "Highest Mark \t:", max
    print "Lowest Mark \t:", min
    print "Average \t:", avg
    print "***End of Grade Report ***"
    
}' marks.txt