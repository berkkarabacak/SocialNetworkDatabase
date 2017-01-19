CREATE TRIGGER ON_MEMBER_DELETED_AFT ON MEMBER
AFTER DELETE 
AS
BEGIN
	DECLARE @PROFILE_ID INT;
	SELECT @PROFILE_ID = d.Profile_id FROM deleted d;

	DELETE FROM MEMBER_PROFILE WHERE Profile_id = @PROFILE_ID;
END

GO

CREATE TRIGGER ON_MEMBER_DELETED_INS ON MEMBER
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @DELETED_MEMB INT;
	SELECT @DELETED_MEMB = d.Member_id FROM deleted d;

	DELETE FROM NOTIFICATION WHERE Member_id = @DELETED_MEMB;
	DELETE FROM STATUS WHERE Sent_by = @DELETED_MEMB;
	DELETE FROM COMMENT WHERE Sent_by = @DELETED_MEMB;
	DELETE FROM LIKES WHERE Member_id = @DELETED_MEMB;
	DELETE FROM CONNECTION WHERE Member_1_id = @DELETED_MEMB OR Member_2_id = @DELETED_MEMB;
	DELETE FROM CONVERSATION WHERE Member_1_id = @DELETED_MEMB OR Member_2_id = @DELETED_MEMB;
	DELETE FROM MEMBER_BEING_FOLLOWED WHERE Member_being_followed_id = @DELETED_MEMB OR Follower_member_id = @DELETED_MEMB;
	DELETE FROM RECOMMENDATION WHERE Member_being_recommended = @DELETED_MEMB OR Member_recommending = @DELETED_MEMB;
	DELETE FROM MEMBERS_GROUPS WHERE Member_id = @DELETED_MEMB;
	DELETE FROM NOTIFICATION WHERE Member_id = @DELETED_MEMB;
	DELETE FROM MEMBERS_INVITED_EVENT WHERE Member_id = @DELETED_MEMB;
	DELETE FROM PROJECT_MEMBERS WHERE Member_id = @DELETED_MEMB;

	DELETE FROM MEMBER WHERE Member_id = @DELETED_MEMB;
END

GO

CREATE TRIGGER ON_CV_DELETED ON CV
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @CV_ID INT;
	SELECT @CV_ID = d.Cv_id FROM deleted d;

	DELETE FROM CV_SKILLS WHERE Cv_id = @CV_ID;
	DELETE FROM JOB_EXPERIENCE WHERE Cv_id = @CV_ID;
	DELETE FROM EDUCATION_INFO WHERE Cv_id = @CV_ID;
	DELETE FROM LANGUAGES_KNOWN WHERE Cv_id = @CV_ID;
	DELETE FROM PROJECT WHERE Cv_id = @CV_ID;

	DELETE FROM CV WHERE Cv_id = @CV_ID;
END

GO

CREATE TRIGGER ON_PROFILE_DELETED_AFT ON MEMBER_PROFILE
AFTER DELETE
AS
BEGIN

	DECLARE @TIMELINE_ID INT;
	SELECT @TIMELINE_ID = d.Timeline_id FROM deleted d;

	DELETE FROM TIMELINE WHERE Timeline_id = @TIMELINE_ID;
END

GO

CREATE TRIGGER ON_PROFILE_DELETED_INS ON MEMBER_PROFILE
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @PROFILE_ID INT;
	SELECT @PROFILE_ID = d.Profile_id FROM deleted d;

	DELETE FROM CV WHERE Profile_id = @PROFILE_ID;
	DELETE FROM PROFILE_EXTENSIONS WHERE Profile_id = @PROFILE_ID;
	DELETE FROM ADDRESSES WHERE Profile_id = @PROFILE_ID;

	DELETE FROM MEMBER_PROFILE WHERE Profile_id = @PROFILE_ID;
END

GO

CREATE TRIGGER ON_TIMELINE_DELETED ON TIMELINE
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @TIMELINE_ID INT;
	SELECT @TIMELINE_ID = d.Timeline_id FROM deleted d;

	DELETE FROM STATUS WHERE Timeline_id = @TIMELINE_ID;

	DELETE FROM TIMELINE WHERE Timeline_id = @TIMELINE_ID;
END

GO

CREATE TRIGGER ON_STATUS_DELETED_AFT ON STATUS
AFTER DELETE
AS
BEGIN

	DECLARE @POST_ID INT;
	SELECT @POST_ID = d.Post_id FROM deleted d;
	
	DELETE FROM POST WHERE Post_id = @POST_ID;
END

GO

CREATE TRIGGER ON_STATUS_DELETED_INS ON STATUS
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @STATUS_ID INT;
	SELECT @STATUS_ID = d.Status_id FROM deleted d;

	DELETE FROM COMMENT WHERE Status_id = @STATUS_ID;

	DELETE FROM STATUS WHERE Status_id = @STATUS_ID;
END

GO

CREATE TRIGGER ON_COMMENT_DELETED ON COMMENT
AFTER DELETE
AS
BEGIN
	DECLARE @POST_ID INT;
	SELECT @POST_ID = d.Post_id FROM deleted d;

	DELETE FROM POST WHERE Post_id = @POST_ID;
END

GO

CREATE TRIGGER ON_POST_DELETED ON POST
INSTEAD OF DELETE AS
BEGIN
	DECLARE @POST_ID INT;
	SELECT @POST_ID = i.Post_id FROM deleted i;
	DELETE FROM LIKES WHERE Post_id = @POST_ID;

	DELETE FROM POST WHERE Post_id = @POST_ID;
END

GO

CREATE TRIGGER ON_CONVERSATION_DELETED ON CONVERSATION
INSTEAD OF DELETE AS
BEGIN
	DECLARE @CONVERSATION_ID INT;
	SELECT @CONVERSATION_ID = i.Conversation_id FROM deleted i;
	DELETE FROM MESSAGE WHERE Conversation_id = @CONVERSATION_ID;

	DELETE FROM CONVERSATION WHERE Conversation_id = @CONVERSATION_ID;
END

GO

CREATE TRIGGER  ON_GROUPS_DELETED ON GROUPS
INSTEAD OF DELETE AS
BEGIN
	DECLARE @GROUP_ID INT;
	SELECT @GROUP_ID = i.Group_id FROM deleted i;
	DELETE FROM MEMBERS_GROUPS WHERE Group_id = @GROUP_ID;

	DELETE FROM GROUPS WHERE Group_id = @GROUP_ID;
END

GO

CREATE TRIGGER ON_EVENT_DELETED ON EVENTS
INSTEAD OF DELETE AS
BEGIN
	DECLARE @EVENT_ID INT;
	SELECT @EVENT_ID = i.Event_id FROM  deleted i;
	DELETE FROM MEMBERS_INVITED_EVENT WHERE Event_id = @EVENT_ID;

	DELETE FROM EVENTS WHERE Event_id = @EVENT_ID;
END

GO

CREATE TRIGGER ON_PROJECT_DELETED ON PROJECT
INSTEAD OF DELETE AS
BEGIN
	DECLARE @PROJECT_ID INT;
	SELECT @PROJECT_ID = i.Project_id FROM deleted i;
	DELETE FROM PROJECT_MEMBERS WHERE Project_id = @PROJECT_ID;

	DELETE FROM PROJECT WHERE Project_id = @PROJECT_ID;
END

GO