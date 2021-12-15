deal: array
    "comment stating purpose of instance-side message"
    "scope: class-variables  &  instance-variables"

    | player1 player2 hand1 hand2 counter1 counter2 hand1size hand2size p11 p12 p13 p14 p15 p21 p22 p23 p24 p25 conditionp1 conditionp2 p1total p2total minmaxp1 minmaxp2 remainder1 remainder2 oc11 oc12 oc13 oc14 oc21 oc22 oc23 oc24 winner lowpair1 lowpair2 highpair1 highpair2 w1 w2 w3 w4 w5 v1 v2 v3 v4 v5 |

"This part initializes the needed arrays"
player1 := Array new: 5.
player2 := Array new: 5.
"This part takes the 10 cards and distrbutes to the two players"
player1 at: 1 put: ( array at: 1 ).
player2 at: 1 put: ( array at: 2 ).
player1 at: 2 put: ( array at: 3 ).
player2 at: 2 put: ( array at: 4 ).
player1 at: 3 put: ( array at: 5 ).
player2 at: 3 put: ( array at: 6 ).
player1 at: 4 put: ( array at: 7 ).
player2 at: 4 put: ( array at: 8 ).
player1 at: 5 put: ( array at: 9 ).
player2 at: 5 put: ( array at: 10 ).

"This part sorts the two subarrays"

player1 sort.
player2 sort.

p11 := player1 at: 1.
p12 := player1 at: 2.
p13 := player1 at: 3.
p14 := player1 at: 4.
p15 := player1 at: 5.
p21 := player2 at: 1.
p22 := player2 at: 2.
p23 := player2 at: 3.
p24 := player2 at: 4.
p25 := player2 at: 5.

"This creates a counter for scoring"
counter1 := 1. "counter for player 1"
counter2 := 1. "counter for player 2"

"Occurence of pair,triple, 4 of a kind"

remainder1 := Array new: 5.
remainder1 at: 1 put: ((p11/13) fractionPart).
remainder1 at: 2 put: ((p12/13) fractionPart).
remainder1 at: 3 put: ((p13/13) fractionPart).
remainder1 at: 4 put: ((p14/13) fractionPart).
remainder1 at: 5 put: ((p15/13) fractionPart).
(remainder1 at: 1)=0 ifTrue: [remainder1 at: 1 put: 1].
(remainder1 at: 2)=0 ifTrue: [remainder1 at: 2 put: 1].
(remainder1 at: 3)=0 ifTrue: [remainder1 at: 3 put: 1].
(remainder1 at: 4)=0 ifTrue: [remainder1 at: 4 put: 1].
(remainder1 at: 5)=0 ifTrue: [remainder1 at: 5 put: 1].
(remainder1 at: 1)=(1/13) ifTrue: [remainder1 at: 1 put: (14/13)].
(remainder1 at: 2)=(1/13) ifTrue: [remainder1 at: 2 put: (14/13)].
(remainder1 at: 3)=(1/13) ifTrue: [remainder1 at: 3 put: (14/13)].
(remainder1 at: 4)=(1/13) ifTrue: [remainder1 at: 4 put: (14/13)].
(remainder1 at: 5)=(1/13) ifTrue: [remainder1 at: 5 put: (14/13)].

"Same thing above for player 2"
remainder2 := Array new: 5.
remainder2 at: 1 put: ((p21/13) fractionPart).
remainder2 at: 2 put: ((p22/13) fractionPart).
remainder2 at: 3 put: ((p23/13) fractionPart).
remainder2 at: 4 put: ((p24/13) fractionPart).
remainder2 at: 5 put: ((p25/13) fractionPart).
(remainder2 at: 1)=0 ifTrue: [remainder2 at: 1 put: 1].
(remainder2 at: 2)=0 ifTrue: [remainder2 at: 2 put: 1].
(remainder2 at: 3)=0 ifTrue: [remainder2 at: 3 put: 1].
(remainder2 at: 4)=0 ifTrue: [remainder2 at: 4 put: 1].
(remainder2 at: 5)=0 ifTrue: [remainder2 at: 5 put: 1].
(remainder2 at: 1)=(1/13) ifTrue: [remainder2 at: 1 put: (14/13)].
(remainder2 at: 2)=(1/13) ifTrue: [remainder2 at: 2 put: (14/13)].
(remainder2 at: 3)=(1/13) ifTrue: [remainder2 at: 3 put: (14/13)].
(remainder2 at: 4)=(1/13) ifTrue: [remainder2 at: 4 put: (14/13)].
(remainder2 at: 5)=(1/13) ifTrue: [remainder2 at: 5 put: (14/13)].

"sorts the remainder array"
remainder1 sort.
remainder2 sort.
oc11:=0.
oc12:=0.
oc13:=0.
oc14:=0.
oc11 := remainder1 occurrencesOf: (remainder1 at: 1).
(oc11<5) ifTrue: [oc12 := remainder1 occurrencesOf: (remainder1 at: (oc11+1))].
((oc11+oc12)<5) ifTrue: [oc13 := remainder1 occurrencesOf: (remainder1 at: (oc11+oc12+1))].
((oc11+oc12+oc13)<5) ifTrue: [oc14 := remainder1 occurrencesOf: (remainder1 at: (oc11+oc12+oc13+1))].
oc21:=0.
oc22:=0.
oc23:=0.
oc24:=0.
oc21 := remainder2 occurrencesOf: (remainder2 at: 1).
(oc21<5) ifTrue: [oc22 := remainder2 occurrencesOf: (remainder2 at: (oc21+1))].
((oc21+oc22)<5) ifTrue: [oc23 := remainder2 occurrencesOf: (remainder2 at: (oc21+oc22+1))].
((oc21+oc22+oc23)<5) ifTrue: [oc24 := remainder2 occurrencesOf: (remainder2 at: (oc21+oc22+oc23+1))].

