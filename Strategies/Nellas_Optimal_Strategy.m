function choice = OptimumStrategy(myscore,yourscore,turnscore)

choice=0;

i=myscore;
j=yourscore;
k=turnscore;

if i+k>=100
    choice =0;
    return
end

if  (i^2/80^2+j^2/84^2)>=1
    choice =1;
    return
end

%%%% do these following values for i also need to be in a range????

if i>=69 
    if k<=10
        choice = 1;
        return
    end
    return
end



if i>=65 
    if k<=12
        choice =1;
        return
    end
    return
end



if i>=60  
    if k<=17
        choice =1;
        return
    end
    return
end

%%%%%%%%%%


if i>=56 
    if j<=19 && k<=17
        choice =1;
        return
    end
    if 19<j && j<=43 && k<=19
        choice =1;
        return
    end
    if 43<j && j<=57 && k<=17
        choice = 1;
        return
    end
    if j>57 && k<=19
        choice=1;
        return
    end
    return
end



if i>=51
    if j<=5 && k<=14
        choice=1;
        return
    end
    if 5<j && j<=29 && k<=17
        choice=1;
        return
    end
    if 29<j && j<=46 && k<=20
        choice=1;
        return
    end
    if 46<j && j<=59 && k<=19
        choice=1;
        return
    end
    if j>59 && k<=22
        choice=1;
        return
    end
    return
end



if i>=43
    if j<=19 && k<=16
        choice=1;
        return
    end
    if 19<j && j<=42 && k<=19
        choice=1;
        return
    end
    if 42<j && j<=54 && k<=24
        choice=1;
        return
    end
    if 54<j && j<=63 && k<=21
        choice=1;
        return
    end
    if j>63 && k<=26
        choice=1;
        return
    end
    return
end



if i>=37 
    if j<=24 && k<=18
        choice=1;
        return
    end
    if 24<j && j<=36 && k<=20
        choice=1;
        return
    end
    if 36<j && j<=49 && k<=22
        choice=1;
        return
    end
    if 49<j && j<=57 && k<=25
        choice=1;
        return
    end
    if 57<j && j<=67 && k<=25
        choice=1;
        return
    end
    if j>67 && k<=29
        choice=1;
        return
    end
    return
end



if i>=30
    if j<=11 && k<=18
        choice=1;
        return
    end
    if 11<j && j<=30 && k<=20
        choice=1;
        return
    end
    if 30<j && j<=44 && k<=21
        choice=1;
        return
    end
    if 44<j && j<=57 && k<=25
        choice=1;
        return
    end
    if 57<j && j<=64 && k<=26
        choice=1;
        return
    end
    if j>64 && k<=29
        choice=1;
        return
    end
    return
end



if i>=22
    if j<=13 && k<=19
        choice=1;
        return
    end
    if 13<j && j<=25 && k<=21
        choice=1;
        return
    end
    if 25<j && j<=37 && k<=22
        choice=1;
        return
    end
    if 37<j && j<=52 && k<=24
        choice=1;
        return
    end
    if 52<j && j<=65 && k<=28
        choice=1;
        return
    end
    if 65<j && j<=69 && k<=25
        choice=1;
        return
    end
    if j>69 && k<=35
        choice=1;
        return
    end
    return
end



if i>=13
    if j<=9 && k<=20
        choice=1;
        return
    end
    if 9<j && j<=28 && k<=21
        choice=1;
        return
    end
    if 28<j && j<=49 && k<=24
        choice=1;
        return
    end
    if 49<j && j<=58 && k<=28
        choice=1;
        return
    end
    if 58<j && j<=69 && k<=32
        choice=1;
        return
    end
    if 69<j && j<=73 && k<=25
        choice=1;
        return
    end
    if j>73 && k<=41
        choice=1;
        return
    end
    return
end



if i>=7
    if j<=22 && k<=21
        choice=1;
        return
    end
    if 22<j && j<=41 && k<=24
        choice=1;
        return
    end
    if 41<j && j<=54 && k<=27
        choice=1;
        return
    end
    if 54<j && j<=62 && k<=31
        choice=1;
        return
    end
    if 62<j && j<=71 && k<=35
        choice=1;
        return
    end
    if 71<j && j<=75 && k<=26
        choice=1;
        return
    end
    if j>75 && k<=45
        choice=1;
        return
    end
    return
end



if j<=11 && k<=21
    choice=1;
    return
end
if 11<j && j<=26 && k<=22
    choice=1;
    return
end
if 26<j && j<=45 && k<=25
    choice=1;
    return
end
if 45<j && j<=57 && k<=28
    choice=1;
    return
end
if 57<j && j<=64 && k<=33
    choice=1;
    return
end
if 64<j && j<=72 && k<=37
    choice=1;
    return
end
if 72<j && j<=76 && k<=28
    choice=1;
    return
end
if j>76 && k<=48
    choice=1;
    return
end


end

