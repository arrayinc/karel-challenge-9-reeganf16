/* File: Challenge-9.k
 ---------------------------
 More than a decade after Hurricane Katrina, considerable damage remains along
 the Gulf Coast, and some communities have yet to rebuild. As part of its plans
 to improve the nation’s infrastructure, the government has established a
 program named Katrina Automated RELief (or KAREL) to send house-building
 robots to repair the damaged area. Your job is to program those robots.

Each beeper in the figure represents a pile of debris where a house once stood.
Karel’s job is to walk along the street and build a new house in the place
marked by each beeper. Those houses, moreover, need to be raised on stilts
to avoid damage from the next storm.

At the end of the run, Karel should be at the east end of the street,
having created a set of houses.

In solving this problem, you can count on the following facts about the world:

• Karel starts off facing east at the corner of 1st Street and 1st Avenue
with an infinite number of beepers in its beeper bag.

• The beepers indicating the positions at which houses should be built will be
spaced so there’s room to build the houses without overlapping them
or hitting walls.

• Karel must end up facing east at the southeast corner of the world. Moreover,
 Karel should not run into a wall if it builds a house that extends into
 that final corner.
*/
import "turns";

function backOne(){
	turnAround();
	move();
	turnRight();
}

function putThree(){
	repeat(3){
		putBeeper();
		move();
	}
}

function columnThree(){
	turnLeft();
	move();
	turnLeft();
	putThree();
}

function columnTwo(){
	repeat(2){
		move();
		turnRight();
	}
	putThree();
}

function columnOne(){
	repeat(2){
		move();
		putBeeper();
	}
}

function buildLeft(){
	columnOne();
	repeat(2){
		move();
		turnLeft();
	}
	putThree();
	turnRight();
	move();
	turnRight();
	putThree();
}

function buildRight(){
	columnOne();
	columnTwo();
	columnThree();
}


function findLocation(){
	while(noBeepersPresent()){
		move();
	}
	move();
	if(frontIsClear()){
		buildHouseR();
	}
	buildHouseL();
}


function buildHouseR(){
	if(frontIsClear()){
		backOne();
		buildRight();
	}
}

function buildHouseL(){
	if(frontIsBlocked()){
		backOne();
		buildLeft();
	}
}

function returnToBase(){
	turnAround();
	while(frontIsClear()){
		move();
	}
	turnLeft();
	move();
}

function Solve(){
	repeat(3){
		findLocation();
		returnToBase();
	}
	while(frontIsClear()){
		move();
	}
	turnAround();
}

