"#2 One Pair"
(oc11=2)|(oc12=2)|(oc13=2)|(oc14=2) ifTrue: [ counter1 :=2 ].
(oc21=2)|(oc22=2)|(oc23=2)|(oc24=2) ifTrue: [ counter2 :=2 ].

"#3 Two Pair"
(oc11=2 & oc12=2)|(oc11=2 &oc13=2)|(oc11=2 & oc14=2)|(oc12=2 & oc13=2)|(oc12=2 & oc14=2)|(oc13=2 & oc14=2) ifTrue: [ counter1 :=3 ].
(oc21=2 & oc22=2)|(oc21=2 &oc23=2)|(oc21=2 & oc24=2)|(oc22=2 & oc23=2)|(oc22=2 & oc24=2)|(oc23=2 & oc24=2) ifTrue: [ counter2 :=3 ].

"#4 Three of a kind"
(oc11=3)|(oc12=3)|(oc13=3)|(oc14=3) ifTrue: [ counter1 :=4 ].
(oc21=3)|(oc22=3)|(oc23=3)|(oc24=3) ifTrue: [ counter2 :=4 ].

"#5 Straight"
"checks for straight for p1"
p1total:=0.
(p11>0)&(p11<14) ifTrue: [w1:= p11].
(p11>13)&(p11<27) ifTrue: [w1:= p11-13].
(p11>26)&(p11<40) ifTrue: [w1:= p11-26].
(p11>39)&(p11<53) ifTrue: [w1:= p11-39].
(p11=1) ifTrue: [ w1:=p11+8 ].
(p11=14) ifTrue: [ w1:=p11-13+8 ].
(p11=27) ifTrue: [ w1:=p11-26+8 ].
(p11=40) ifTrue: [ w1:=p11-39+8 ].
(p12>0)&(p12<14) ifTrue: [w2:= p12].
(p12>13)&(p12<27) ifTrue: [w2:= p12-13].
(p12>26)&(p12<40) ifTrue: [w2:= p12-26].
(p12>39)&(p12<53) ifTrue: [w2:= p12-39].
(p12=1) ifTrue: [ w2:=p12+8 ].
(p12=14) ifTrue: [ w2:=p12-13+8 ].
(p12=27) ifTrue: [ w2:=p12-26+8 ].
(p12=40) ifTrue: [ w2:=p12-39+8 ].
(p13>0)&(p13<14) ifTrue: [w3:= p13].
(p13>13)&(p13<27) ifTrue: [w3:= p13-13].
(p13>26)&(p13<40) ifTrue: [w3:= p13-26].
(p13>39)&(p13<53) ifTrue: [w3:= p13-39].
(p13=1) ifTrue: [ w3:=p13+8 ].
(p13=14) ifTrue: [ w3:=p13-13+8 ].
(p13=27) ifTrue: [ w3:=p13-26+8 ].
(p13=40) ifTrue: [ w3:=p13-39+8 ].
(p14>0)&(p14<14) ifTrue: [w4:= p14].
(p14>13)&(p14<27) ifTrue: [w4:= p14-13].
(p14>26)&(p14<40) ifTrue: [w4:= p14-26].
(p14>39)&(p14<53) ifTrue: [w4:= p14-39].
(p14=1) ifTrue: [ w4:=p14+8 ].
(p14=14) ifTrue: [ w4:=p14-13+8 ].
(p14=27) ifTrue: [ w4:=p14-26+8 ].
(p14=40) ifTrue: [ w4:=p14-39+8 ].
(p15>0)&(p15<14) ifTrue: [w5:= p15].
(p15>13)&(p15<27) ifTrue: [w5:= p15-13].
(p15>26)&(p15<40) ifTrue: [w5:= p15-26].
(p15>39)&(p15<53) ifTrue: [w5:= p15-39].
(p15=1) ifTrue: [ w5:=p15+8 ].
(p15=14) ifTrue: [ w5:=p15-13+8 ].
(p15=27) ifTrue: [ w5:=p15-26+8 ].
(p15=40) ifTrue: [ w5:=p15-39+8 ].

p1total := p1total+w1+w2+w3+w4+w5.
v1 := Array with: w1 with: w2 with: w3 with: w4 with: w5.
v1 sort.
p1total\\5 = 0 ifTrue: [ conditionp1 := 1 ].
minmaxp1 := (v1 at: 1) + 4.
conditionp1 = 1 & minmaxp1 = (v1 at: 5) ifTrue: [ counter1 := 5 ].

