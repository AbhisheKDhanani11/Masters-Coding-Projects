DROP USER stockPluse_dba
/
CREATE USER stockPluse_dba
IDENTIFIED BY stockPluse_dba
DEFAULT TABLESPACE stockPluse_data
/

GRANT dba TO stockPluse_dba
/

PROMPT  . . . Now login as stockPluse_dba/stockPluse_dba . . .
