
-- Create table player 
IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Player]') AND type in (N'U'))
CREATE TABLE Player (
    PLayerId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    LastName varchar(255),
    FirstName varchar(255),
	CoolName varchar(255),
	Email varchar(255) NOT NULL,
    PhoneNumber NUMERIC(10) NOT NULL,
    Age int NOT NULL,
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT NOT NULL
);

-- Create a team  table 
IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Team]') AND type in (N'U'))
CREATE TABLE Team (
    TeamId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [Name] varchar(255),
    [Location] VARCHAR(255),
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT NOT NULL
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[PlayerTeam]') AND type in (N'U'))
CREATE TABLE PlayerTeam (
    PlayerTeamId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    TeamId int NOT NULL FOREIGN KEY REFERENCES Team(TeamId),
    PlayerId int NOT NULL FOREIGN KEY REFERENCES Player(PlayerId),
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT NOT NULL
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[MaxOverRule]') AND type in (N'U'))
CREATE TABLE MaxOverRule (
    MaxOverRuleId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [Name] VARCHAR(50) NOT NULL,
    Bowler1 int NOT NULL,
    Bowler2 int NOT NULL,
    Bowler3 int NOT NULL,
    Bowler4 int NOT NULL,   
    Bowler5 int NOT NULL,
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT NOT NULL
   );

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[PowerPlayRule]') AND type in (N'U'))
CREATE TABLE [POWERPLAYRULE] (
    PowerPlayRuleId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [Name] VARCHAR(50),
    NoOfSlots INT NOT NULL,
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT NOT NULL
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[PowerPlaySlot]') AND type in (N'U'))
CREATE TABLE [POWERPLAYSLOT] (
    PowerPlaySlotId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    FkPowerPlayRule int NOT NULL REFERENCES POWERPLAYRULE(PowerPlayRuleId),
    NoOfOvers  int NOT NULL,
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT NOT NULL
 );

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Rule]') AND type in (N'U'))
CREATE TABLE [RULE] (
    RuleId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [Name] VARCHAR(255) NOT NULL,
    TotalOvers INT NOT NULL,
    FkMaxOverRule INT NOT NULL FOREIGN KEY  REFERENCES MaxOverRule(MaxOverRuleId),
    SuperOver BIT NOT NULL,
    FreeHit BIT NOT NULL,
    FkPowerPlayRule INT NOT NULL FOREIGN KEY REFERENCES PowerPlayRule(PowerPlayRuleId),
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT NOT NULL
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Tournament]') AND type in (N'U'))
CREATE TABLE Tournament (
    TournamentId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [Name] VARCHAR(255),
    [Location] VARCHAR(50), 
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT NOT NULL,
    DtStartDate DATETIME,
    DtEndDate DATETIME
);


-- Create table match 
IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Match]') AND type in (N'U'))
Create TABLE Match (
MatchId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
TeamAId INT  NOT NULL FOREIGN KEY  REFERENCES TEAM(TeamId),
TeamBId INT NOT NULL FOREIGN KEY  REFERENCES TEAM(TeamId),
DtCreated DATETIME,    
DtUpdated DATETIME,
IsActive  BIT NOT NULL,
IsComplete BIT NOT NULL,
DtSchedule DATETIME
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[TournamentMatch]') AND type in (N'U'))
Create TABLE TournamentMatch (
TournamentMatchId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
MatchId INT NOT NULL FOREIGN KEY  REFERENCES Match(MatchId),
TournamentId INT NOT NULL FOREIGN KEY  REFERENCES Tournament(TournamentId),
DtCreated DATETIME,    
DtUpdated DATETIME,
IsActive  BIT NOT NULL,
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[TournamentRule]') AND type in (N'U'))
CREATE TABLE TournamentRule (
    TournamentRuleId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [TournamentId] INT FOREIGN KEY REFERENCES Tournament(TournamentId),
    [RuleId] INT FOREIGN KEY REFERENCES [RULE](RuleId), 
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[MatchRule]') AND type in (N'U'))
CREATE TABLE MatchRule (
    MacthRuleId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [MatchId] INT NOT NULL FOREIGN KEY REFERENCES Match(MatchId),
    [RuleId] INT NOT NULL FOREIGN KEY REFERENCES [RULE](RuleId), 
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT NOT NULL
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[RunType]') AND type in (N'U'))
CREATE TABLE RunType (
    RunTypeId int NOT NULL  PRIMARY KEY,
    Detail VARCHAR(50),
    DtCreated DATETIME,    
    DtUpdated DATETIME,
    IsActive  BIT NOT NULL
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[BallType]') AND type in (N'U'))
CREATE TABLE BallType (
    BallTypeId int NOT NULL PRIMARY KEY,
    Detail VARCHAR(50),
    DtCreated DATETIME NOT NULL,    
    DtUpdated DATETIME NOT NULL,
    IsActive  BIT NOT NULL,
    IsLegal BIT NOT NULL,
    ExtraRun BIT NOT NULL
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[WicketType]') AND type in (N'U'))
CREATE TABLE WicketType (
    WicketTypeId int NOT NULL  PRIMARY KEY,
    Detail VARCHAR(50) NOT NULL,
    DtCreated DATETIME NOT NULL,    
    DtUpdated DATETIME NOT NULL,
    IsActive  BIT NOT NULL
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[TotalScore]') AND type in (N'U'))
CREATE TABLE TotalScore(
  TotalScoreId int  NOT NULL PRIMARY KEY,
  TotalRuns int NOT NULL,
  TotalOvers int NOT NULL,
  TotalBalls int NOT NULL,
  TotalWikets int NOT NULL,
  ExtraRuns int NOT NULL,   
  DtCreated DATETIME NOT NULL,    
  DtUpdated DATETIME NOT NULL,
  IsActive  BIT NOT NULL
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Innings]') AND type in (N'U'))
CREATE TABLE Innings (
    InningsId int NOT NULL PRIMARY KEY,
    [Name]  VARCHAR(50) NOT NULL,
    MatchId int NOT NULL,
    BattingTeamId int NOT NULL FOREIGN KEY REFERENCES TEAM(TeamId),
    BowlingTeamId int NOT NULL FOREIGN KEY REFERENCES TEAM(TeamId),
    PlayeOnStrikeId int NOT NULL FOREIGN KEY REFERENCES Player(PlayerId),
    PlayerOnNonStrikeId int NOT NULL FOREIGN KEY REFERENCES Player(PlayerId),
    BallerId int NOT NULL  FOREIGN KEY REFERENCES Player(PlayerId),
    TotalScoreId int NOT NULL  FOREIGN KEY REFERENCES TotalScore(TotalScoreId),
    DtCreated DATETIME NOT NULL,    
    DtUpdated DATETIME NOT NULL,
    IsActive  BIT NOT NULL
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[UpdatePerBall]') AND type in (N'U'))
CREATE TABLE [dbo].UpdatePerBall (
    UpdatePerBallId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
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
WHERE object_id = OBJECT_ID(N'[dbo].[WicketDetail]') AND type in (N'U'))
CREATE TABLE [dbo].WicketDetail (
    WicketDetailId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    UpdatePerBallId int NOT NULL  FOREIGN KEY REFERENCES UpdatePerBall(UpdatePerBallId),
    WicketType BIT NOT NULL,
    Details VARCHAR(50),
    WicketOwnerId int FOREIGN KEY REFERENCES Player(PlayerId),  
    FielderId int FOREIGN KEY REFERENCES Player(PlayerId),
    DtCreated DATETIME NOT NULL,    
    DtUpdated DATETIME NOT NULL,
    IsActive  BIT NOT NULL
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[BattingScore]') AND type in (N'U'))
CREATE TABLE [dbo].BattingScore (
    BattingScoreId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    InningsId int NOT NULL FOREIGN KEY  REFERENCES [dbo].Innings(InningsId),
    BatsmenId INT  NOT NULL FOREIGN KEY  REFERENCES [dbo].Player(PlayerId),
    RunsScored INT NOT NULL,
    BallFaced INT NOT NULL,
    Sixes INT NOT NULL,
    Fours INT NOT NULL,
    Dots INT NOT NULL,
    StrikeRate FLOAT NOT NULL,
    NotOut BIT NOT NULL,
    DtCreated DATETIME NOT NULL,    
    DtUpdated DATETIME NOT NULL,
    IsActive  BIT NOT NULL
);

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[BowlingScore]') AND type in (N'U'))
CREATE TABLE  [dbo].BowlingScore (
    BowlingScoreId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    InningsId int NOT NULL FOREIGN KEY  REFERENCES [dbo].Innings(InningsId),
    BallerId INT NOT NULL FOREIGN KEY  REFERENCES [dbo].Player(PlayerId),
    Overs INT NOT NULL,
    Balls INT NOT NULL,
    TotalBalls INT NOT NULL,
    RunsGiven INT NOT NULL,
    Wickets INT NOT NULL,
    Wides INT NOT NULL,
    NoBall INT NOT NULL,
    StrikeRate FLOAT NOT NULL,
    DtCreated DATETIME NOT NULL,    
    DtUpdated DATETIME NOT NULL,
    IsActive  BIT NOT NULL
);