"checks for straight for p2"
(p21>0)&(p21<14) ifTrue: [w1:= p21].
(p21>13)&(p21<27) ifTrue: [w1:= p21-13].
(p21>26)&(p21<40) ifTrue: [w1:= p21-26].
(p21>39)&(p21<53) ifTrue: [w1:= p21-39].
(p21=1) ifTrue: [ w1:=p21+8 ].
(p21=14) ifTrue: [ w1:=p21-13+8 ].
(p21=27) ifTrue: [ w1:=p21-26+8 ].
(p21=40) ifTrue: [ w1:=p21-39+8 ].
(p22>0)&(p22<14) ifTrue: [w2:= p22].
(p22>13)&(p22<27) ifTrue: [w2:= p22-13].
(p22>26)&(p22<40) ifTrue: [w2:= p22-26].
(p22>39)&(p22<53) ifTrue: [w2:= p22-39].
(p22=1) ifTrue: [ w1:=p22+8 ].
(p22=14) ifTrue: [ w1:=p22-13+8 ].
(p22=27) ifTrue: [ w1:=p22-26+8 ].
(p22=40) ifTrue: [ w1:=p22-39+8 ].
(p23>0)&(p23<14) ifTrue: [w3:= p23].
(p23>13)&(p23<27) ifTrue: [w3:= p23-13].
(p23>26)&(p23<40) ifTrue: [w3:= p23-26].
(p23>39)&(p23<53) ifTrue: [w3:= p23-39].
(p23=1) ifTrue: [ w1:=p23+8 ].
(p23=14) ifTrue: [ w1:=p23-13+8 ].
(p23=27) ifTrue: [ w1:=p23-26+8 ].
(p23=40) ifTrue: [ w1:=p23-39+8 ].
(p24>0)&(p24<14) ifTrue: [w4:= p24].
(p24>13)&(p24<27) ifTrue: [w4:= p24-13].
(p24>26)&(p24<40) ifTrue: [w4:= p24-26].
(p24>39)&(p24<53) ifTrue: [w4:= p24-39].
(p24=1) ifTrue: [ w1:=p24+8 ].
(p24=14) ifTrue: [ w1:=p24-13+8 ].
(p24=27) ifTrue: [ w1:=p24-26+8 ].
(p24=40) ifTrue: [ w1:=p24-39+8 ].
(p25>0)&(p25<14) ifTrue: [w5:= p25].
(p25>13)&(p25<27) ifTrue: [w5:= p25-13].
(p25>26)&(p25<40) ifTrue: [w5:= p25-26].
(p25>39)&(p25<53) ifTrue: [w5:= p25-39].
(p25=1) ifTrue: [ w1:=p25+8 ].
(p25=14) ifTrue: [ w1:=p25-13+8 ].
(p25=27) ifTrue: [ w1:=p25-26+8 ].
(p25=40) ifTrue: [ w1:=p25-39+8 ].
p2total := w1+w2+w3+w4+w5.
v1 := Array with: w1 with: w2 with: w3 with: w4 with: w5.
v1 sort.
p2total\\5 = 0 ifTrue: [ conditionp2 := 1 ].
minmaxp2 := (v1 at:1) + 4.
conditionp2 = 1 & minmaxp2 = (v1 at: 5) ifTrue: [ counter2 := 5 ].

"#6 Flush"
hand1 := player1 select: [:a | a >= 1 & (a <= 13)]. "This checks for flush with clubs"
hand1size := hand1 size.
hand1size = 5  ifTrue: [ counter1 :=6 ].

hand2 := player2 select: [:b | b >= 1 & (b <= 13)]. "Applies same concept as above with hand2"
hand2size := hand2 size.
hand2size = 5  ifTrue: [ counter2 := 6 ].

hand1 := player1 select: [:c | c >= 14 & (c <= 26)]. "This checks for flush with diamonds"
hand1size := hand1 size.
hand1size = 5  ifTrue: [ counter1 :=6 ].

hand2 := player2 select: [:d | d >= 14 & (d <= 26)]. "Applies same concept as above with hand2"
hand2size := hand2 size.
hand2size = 5  ifTrue: [ counter2 := 6 ].

hand1 := player1 select: [:e | e >= 27 & (e <= 39)]. "This checks for flush with hearts"
hand1size := hand1 size.
hand1size = 5  ifTrue: [ counter1 := 6 ].

hand2 := player2 select: [:f | f >= 27 & (f <= 39)]. "Applies same concept as above with hand2"
hand2size := hand2 size.
hand2size = 5  ifTrue: [ counter2 := 6 ].

hand1 := player1 select: [:g | g >= 40 & (g <= 52)]. "This checks for flush with spades"
hand1size := hand1 size.
hand1size = 5  ifTrue: [ counter1 :=6 ].

hand2 := player2 select: [:h | h >= 40 & (h <= 52)]. "Applies same concept as above with hand2"
hand2size := hand2 size.
hand2size = 5  ifTrue: [ counter2 := 6 ].

"#7 Full house"
(oc11=3 & oc12=2)|(oc11=2 &oc12=3) ifTrue: [ counter1 :=7 ].
(oc21=3 & oc22=2)|(oc21=2 &oc22=3) ifTrue: [ counter2 :=7 ].

"#8 Four of a kind"
(oc11=4)|(oc12=4)|(oc13=4)|(oc14=4) ifTrue: [ counter1 :=8 ].
(oc21=4)|(oc22=4)|(oc23=4)|(oc24=4) ifTrue: [ counter2 :=8 ].

"#9 Straight Flush"
p1total := p11 + p12 + p13 + p14 + p15. "This checks for straight flush with clubs"
p1total\\5 = 0 ifTrue: [ conditionp1 := 1 ].
minmaxp1 := p11 + 4.
(conditionp1 = 1) & (minmaxp1 = p15) & (p11 >= 1) & (p15 <= 13) ifTrue: [ counter1 := 9 ].

p2total := p21 + p22 + p23 + p24 + p25. "Applies same concept as above for player 2"
p2total\\5 = 0 ifTrue: [ conditionp2 := 1 ].
minmaxp2 := p21 + 4.
(conditionp2 = 1) & (minmaxp2 = p25) & (p21 >= 1) & (p25 <= 13)ifTrue: [ counter2 := 9 ].

