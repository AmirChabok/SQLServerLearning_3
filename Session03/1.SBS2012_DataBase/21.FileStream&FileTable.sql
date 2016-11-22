/*
--FileTables برای استفاده از ویژگی
--فعال شده باشدFileStream
*/
------------------------------------------------------------------------------
USE master
GO
-- Enabling FILESTREAM
--0=Disables FILESTREAM support for this instance.
--1=Enables FILESTREAM for Transact-SQL access.
--2=Enables FILESTREAM for Transact-SQL and Win32 streaming access.
EXEC sp_Configure filestream_access_level, 2
GO
RECONFIGURE
GO
------------------------------------------------------------------------------
CREATE DATABASE MyFileTableTest
ON  PRIMARY
(
    NAME = N'MyFileTableTest',
    FILENAME = N'D:\MyFileTableTest.mdf'
),
FILEGROUP FilestreamFG CONTAINS FILESTREAM
(
    NAME = MyFileStreamData,
    FILENAME= 'D:\FileTable'
)
LOG ON
(
    NAME = N'MyFileTableTest_Log',
    FILENAME = N'D:\MyFileTableTest_log.ldf'
)
WITH FILESTREAM
(
    NON_TRANSACTED_ACCESS = FULL,
    DIRECTORY_NAME = N'FileTable'
)
GO
------------------------------------------------------------------------------
USE MyFileTableTest
go

CREATE TABLE MyDocumentStore AS FileTable
WITH
(
    FileTable_Directory = 'MyDocumentStore',
    FileTable_Collate_Filename = database_default
);
GO
--SSMS بررسی در
GO
SELECT * FROM MyDocumentStore
GO