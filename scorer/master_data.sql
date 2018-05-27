--Bowled
--Caught
--Leg before wicket
--Run out
--Stumped
--Hit wicket
--Handled the ball
--Obstructing the field
--Timed out
--Hit the ball twice
INSERT INTO [dbo].[WicketType] (Detail,  DtCreated,    
    DtUpdated,
    IsActive)
VALUES ('Bowled', GETDATE(), GETDATE(), 1),
       ('Caught', GETDATE(), GETDATE(), 1),
       ('Leg Before Wicket', GETDATE(), GETDATE(), 1),
       ('Run Out', GETDATE(), GETDATE(), 1),
       ('Stumped', GETDATE(), GETDATE(), 1),
       ('Hit Wicket', GETDATE(), GETDATE(), 1),
       ('Handled the ball', GETDATE(), GETDATE(), 1),
       ('Obstructing the field', GETDATE(), GETDATE(), 1),
       ('Hit the ball  twice', GETDATE(), GETDATE(), 1);

--Normal
--No Ball
--Wide Ball
--Dead Ball
--First Bounce
INSERT INTO [dbo].[BallType] (Detail,  DtCreated,    
    DtUpdated,
    IsActive,IsLegal, ExtraRun)
VALUES ('Normal', GETDATE(), GETDATE(), 1, 1, 0),
       ('No ball', GETDATE(), GETDATE(), 1, 0, 1),
       ('Wide ball', GETDATE(), GETDATE(), 1,0,1),
       ('Dead Ball', GETDATE(), GETDATE(), 1,0,0),
       ('First Bounce', GETDATE(), GETDATE(), 1,1,0);  

-- Normal  Run 
-- Four 
-- Six 
-- Byes 
-- Leg Byes 
-- Over throw 
INSERT INTO [dbo].[RunType] (Detail,  DtCreated,    
    DtUpdated,
    IsActive)
VALUES ('Normal', GETDATE(), GETDATE(), 1),
       ('Four', GETDATE(), GETDATE(), 1),
       ('Six', GETDATE(), GETDATE(), 1),
       ('Leg Byes', GETDATE(), GETDATE(), 1),
       ('Byes', GETDATE(), GETDATE(), 1),
       ('Over throw', GETDATE(), GETDATE(), 1),
   