p1total := p11 + p12 + p13 + p14 + p15. "This checks for straight flush with diamonds"
p1total\\5 = 0 ifTrue: [ conditionp1 := 1 ].
minmaxp1 := p11 + 4.
(conditionp1 = 1) & (minmaxp1 = p15) & (p11 >= 14) & (p15 <= 26) ifTrue: [ counter1 := 9 ].

p2total := p21 + p22 + p23 + p24 + p25. "Applies same concept as above for player 2"
p2total\\5 = 0 ifTrue: [ conditionp2 := 1 ].
minmaxp2 := p21 + 4.
(conditionp2 = 1) & (minmaxp2 = p25) & (p21 >= 14) & (p21 <= 26)ifTrue: [ counter2 := 9 ].

p1total := p11 + p12 + p13 + p14 + p15. "This checks for straight flush with hearts"
p1total\\5 = 0 ifTrue: [ conditionp1 := 1 ].
minmaxp1 := p11 + 4.
(conditionp1 = 1) & (minmaxp1 = p15) & (p11 >= 27) & (p11 <= 39) ifTrue: [ counter1 := 9 ].

p2total := p21 + p22 + p23 + p24 + p25. "Applies same concept as above for player 2"
p2total\\5 = 0 ifTrue: [ conditionp2 := 1 ].
minmaxp2 := p21 + 4.
(conditionp2 = 1) & (minmaxp2 = p25) & (p21 >= 27) & (p21 <= 39)ifTrue: [ counter2 := 9 ].

p1total := p11 + p12 + p13 + p14 + p15. "This checks for straight flush with hearts"
p1total\\5 = 0 ifTrue: [ conditionp1 := 1 ].
minmaxp1 := p11 + 4.
(conditionp1 = 1) & (minmaxp1 = p15) & (p11 >= 40) & (p11 <= 52) ifTrue: [ counter1 := 9 ].

p2total := p21 + p22 + p23 + p24 + p25. "Applies same concept as above for player 2"
p2total\\5 = 0 ifTrue: [ conditionp2 := 1 ].
minmaxp2 := p21 + 4.
(conditionp2 = 1) & (minmaxp2 = p25) & (p21 >= 40) & (p21 <= 52)ifTrue: [ counter2 := 9 ].

"#10 Royal Flush"
(p11 = 1) & (p12 = 10) & (p13 = 11) & (p14 = 12) & (p15 = 13) ifTrue: [ counter1 := 10 ].
(p11 = 14) & (p12 = 23) & (p13 = 24) & (p14 = 25) & (p15 = 26) ifTrue: [ counter1 := 10 ].
(p11 = 27) & (p12 = 36) & (p13 = 37) & (p14 = 38) & (p15 = 39) ifTrue: [ counter1 := 10 ].
(p11 = 40) & (p12 = 49) & (p13 = 50) & (p14 = 51) & (p15 = 52) ifTrue: [ counter1 := 10 ].

(p21 = 1) & (p22 = 10) & (p23 = 11) & (p24 = 12) & (p25 = 13) ifTrue: [ counter2 := 10 ].
(p21 = 14) & (p22 = 23) & (p23 = 24) & (p24 = 25) & (p25 = 26) ifTrue: [ counter2 := 10 ].
(p21 = 27) & (p22 = 36) & (p23 = 37) & (p24 = 38) & (p25 = 39) ifTrue: [ counter2 := 10 ].
(p21 = 40) & (p22 = 49) & (p23 = 50) & (p24 = 51) & (p25 = 52) ifTrue: [ counter2 := 10 ].

"TieBreakers"
winner := 'none'. "This initializes the winner"
(counter1>counter2) ifTrue: [ winner:= player1 ].
(counter2>counter1) ifTrue: [ winner:= player2 ].

"#1 highcard"
"First compares for higher rank"
(winner='none')&(counter1=1)&(counter2=1)&((remainder1 at:5)>(remainder2 at: 5)) ifTrue: [winner:= player1].
(winner='none')&(counter1=1)&(counter2=1)&((remainder2 at:5)>(remainder1 at: 5)) ifTrue: [winner:= player2].
(winner='none')&(counter1=1)&(counter2=1)&((remainder1 at:4)>(remainder2 at: 4)) ifTrue: [winner:= player1].
(winner='none')&(counter1=1)&(counter2=1)&((remainder2 at:4)>(remainder1 at: 4)) ifTrue: [winner:= player2].
(winner='none')&(counter1=1)&(counter2=1)&((remainder1 at:3)>(remainder2 at: 3)) ifTrue: [winner:= player1].
(winner='none')&(counter1=1)&(counter2=1)&((remainder2 at:3)>(remainder1 at: 3)) ifTrue: [winner:= player2].
(winner='none')&(counter1=1)&(counter2=1)&((remainder1 at:2)>(remainder2 at: 2)) ifTrue: [winner:= player1].
(winner='none')&(counter1=1)&(counter2=1)&((remainder2 at:2)>(remainder1 at: 2)) ifTrue: [winner:= player2].
(winner='none')&(counter1=1)&(counter2=1)&((remainder1 at:1)>(remainder2 at: 1)) ifTrue: [winner:= player1].
(winner='none')&(counter1=1)&(counter2=1)&((remainder2 at:1)>(remainder1 at: 1)) ifTrue: [winner:= player2].

