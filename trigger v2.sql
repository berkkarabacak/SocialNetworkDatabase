CREATE TRIGGER ON_MEMBER_CREATED ON MEMBER
AFTER INSERT
AS
BEGIN
	DECLARE @INSERTED_PROFILE_ID INT;
	SELECT @INSERTED_PROFILE_ID = i.Profile_id FROM inserted i;

	IF @INSERTED_PROFILE_ID IS NOT NULL RETURN;

	DECLARE @MEMBER_ID INT;
	SELECT @MEMBER_ID = i.Member_id FROM inserted i;	

	INSERT INTO MEMBER_PROFILE(Privacy) VALUES(0);
	DECLARE @PROFILE_ID INT;
	SELECT @PROFILE_ID = SCOPE_IDENTITY();

	UPDATE MEMBER SET Profile_id = @PROFILE_ID WHERE Member_id = @MEMBER_ID;
END

GO

CREATE TRIGGER ON_PROFILE_CREATED ON MEMBER_PROFILE
AFTER INSERT
AS
BEGIN
	DECLARE @INSERTED_TIMELINE_ID INT;
	SELECT @INSERTED_TIMELINE_ID = i.Timeline_id FROM inserted i;

	IF @INSERTED_TIMELINE_ID IS NOT NULL RETURN;

	DECLARE @PROFILE_ID INT;
	SELECT @PROFILE_ID = i.Profile_id FROM inserted i;

	INSERT INTO TIMELINE(Privacy) VALUES(0);
	DECLARE @TIMELINE_ID INT;
	SELECT @TIMELINE_ID = SCOPE_IDENTITY();

	UPDATE MEMBER_PROFILE SET Timeline_id = @TIMELINE_ID WHERE Profile_id = @PROFILE_ID;
END

GO

CREATE TRIGGER ON_STATUS_CREATED ON STATUS
AFTER INSERT
AS
BEGIN
	DECLARE @INSERTED_POST_ID INT;
	SELECT @INSERTED_POST_ID = i.Post_id FROM inserted i;

	IF @INSERTED_POST_ID IS NOT NULL RETURN;

	DECLARE @STATUS_ID INT;
	SELECT @STATUS_ID = i.Status_id FROM inserted i;

	INSERT INTO POST(Created_at) VALUES(GETDATE());
	DECLARE @POST_ID INT;
	SELECT @POST_ID = SCOPE_IDENTITY();

	UPDATE STATUS SET Post_id = @POST_ID WHERE Status_id = @STATUS_ID;
END

GO

CREATE TRIGGER ON_COMMENT_CREATED ON COMMENT
AFTER INSERT
AS
BEGIN
	DECLARE @INSERTED_POST_ID INT;
	SELECT @INSERTED_POST_ID = i.Post_id FROM inserted i;

	IF @INSERTED_POST_ID IS NOT NULL RETURN;

	DECLARE @COMMENT_ID INT;
	SELECT @COMMENT_ID = i.Comment_id FROM inserted i;

	INSERT INTO POST(Created_at) VALUES(GETDATE());
	DECLARE @POST_ID INT;
	SELECT @POST_ID = SCOPE_IDENTITY();

	UPDATE COMMENT SET Post_id = @POST_ID WHERE Comment_id = @COMMENT_ID;
END

GO

CREATE TRIGGER ON_GROUP_CREATED ON GROUPS
AFTER INSERT
AS
BEGIN
	DECLARE @CREATOR INT;
	SELECT @CREATOR = i.Created_by FROM inserted i;

	DECLARE @GROUP_ID INT;
	SELECT @GROUP_ID = i.Group_id FROM inserted i;
	
	INSERT INTO MEMBERS_GROUPS(Group_id, Member_id) VALUES (@GROUP_ID, @CREATOR);

	DECLARE @INSERTED_TIMELINE_ID INT;
	SELECT @INSERTED_TIMELINE_ID = i.Timeline_id FROM inserted i;

	IF @INSERTED_TIMELINE_ID IS NOT NULL RETURN;

	INSERT INTO TIMELINE(Privacy) VALUES(0);
	DECLARE @TIMELINE_ID INT;
	SELECT @TIMELINE_ID = SCOPE_IDENTITY();

	UPDATE GROUPS SET Timeline_id = @TIMELINE_ID WHERE Group_id = @GROUP_ID;
END

GO

CREATE TRIGGER ON_EVENT_CREATED ON EVENTS
AFTER INSERT
AS
BEGIN
	DECLARE @INSERTED_TIMELINE_ID INT;
	SELECT @INSERTED_TIMELINE_ID = i.Timeline_id FROM inserted i;

	IF @INSERTED_TIMELINE_ID IS NOT NULL RETURN;

	DECLARE @EVENT_ID INT;
	SELECT @EVENT_ID = i.Event_id FROM inserted i;

	INSERT INTO TIMELINE(Privacy) VALUES(0);
	DECLARE @TIMELINE_ID INT;
	SELECT @TIMELINE_ID = SCOPE_IDENTITY();

	UPDATE EVENTS SET Timeline_id = @TIMELINE_ID WHERE Event_id = @EVENT_ID;
END