
-- Create table player 
IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Player]') AND type in (N'U'))
CREATE TABLE Player (
    PkPlayer int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    LastName varchar(255),
    FirstName varchar(255) NOT NULL,
	CoolName varchar(255),
	Email varchar(255) NOT NULL,
    PhoneNumber NUMERIC(10),
    Age int,
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT
);

-- Create a team  table 
IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Team]') AND type in (N'U'))
CREATE TABLE Team (
    PkTeam int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [Name] varchar(255),
    [Location] VARCHAR(255),
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[PlayerTeam]') AND type in (N'U'))
CREATE TABLE PlayerTeam (
    PkPlayerTeam int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    FkTeam int FOREIGN KEY REFERENCES Team(PkTeam),
    FkPlayer int FOREIGN KEY REFERENCES Player(PkPlayer),
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[MaxOverRule]') AND type in (N'U'))
CREATE TABLE MaxOverRule (
    PkMaxOverRule int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [Name] VARCHAR(50) NOT NULL,
    Bowler1 int NOT NULL,
    Bowler2 int NOT NULL,
    Bowler3 int NOT NULL,
    Bowler4 int NOT NULL,   
    Bowler5 int NOT NULL,
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT
   );

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[PowerPlayRule]') AND type in (N'U'))
CREATE TABLE [POWERPLAYRULE] (
    PkPowerPlayRule int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [Name] VARCHAR(50) NOT NULL,
    NoOfSlots INT,
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[PowerPlaySlot]') AND type in (N'U'))
CREATE TABLE [POWERPLAYSLOT] (
    PkPowerPlaySlot int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    FkPowerPlayRule int REFERENCES POWERPLAYRULE(PkPowerPlayRule),
    NoOfOvers  int,
     DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT
 );

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Rule]') AND type in (N'U'))
CREATE TABLE [RULE] (
    PkRule int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [Name] VARCHAR(255) NOT NULL,
    TotalOvers INT,
    FkMaxOverRule INT FOREIGN KEY  REFERENCES MaxOverRule(PkMaxOverRule),
    SuperOver BIT,
    FreeHit BIT,
    FkPowerPlayRule INT FOREIGN KEY REFERENCES PowerPlayRule(PkPowerPlayRule),
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Tournament]') AND type in (N'U'))
CREATE TABLE Tournament (
    PkTournament int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [Name] VARCHAR(255) NOT NULL,
    [Location] VARCHAR(50) NOT NULL, 
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT,
    DtStartDate DATETIME,
    DtEndDate DATETIME
);


-- Create table match 
IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Match]') AND type in (N'U'))
Create TABLE Match (
PkMatch INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
FkTeam1 INT FOREIGN KEY  REFERENCES TEAM(PkTeam),
FkTeam2 INT FOREIGN KEY  REFERENCES TEAM(PkTeam),
DtCreated DATETIME,    
DtUpdated DATETIME,
IsActive  BIT,
IsComplete BIT,
DtSchedule DATETIME
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[TournamentMatch]') AND type in (N'U'))
Create TABLE TournamentMatch (
pkTournamentMatch INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
FkMatch INT FOREIGN KEY  REFERENCES Match(PkMatch),
FKTournament INT FOREIGN KEY  REFERENCES Tournament(PkTournament),
DtCreated DATETIME,    
DtUpdated DATETIME,
IsActive  BIT,
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[TournamentRule]') AND type in (N'U'))
CREATE TABLE TournamentRule (
    PkTournamentRule int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [FKTournament] INT FOREIGN KEY REFERENCES Tournament(PkTournament),
    [FKRule] INT FOREIGN KEY REFERENCES [RULE](PkRule), 
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[MatchRule]') AND type in (N'U'))
CREATE TABLE MatchRule (
    PkMacthRule int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [FKMatch] INT FOREIGN KEY REFERENCES Match(PkMatch),
    [FKRule] INT FOREIGN KEY REFERENCES [RULE](PkRule), 
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[RunType]') AND type in (N'U'))
CREATE TABLE RunType (
    PkRunType int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Detail VARCHAR(50),
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[BallType]') AND type in (N'U'))
CREATE TABLE BallType (
    PkBallType int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Detail VARCHAR(50) NOT NULL,
    DtCreated DATETIME NOT NULL,    
    DtUpdated DATETIME NOT NULL,
    IsActive  BIT NOT NULL,
    IsLegal BIT NOT NULL,
    ExtraRun BIT NOT NULL
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[WicketType]') AND type in (N'U'))
CREATE TABLE WicketType (
    PkWicketType int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Detail VARCHAR(50) NOT NULL,
    DtCreated DATETIME NOT NULL,    
    DtUpdated DATETIME NOT NULL,
    IsActive  BIT NOT NULL
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[current].[MatchOver]') AND type in (N'U'))
CREATE TABLE [current].MatchOver (
    PkMatchOver int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [FKMatch] INT NOT NULL FOREIGN KEY REFERENCES Match(PkMatch),
    CurrentOver INT NOT NULL, 
    CurrentBall INT NOT NULL
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[current].[PlayerStrike]') AND type in (N'U'))
CREATE TABLE [current].PlayerStrike (
    PkPlayerStrike int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [FKMatch] INT NOT NULL FOREIGN KEY REFERENCES [dbo].Match(PkMatch),
    BattingStrikerId INT NOT NULL FOREIGN KEY REFERENCES [dbo].Player(PkPlayer),
    BattingNonStrikerId INT NOT NULL FOREIGN KEY REFERENCES [dbo].Player(PkPlayer), 
    BallerId INT NOT NULL FOREIGN KEY REFERENCES [dbo].Player(PkPlayer),
    DtCreated DATETIME NOT NULL,    
    DtUpdated DATETIME NOT NULL,
    IsActive  BIT NOT NULL,
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[current].[ScoreBoard]') AND type in (N'U'))
CREATE TABLE [current].ScoreBoard (
    PkScoreBoard int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [FKMatch] INT NOT NULL FOREIGN KEY REFERENCES [dbo].Match(PkMatch),
    DtCreated DATETIME NOT NULL,    
    DtUpdated DATETIME NOT NULL,
    IsActive  BIT NOT NULL,
    IsComplete BIT NOT NULL,
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[current].[BallUpdate]') AND type in (N'U'))
CREATE TABLE [current].BallUpdate (
    PkBallUpdate int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [FkScoreBoard] INT NOT NULL FOREIGN KEY REFERENCES [dbo].ScoreBoard(PkScoreBoard),
    FkBattingTeam INT NOT NULL FOREIGN KEY  REFERENCES [dbo].Team(PkTeam),
    FkBowlingTeam INT NOT NULL FOREIGN KEY  REFERENCES [dbo].Team(PkTeam),  
    RunScored INT NOT NULL,
    RunType INT NOT NULL,
    BallType INT NOT NULL,
    WiketFallen BIT NOT NULL,
    WicketType BIT NOT NULL, 
    DtCreated DATETIME NOT NULL,    
    DtUpdated DATETIME NOT NULL,
    IsActive  BIT NOT NULL
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[current].[BattingScore]') AND type in (N'U'))
CREATE TABLE [current].BattingScore (
    PkBattingScore int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [FkScoreBoard] INT NOT NULL FOREIGN KEY REFERENCES [current].ScoreBoard(PkScoreBoard),
    PkPlayerId INT  NOT NULL FOREIGN KEY  REFERENCES [dbo].Player(PkPlayer),
    RunsScored INT NOT NULL,
    BallFaced INT NOT NULL,
    Sixes INT NOT NULL,
    Fours INT NOT NULL,
    Dots INT NOT NULL,
    StrikeRate FLOAT NOT NULL,
    NotOut BIT NOT NULL,
    FkWicketTakenBy  INT NOT NULL FOREIGN KEY  REFERENCES [dbo].Player(PkPlayer),
    FKCatchTakenBy  INT NOT NULL FOREIGN KEY  REFERENCES [dbo].Player(PkPlayer),
    FKStumpedBy INT NOT NULL FOREIGN KEY REFERENCES [dbo].Player(PkPlayer),
    DtCreated DATETIME NOT NULL,    
    DtUpdated DATETIME NOT NULL,
    IsActive  BIT NOT NULL
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[current].[BowlingScore]') AND type in (N'U'))
CREATE TABLE  [current].BowlingScore (
    PkBowlingScore int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    PkPlayerId INT NOT NULL FOREIGN KEY  REFERENCES [dbo].Player(PkPlayer),
    Overs INT NOT NULL,
    Balls INT NOT NULL,
    TotalBalls INT NOT NULL,
    RunsGiven INT NOT NULL,
    Wickets INT NOT NULL,
    StrikeRate FLOAT NOT NULL,
    DtCreated DATETIME NOT NULL,    
    DtUpdated DATETIME NOT NULL,
    IsActive  BIT NOT NULL
);