"If the ranks are the same, each suit will be compared"
(winner='none')&(counter1=1)&(counter2=1)&((p15)>(p25)) ifTrue: [winner:= player1].
(winner='none')&(counter1=1)&(counter2=1)&((p25)>(p15)) ifTrue: [winner:= player2].
(winner='none')&(counter1=1)&(counter2=1)&((p14)>(p24)) ifTrue: [winner:= player1].
(winner='none')&(counter1=1)&(counter2=1)&((p24)>(p14)) ifTrue: [winner:= player2].
(winner='none')&(counter1=1)&(counter2=1)&((p13)>(p13)) ifTrue: [winner:= player1].
(winner='none')&(counter1=1)&(counter2=1)&((p13)>(p13)) ifTrue: [winner:= player2].
(winner='none')&(counter1=1)&(counter2=1)&((p12)>(p22)) ifTrue: [winner:= player1].
(winner='none')&(counter1=1)&(counter2=1)&((p22)>(p12)) ifTrue: [winner:= player2].
(winner='none')&(counter1=1)&(counter2=1)&((p11)>(p21)) ifTrue: [winner:= player1].
(winner='none')&(counter1=1)&(counter2=1)&((p21)>(p11)) ifTrue: [winner:= player2].

"#2 pair"
"Find high pair"
highpair1:=0.
highpair2:=0.
(counter1=2)&(counter2=2)&(oc11=2) ifTrue: [highpair1:=(remainder1 at: oc11)]. 
(counter1=2)&(counter2=2)&(oc12=2) ifTrue: [highpair1:=(remainder1 at: oc12)]. 
(counter1=2)&(counter2=2)&(oc13=2) ifTrue: [highpair1:=(remainder1 at: oc13)]. 
(counter1=2)&(counter2=2)&(oc14=2) ifTrue: [highpair1:=(remainder1 at: oc14)]. 

(counter1=2)&(counter2=2)&(oc21=2) ifTrue: [highpair2:=(remainder2 at: oc21)]. 
(counter1=2)&(counter2=2)&(oc22=2) ifTrue: [highpair2:=(remainder2 at: oc22)]. 
(counter1=2)&(counter2=2)&(oc23=2) ifTrue: [highpair2:=(remainder2 at: oc23)]. 
(counter1=2)&(counter2=2)&(oc24=2) ifTrue: [highpair2:=(remainder2 at: oc24)]. 
(winner='none')&(highpair1>highpair2) ifTrue:[winner:=player1].
(winner='none')&(highpair2>highpair1) ifTrue:[winner:=player2].
"high card"
(winner='none')&(counter1=2)&(counter2=2)&((remainder1 at: 5)>(remainder2 at:5)) ifTrue:[winner:=player1].
(winner='none')&(counter1=2)&(counter2=2)&((remainder2 at: 5)>(remainder1 at:5)) ifTrue:[winner:=player2].
(winner='none')&(counter1=2)&(counter2=2)&((remainder1 at: 4)>(remainder2 at:4)) ifTrue:[winner:=player1].
(winner='none')&(counter1=2)&(counter2=2)&((remainder2 at: 4)>(remainder1 at:4)) ifTrue:[winner:=player2].
(winner='none')&(counter1=2)&(counter2=2)&((remainder1 at: 3)>(remainder2 at:3)) ifTrue:[winner:=player1].
(winner='none')&(counter1=2)&(counter2=2)&((remainder2 at: 3)>(remainder1 at:3)) ifTrue:[winner:=player2].
(winner='none')&(counter1=2)&(counter2=2)&((remainder1 at: 2)>(remainder2 at:2)) ifTrue:[winner:=player1].
(winner='none')&(counter1=2)&(counter2=2)&((remainder2 at: 2)>(remainder1 at:2)) ifTrue:[winner:=player2].
(winner='none')&(counter1=2)&(counter2=2)&((remainder1 at: 1)>(remainder2 at:1)) ifTrue:[winner:=player1].
(winner='none')&(counter1=2)&(counter2=2)&((remainder2 at: 1)>(remainder1 at:1)) ifTrue:[winner:=player2].
"high suit"
(winner='none')&(counter1=2)&(counter2=2)&(p15>p25) ifTrue:[winner:=player1].
(winner='none')&(counter1=2)&(counter2=2)&(p15>p25) ifTrue:[winner:=player2].
(winner='none')&(counter1=2)&(counter2=2)&(p15>p25) ifTrue:[winner:=player1].
(winner='none')&(counter1=2)&(counter2=2)&(p15>p25) ifTrue:[winner:=player2].
(winner='none')&(counter1=2)&(counter2=2)&(p15>p25) ifTrue:[winner:=player1].
(winner='none')&(counter1=2)&(counter2=2)&(p15>p25) ifTrue:[winner:=player2].
(winner='none')&(counter1=2)&(counter2=2)&(p15>p25) ifTrue:[winner:=player1].
(winner='none')&(counter1=2)&(counter2=2)&(p15>p25) ifTrue:[winner:=player2].
(winner='none')&(counter1=2)&(counter2=2)&(p15>p25) ifTrue:[winner:=player1].
(winner='none')&(counter1=2)&(counter2=2)&(p15>p25) ifTrue:[winner:=player2].

"#3 two pair"
lowpair1:=0.
lowpair2:=0.
(lowpair1=0)&(counter1=3)&(counter2=3)&(oc11=2) ifTrue: [ lowpair1:=(remainder1 at: oc11)].
(lowpair1=0)&(counter1=3)&(counter2=3)&(oc12=2) ifTrue: [ lowpair1:=(remainder1 at: oc12)].
(lowpair1=0)&(counter1=3)&(counter2=3)&(oc13=2) ifTrue: [ lowpair1:=(remainder1 at: oc13)].
(lowpair1=0)&(counter1=3)&(counter2=3)&(oc14=2) ifTrue: [ lowpair1:=(remainder1 at: oc14)].

