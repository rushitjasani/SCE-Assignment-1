awk '
    BEGIN{print "[";j=0;}
    {   
        for(i=2;i<NF-1;i++){m_name=m_name" "$i}
        yr=substr($(NF-1),2,length($(NF-1))-2)
        id=substr($1,1,length($1)-1)
        if(NR>1)print ","
        print "\t{"
        print "\t\t\"ID\" : " "\""id"\","
        print "\t\t\"Name\" : " "\""m_name"\","
        print "\t\t\"Year\" : " "\""yr"\","
        print "\t\t\"Rating\" : " "\""$NF"\""
        print "\t}"
        m_name=""
    }
    END{print "]"}
' imdb-top-250.txt