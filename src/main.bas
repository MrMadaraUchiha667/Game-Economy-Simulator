DECLARE SUB MainMenu()
DECLARE SUB SimulateDay()
DECLARE SUB ShowMarket()

TYPE Resource
    name AS STRING * 32
    price AS DOUBLE
    stock AS INTEGER
END TYPE

DIM SHARED market(1 TO 5) AS Resource
market(1).name="Wood": market(1).price=10: market(1).stock=500
market(2).name="Iron": market(2).price=35: market(2).stock=250
market(3).name="Fish": market(3).price=8: market(3).stock=800
market(4).name="Stone": market(4).price=12: market(4).stock=700
market(5).name="Food": market(5).price=15: market(5).stock=600

RANDOMIZE TIMER

MainMenu()

SUB MainMenu()

DIM opt AS INTEGER

DO

CLS
PRINT "==============================="
PRINT " GAME ECONOMY SIMULATOR"
PRINT "==============================="
PRINT "[1] Show Market"
PRINT "[2] Simulate Day"
PRINT "[0] Exit"

INPUT "Select: ", opt

SELECT CASE opt

CASE 1
ShowMarket()

CASE 2
SimulateDay()

END SELECT

LOOP UNTIL opt=0

END SUB

SUB ShowMarket()

CLS

DIM i AS INTEGER

PRINT "Market Overview"
PRINT

FOR i=1 TO 5
PRINT market(i).name;
PRINT " | Price:"; market(i).price;
PRINT " | Stock:"; market(i).stock
NEXT

SLEEP

END SUB

SUB SimulateDay()

DIM i AS INTEGER
DIM variation AS DOUBLE

FOR i=1 TO 5

variation=(RND*0.30)-0.15

market(i).price=market(i).price+(market(i).price*variation)

IF market(i).price < 1 THEN market(i).price=1

market(i).stock=market(i).stock+INT((RND*200)-100)

IF market(i).stock < 0 THEN market(i).stock=0

NEXT

PRINT
PRINT "A new day has passed."
SLEEP 2

END SUB