(lowpair2=0)&(counter1=3)&(counter2=3)&(oc21=2) ifTrue: [ lowpair2:=(remainder2 at: oc21)].
(lowpair2=0)&(counter1=3)&(counter2=3)&(oc22=2) ifTrue: [ lowpair2:=(remainder2 at: oc22)].
(lowpair2=0)&(counter1=3)&(counter2=3)&(oc23=2) ifTrue: [ lowpair2:=(remainder2 at: oc23)].
(lowpair2=0)&(counter1=3)&(counter2=3)&(oc24=2) ifTrue: [ lowpair2:=(remainder2 at: oc24)].
(highpair1>highpair2) ifTrue:[winner:=player1].
(highpair2>highpair1) ifTrue:[winner:=player2].
(winner='none')&(lowpair1>lowpair2) ifTrue:[winner:=player1].
(winner='none')&(lowpair2>lowpair1) ifTrue:[winner:=player2].
"high card"
(winner='none')&(counter1=3)&(counter2=3)&((remainder1 at: 5)>(remainder2 at:5)) ifTrue:[winner:=player1].
(winner='none')&(counter1=3)&(counter2=3)&((remainder2 at: 5)>(remainder1 at:5)) ifTrue:[winner:=player2].
(winner='none')&(counter1=3)&(counter2=3)&((remainder1 at: 4)>(remainder2 at:4)) ifTrue:[winner:=player1].
(winner='none')&(counter1=3)&(counter2=3)&((remainder2 at: 4)>(remainder1 at:4)) ifTrue:[winner:=player2].
(winner='none')&(counter1=3)&(counter2=3)&((remainder1 at: 3)>(remainder2 at:3)) ifTrue:[winner:=player1].
(winner='none')&(counter1=3)&(counter2=3)&((remainder2 at: 3)>(remainder1 at:3)) ifTrue:[winner:=player2].
(winner='none')&(counter1=3)&(counter2=3)&((remainder1 at: 2)>(remainder2 at:2)) ifTrue:[winner:=player1].
(winner='none')&(counter1=3)&(counter2=3)&((remainder2 at: 2)>(remainder1 at:2)) ifTrue:[winner:=player2].
(winner='none')&(counter1=3)&(counter2=3)&((remainder1 at: 1)>(remainder2 at:1)) ifTrue:[winner:=player1].
(winner='none')&(counter1=3)&(counter2=3)&((remainder2 at: 1)>(remainder1 at:1)) ifTrue:[winner:=player2].
"high suit"
(winner='none')&(counter1=3)&(counter2=3)&(p15>p25) ifTrue:[winner:=player1].
(winner='none')&(counter1=3)&(counter2=3)&(p15>p25) ifTrue:[winner:=player2].
(winner='none')&(counter1=3)&(counter2=3)&(p15>p25) ifTrue:[winner:=player1].
(winner='none')&(counter1=3)&(counter2=3)&(p15>p25) ifTrue:[winner:=player2].
(winner='none')&(counter1=3)&(counter2=3)&(p15>p25) ifTrue:[winner:=player1].
(winner='none')&(counter1=3)&(counter2=3)&(p15>p25) ifTrue:[winner:=player2].
(winner='none')&(counter1=3)&(counter2=3)&(p15>p25) ifTrue:[winner:=player1].
(winner='none')&(counter1=3)&(counter2=3)&(p15>p25) ifTrue:[winner:=player2].
(winner='none')&(counter1=3)&(counter2=3)&(p15>p25) ifTrue:[winner:=player1].
(winner='none')&(counter1=3)&(counter2=3)&(p15>p25) ifTrue:[winner:=player2].

"#4 three of a kind"
(counter1=4)&(counter2=4)&((remainder1 at:3)>(remainder2 at: 3)) ifTrue: [winner:= player1].
(counter1=4)&(counter2=4)&((remainder2 at:3)>(remainder1 at: 3)) ifTrue: [winner:= player2].

"#5 Straight"
(winner='none')&(counter1=5)&(counter2=5)&((remainder1 at:5)>(remainder2 at: 5)) ifTrue: [winner:=player1]. "This checks for highest rank in flush"
(winner='none')&(counter1=5)&(counter2=5)&((remainder2 at:5)>(remainder1 at: 5)) ifTrue: [winner:=player2].
(winner='none')&(counter1=5)&(counter2=5)&((p15)>(p25)) ifTrue: [winner:=player1]. 
(winner='none')&(counter1=5)&(counter2=5)&((p25)>(p15)) ifTrue: [winner:=player2].

"#6 Flush"
"First compares for higher rank"
(winner='none')&(counter1=6)&(counter2=6)&((remainder1 at:5)>(remainder2 at: 5)) ifTrue: [winner:= player1].
(winner='none')&(counter1=6)&(counter2=6)&((remainder2 at:5)>(remainder1 at: 5)) ifTrue: [winner:= player2].
(winner='none')&(counter1=6)&(counter2=6)&((remainder1 at:4)>(remainder2 at: 4)) ifTrue: [winner:= player1].
(winner='none')&(counter1=6)&(counter2=6)&((remainder2 at:4)>(remainder1 at: 4)) ifTrue: [winner:= player2].
(winner='none')&(counter1=6)&(counter2=6)&((remainder1 at:3)>(remainder2 at: 3)) ifTrue: [winner:= player1].
(winner='none')&(counter1=6)&(counter2=6)&((remainder2 at:3)>(remainder1 at: 3)) ifTrue: [winner:= player2].
(winner='none')&(counter1=6)&(counter2=6)&((remainder1 at:2)>(remainder2 at: 2)) ifTrue: [winner:= player1].
(winner='none')&(counter1=6)&(counter2=6)&((remainder2 at:2)>(remainder1 at: 2)) ifTrue: [winner:= player2].
(winner='none')&(counter1=6)&(counter2=6)&((remainder1 at:1)>(remainder2 at: 1)) ifTrue: [winner:= player1].
(winner='none')&(counter1=6)&(counter2=6)&((remainder2 at:1)>(remainder1 at: 1)) ifTrue: [winner:= player2].

