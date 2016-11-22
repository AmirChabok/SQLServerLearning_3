/*
بررسی نحوه فعال کردن فایل استریم
هنگام نصب
Configuration پس از نصب در قسمت 
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
-- Creating Database
CREATE DATABASE FS_Demo ON
    (NAME = FS_Demo, FILENAME = 'D:\FileStream\FS_Demo.mdf'),
    FILEGROUP Filstream_FG CONTAINS FILESTREAM(NAME = FS_Demo_Filestream, FILENAME = 'D:\FileStream\FS_Test')
    LOG ON  
    (NAME = FS_Demo_Log, FILENAME = 'D:\FileStream\FS_Demo_Log.ldf')
GO
-- Check File Explorer
--بررسي تنظيمات  امنيتي به ازاي شاخه مورد نظر
------------------------------------------------------------------------------
USE FS_Demo
GO
--به ساختار جدول دقت كنيد 
--GUID Required
CREATE TABLE MyGallery
(
	RowID INT IDENTITY PRIMARY KEY,
	Photo VARBINARY(MAX) FILESTREAM,
	RowGUID UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID() UNIQUE ROWGUIDCOL
)
GO
SP_HELP 'MyGallery'
GO
SELECT * FROM MyGallery
GO
------------------------------------------------------------------------------
--درج داده در جدول
-- Check File Explorer
SELECT  CAST('HELLO WORLD' AS VARBINARY(MAX))
GO
INSERT MyGallery(Photo) VALUES(CAST('Hello World' AS VARBINARY(MAX)))
INSERT MyGallery(Photo) VALUES(CAST('' AS VARBINARY(MAX)))
INSERT MyGallery(Photo) VALUES(NULL)
GO
SELECT * FROM MyGallery
-- Select With CAST
SELECT RowID, CAST(Photo AS VARCHAR(MAX)), RowGUID FROM MyGallery 
GO
--درج يك فايل باينري
-- Check File Explorer
INSERT MyGallery(Photo)
	SELECT BulkColumn FROM 
	OPENROWSET( BULK 'D:\TEMP\1.bmp', Single_Blob) AS tmp
GO
SELECT * FROM MyGallery
-- Select With CAST
SELECT RowID, CAST(Photo AS VARCHAR(MAX)), RowGUID FROM MyGallery 
GO
------------------------------------------------------------------------------
--Update Data
-- Check File Explorer
UPDATE MyGallery SET Photo = CAST('Hello Filestream' AS VARBINARY(MAX))
	WHERE RowID = 1
GO
SELECT * FROM MyGallery
-- Select With CAST
SELECT RowID, CAST(Photo AS VARCHAR(MAX)), RowGUID FROM MyGallery 
------------------------------------------------------------------------------
--Delete Data
DELETE FROM MyGallery WHERE RowID=1
GO
SELECT * FROM MyGallery
-- Check File Explorer
--فايل ركورد مورد نظر به زودي از ديسك پاك نمي شود
CHECKPOINT 
GO
------------------------------------------------------------------------------
--TRUNCATE TABLE
TRUNCATE TABLE MyGallery
GO
SELECT * FROM MyGallery
-- Check File Explorer
--فايل ركوردهاي مورد نظر به زودي از ديسك پاك نمي شود
CHECKPOINT 
GO
