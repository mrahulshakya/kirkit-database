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
INSERT INTO [dbo].[WicketType] (WicketTypeId,Detail,  DtCreated,    
    DtUpdated,
    IsActive)
VALUES (1,'Bowled', GETDATE(), GETDATE(), 1),
       (2,'Caught', GETDATE(), GETDATE(), 1),
       (3,'Leg Before Wicket', GETDATE(), GETDATE(), 1),
       (4,'Run Out', GETDATE(), GETDATE(), 1),
       (5,'Stumped', GETDATE(), GETDATE(), 1),
       (6,'Hit Wicket', GETDATE(), GETDATE(), 1),
       (7,'Handled the ball', GETDATE(), GETDATE(), 1),
       (8,'Obstructing the field', GETDATE(), GETDATE(), 1),
       (9,'Hit the ball  twice', GETDATE(), GETDATE(), 1),
       (10,'Timed Out', GETDATE(), GETDATE(), 1);

--Normal
--No Ball
--Wide Ball
--Dead Ball
--First Bounce
INSERT INTO [dbo].[BallType] (BallTypeId,Detail,  DtCreated,    
    DtUpdated,
    IsActive,IsLegal, ExtraRun)
VALUES (1,'Normal', GETDATE(), GETDATE(), 1, 1, 0),
       (2,'No ball', GETDATE(), GETDATE(), 1, 0, 1),
       (3,'Wide ball', GETDATE(), GETDATE(), 1,0,1),
       (4,'Dead Ball', GETDATE(), GETDATE(), 1,0,0),
       (5,'First Bounce', GETDATE(), GETDATE(), 1,1,0);  

-- Normal  Run 
-- Four 
-- Six 
-- Byes 
-- Leg Byes 
-- Over throw 
INSERT INTO [dbo].[RunType] (RunTypeId,Detail,  DtCreated,    
    DtUpdated,
    IsActive)
VALUES (1,'Normal', GETDATE(), GETDATE(), 1),
       (2,'Four', GETDATE(), GETDATE(), 1),
       (3,'Six', GETDATE(), GETDATE(), 1),
       (4,'Leg Byes', GETDATE(), GETDATE(), 1),
       (5,'Byes', GETDATE(), GETDATE(), 1),
       (6,'Over throw', GETDATE(), GETDATE(), 1);
   
 