"If the ranks are the same, each suit will be compared"
(winner='none')&(counter1=6)&(counter2=6)&((p15)>(p25)) ifTrue: [winner:= player1].
(winner='none')&(counter1=6)&(counter2=6)&((p25)>(p15)) ifTrue: [winner:= player2].
(winner='none')&(counter1=6)&(counter2=6)&((p14)>(p24)) ifTrue: [winner:= player1].
(winner='none')&(counter1=6)&(counter2=6)&((p24)>(p14)) ifTrue: [winner:= player2].
(winner='none')&(counter1=6)&(counter2=6)&((p13)>(p13)) ifTrue: [winner:= player1].
(winner='none')&(counter1=6)&(counter2=6)&((p13)>(p13)) ifTrue: [winner:= player2].
(winner='none')&(counter1=6)&(counter2=6)&((p12)>(p22)) ifTrue: [winner:= player1].
(winner='none')&(counter1=6)&(counter2=6)&((p22)>(p12)) ifTrue: [winner:= player2].
(winner='none')&(counter1=6)&(counter2=6)&((p11)>(p21)) ifTrue: [winner:= player1].
(winner='none')&(counter1=6)&(counter2=6)&((p21)>(p11)) ifTrue: [winner:= player2].

"#7 Full House"
"Since there are only 4 cards of same rank, both players cannot get the same triple, thus whoever has higher triple wins"
(counter1=7)&(counter2=7)&((remainder1 at:3)>(remainder2 at: 3)) ifTrue: [winner:= player1].
(counter1=7)&(counter2=7)&((remainder2 at:3)>(remainder1 at: 3)) ifTrue: [winner:= player2].

"#8 Four of a kind"
"Since there are only 4 cards of same rank, both players cannot get the same four of a kind, thus whoever has higher four of a kind wins"
(counter1=8)&(counter2=8)&((remainder1 at:3)>(remainder2 at: 3)) ifTrue: [winner:= player1].
(counter1=8)&(counter2=8)&((remainder2 at:3)>(remainder1 at: 3)) ifTrue: [winner:= player2].

"#9 Straight Flush"
(winner='none')&(counter1=9)&(counter2=9)&((remainder1 at:5)>(remainder2 at: 5)) ifTrue: [winner:= player1].
(winner='none')&(counter1=9)&(counter2=9)&((remainder2 at:5)>(remainder1 at: 5)) ifTrue: [winner:= player2].
(winner='none')&(counter1=9)&(counter2=9)&(p15>p25) ifTrue: [winner:= player1].
(winner='none')&(counter1=9)&(counter2=9)&(p25>p15) ifTrue: [winner:= player2].

"#10 Royal Flush"
"Higher suit wins since royal flush ranks are the same"
(winner='none')&(counter1=10)&(counter2=10)&(p15>p25) ifTrue: [winner:= player1].
(winner='none')&(counter1=10)&(counter2=10)&(p25>p15) ifTrue: [winner:= player2].

"Output Winner"
(winner='none') ifTrue:[winner:=player1].
"Updates card values so that they are between 1-13"
w1 := ((winner at: 1) asString).
w2 := ((winner at: 2) asString).
w3 := ((winner at: 3) asString).
w4 := ((winner at: 4) asString).
w5 := ((winner at: 5) asString).
v1 := 'Number must be between 1-52'.
v2 := 'Number must be between 1-52'.
v3 := 'Number must be between 1-52'.
v4 := 'Number must be between 1-52'.
v5 := 'Number must be between 1-52'.

"For the first card"
"Checks to see if winning hand card is clubs and concatenates C with the number value"
(((winner at: 1) >= 1) & ((winner at: 1) <= 13)) ifTrue: [ v1 := 'C' ]. 
"Checks to see if winning hand card is diamonds and concatenates D with the number value"
(((winner at: 1) >= 14) & ((winner at: 1) <= 26)) ifTrue: [ v1 := 'D' ].
"Checks to see if winning hand card is hearts and concatenates H with the number value"
(((winner at: 1) >= 27) & ((winner at: 1) <= 39)) ifTrue: [ v1 := 'H' ].
"Checks to see if winning hand card is spades and concatenates S with the number value"
(((winner at: 1) >= 40) & ((winner at: 1) <= 52)) ifTrue: [ v1 := 'S' ].

"For the second card"
"Checks to see if winning hand card is clubs and concatenates C with the number value"
(((winner at: 2) >= 1) & ((winner at: 2) <= 13)) ifTrue: [ v2 := 'C' ]. 
"Checks to see if winning hand card is diamonds and concatenates D with the number value"
(((winner at: 2) >= 14) & ((winner at: 2) <= 26)) ifTrue: [ v2 := 'D' ].
"Checks to see if winning hand card is hearts and concatenates H with the number value"
(((winner at: 2) >= 27) & ((winner at: 2) <= 39)) ifTrue: [ v2 := 'H' ].
"Checks to see if winning hand card is spades and concatenates S with the number value"
(((winner at: 2) >= 40) & ((winner at: 2) <= 52)) ifTrue: [ v2 := 'S' ].

