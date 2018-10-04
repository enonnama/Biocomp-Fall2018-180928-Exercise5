#To get the gender and wage columns, sort by sex and years experience, and then output this into a csv:
cat wages.csv | cut -d ',' -f 1,2 | uniq | tr ',' ' '| sort -t ',' -nk1 | sort -t ',' -nk2 > sex.wages.csv

#For highest earner:
a=$(cat wages.csv | uniq | sort -t ',' -nk4 | sort -r | cut -d ',' -f 1,2,4 | head -1)
echo this is the highest earner $a 

#For lowest earner:
b=$(cat wages.csv | uniq | sort -t ',' -nk4 | sort -r | cut -d ',' -f 1,2,4 | tail -1)
echo this is the lowest earner $b

#For the number of females in top ten earners:
c=$(cat wages.csv | sort -t ',' -nk4 | sort -r | cut -d ',' -f 1,2,4 | uniq | head -10 | grep -E -c "female")
echo this is the number of females in the top ten earners $c
# sad

# Effect of graduating college on minimum wage of earners:
# I found the lowest wage was 2.7746776749, so I will sort by the years of education and this wage
val1=$(cat wages.csv | sort -t ',' -nk4 | sort -r | cut -d ',' -f 3,4 | grep -E -c "12|2.7746776749")
# it's 1410, or 42% of people in this study
echo this is the number of people making the minimum wage without a college education $val1
val2=$(cat wages.csv | sort -t ',' -nk4 | sort -r | cut -d ',' -f 3,4 | grep -E -c "16|2.7746776749")
# it's 276 or 8% of people in this study - huge difference!
echo this is the number of people making the minimum wage with a college education $val2
To get the difference:
echo $val1-$val2 | bc
# there are 1134 more minimum wage earners that haven't graduate college, than those that have. Suggesting that you are far more
# likely to make the minimum wage if you don't go to college. 

