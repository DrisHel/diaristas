# diaristas

## Description: :game_die:

Build a cleaning management DB for day laborers:

The B.D must control the history of cleaning performed by each day laborer in each residence.

Each Diarist has an identifier (id), cpf and name;
Each Residence has a responsible person. For the person responsible, it is important to store their name and CPF;
In addition to the person responsible, each Residence has an identifier (id), city, neighborhood, street, complement and number and Size (small, medium or large);
A Parent can be responsible for more than one Residence but a Residence has only one Parent;
Depending on the Size of the Residence, Cleaning has a price;
A Diarist performs a Cleaning per day, that is, she attends to a Residence per day;
A Maid can serve multiple households, and a household can be serviced by multiple Maids;
Cleaning can be scheduled (by date);
It is important to know if the Diarist has not been (missed) to a previously scheduled Cleaning;
Scheduled and unscheduled cleaning (for whatever reason) must not be paid for;
It is important to store evaluation feedback for each Cleaning performed. These comments must be made by the Person in Charge at the time of conclusion of the Cleaning;
The final amount paid by Cleaning should also be stored as the amount can be: higher (due to tips), lower (due to some damage/damage caused by the day laborer) or equal to the value defined for residences of the same size. Remembering that, over time, the value of Cleaning assigned by the Size of the Residence may also change. Therefore, it is also important to store this amount that was actually paid for each Cleaning in order to know, specifically, what each Diarist received for the Cleanings they did over time.

## Requirements: :hammer_and_wrench:

Create the Relational Model
Implement in PostgreSQL the B.D designed in the Relational Model (build a script.sql)
Create a STORE PROCEDURE that allows you to schedule fortnightly or monthly cleanings in a given residence:
The day laborer and the residence must be considered as entry parameters
Create a STORE PROCEDURE that calculates the percentage of attendance that a day laborer had in her cleaning throughout the year:
Ex: 75% attendance
Create a TRIGGER that excludes the diarist if her attendance drops below 75%.


## created by:   Doris Nunes :capricorn: :neckbeard:
