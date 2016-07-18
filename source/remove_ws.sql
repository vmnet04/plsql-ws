--------------------------------------------------------------------------------
--
-- 2016-07-14, NV - remove_ws.sql
--

--
set linesize 160
set pagesize 50000
set trimspool on

--
column logfile new_value logfile noprint;

--
set termout off;
select sys_context( 'userenv', 'db_name' ) 
    || '_remove_ws.' 
    || to_char( sysdate, 'YYYYMMDDHH24MISS' ) 
    || '.log' logfile
  from dual;
set termout on;

--
spool &&logfile

--
prompt ... running remove_ws.sql

--
select current_timestamp "begin removal"
  from dual;

--
drop user ws cascade;

--
drop role ws_soap_user;
drop role ws_rest_user;
drop role ws_user;

--
select current_timestamp "complete removal"
  from dual;

--
spool off
exit

--
-- ... done!
--