"For the third card"
"Checks to see if winning hand card is clubs and concatenates C with the number value"
(((winner at: 3) >= 1) & ((winner at: 3) <= 13)) ifTrue: [ v3 := 'C' ]. 
"Checks to see if winning hand card is diamonds and concatenates D with the number value"
(((winner at: 3) >= 14) & ((winner at: 3) <= 26)) ifTrue: [ v3 := 'D' ].
"Checks to see if winning hand card is hearts and concatenates H with the number value"
(((winner at: 3) >= 27) & ((winner at: 3) <= 39)) ifTrue: [ v3 := 'H' ].
"Checks to see if winning hand card is spades and concatenates S with the number value"
(((winner at: 3) >= 40) & ((winner at: 3) <= 52)) ifTrue: [ v3 := 'S' ].


"For the fourth card"
"Checks to see if winning hand card is clubs and concatenates C with the number value"
(((winner at: 4) >= 1) & ((winner at: 4) <= 13)) ifTrue: [ v4 := 'C' ]. 
"Checks to see if winning hand card is diamonds and concatenates D with the number value"
(((winner at: 4) >= 14) & ((winner at: 4) <= 26)) ifTrue: [ v4 := 'D' ].
"Checks to see if winning hand card is hearts and concatenates H with the number value"
(((winner at: 4) >= 27) & ((winner at: 4) <= 39)) ifTrue: [ v4 := 'H' ].
"Checks to see if winning hand card is spades and concatenates S with the number value"
(((winner at: 4) >= 40) & ((winner at: 4) <= 52)) ifTrue: [ v4 := 'S' ].

"For the fifth card"
"Checks to see if winning hand card is clubs and concatenates C with the number value"
(((winner at: 5) >= 1) & ((winner at: 5) <= 13)) ifTrue: [ v5 := 'C' ]. 
"Checks to see if winning hand card is diamonds and concatenates D with the number value"
(((winner at: 5) >= 14) & ((winner at: 5) <= 26)) ifTrue: [ v5 := 'D' ].
"Checks to see if winning hand card is hearts and concatenates H with the number value"
(((winner at: 5) >= 27) & ((winner at: 5) <= 39)) ifTrue: [ v5 := 'H' ].
"Checks to see if winning hand card is spades and concatenates S with the number value"
(((winner at: 5) >= 40) & ((winner at: 5) <= 52)) ifTrue: [ v5 := 'S' ].

"Updates variables as string so that they are between 1-13"
(((winner at: 1) >= 1) & ((winner at: 1) <= 13)) ifTrue: [ p11 := (winner at: 1) asString].
(((winner at: 1) >= 14) & ((winner at: 1) <= 26)) ifTrue: [ p11 := ((winner at: 1) - 13) asString].
(((winner at: 1) >= 27) & ((winner at: 1) <= 39)) ifTrue: [ p11 := ((winner at: 1) - 26) asString].
(((winner at: 1) >= 40) & ((winner at: 1) <= 52)) ifTrue: [ p11 := ((winner at: 1) - 39) asString].
(((winner at: 2) >= 1) & ((winner at: 2) <= 13)) ifTrue: [ p12 := (winner at: 2) asString].
(((winner at: 2) >= 14) & ((winner at: 2) <= 26)) ifTrue: [ p12 := ((winner at: 2) - 13) asString].
(((winner at: 2) >= 27) & ((winner at: 2) <= 39)) ifTrue: [ p12 := ((winner at: 2) - 26) asString].
(((winner at: 2) >= 40) & ((winner at: 2) <= 52)) ifTrue: [ p12 := ((winner at: 2) - 39) asString].
(((winner at: 3) >= 1) & ((winner at: 3) <= 13)) ifTrue: [ p13 := (winner at: 3) asString].
(((winner at: 3) >= 14) & ((winner at: 3) <= 26)) ifTrue: [ p13 := ((winner at: 3) - 13) asString].
(((winner at: 3) >= 27) & ((winner at: 3) <= 39)) ifTrue: [ p13 := ((winner at: 3) - 26) asString].
(((winner at: 3) >= 40) & ((winner at: 3) <= 52)) ifTrue: [ p13 := ((winner at: 3) - 39) asString].
(((winner at: 4) >= 1) & ((winner at: 4) <= 13)) ifTrue: [ p14 := (winner at: 4) asString].
(((winner at: 4) >= 14) & ((winner at: 4) <= 26)) ifTrue: [ p14 := ((winner at: 4) - 13) asString].
(((winner at: 4) >= 27) & ((winner at: 4) <= 39)) ifTrue: [ p14 := ((winner at: 4) - 26) asString].
(((winner at: 4) >= 40) & ((winner at: 4) <= 52)) ifTrue: [ p14 := ((winner at: 4) - 39) asString].
(((winner at: 5) >= 1) & ((winner at: 5) <= 13)) ifTrue: [ p15 := (winner at: 5) asString].
(((winner at: 5) >= 14) & ((winner at: 5) <= 26)) ifTrue: [ p15 := ((winner at: 5) - 13) asString].
(((winner at: 5) >= 27) & ((winner at: 5) <= 39)) ifTrue: [ p15 := ((winner at: 5) - 26) asString].
(((winner at: 5) >= 40) & ((winner at: 5) <= 52)) ifTrue: [ p15 := ((winner at: 5) - 39) asString].

winner at: 1 put: (p11, v1).
winner at: 2 put: (p12, v2).
winner at: 3 put: (p13, v3).
winner at: 4 put: (p14, v4).
winner at: 5 put: (p15, v5).
winner:= winner asSortedCollection.
winner:= winner asArray.
^winner.
