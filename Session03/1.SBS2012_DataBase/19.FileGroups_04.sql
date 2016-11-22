USE master
GO
CREATE DATABASE SampleDB 
GO
USE SampleDB
GO
SP_HELPFILE
GO
-------------------------
--استخراج اطلاعاتی درباره فایل گروه های مربوط به بانک اطلاعاتی جاری
SP_HELPFILEGROUP
SELECT * FROM sys.filegroups
GO
--قرار دارند Primary به طور پیش فرض جداول سیستمی در فایل گروه
GO
-------------------------
--ایجاد فایل گروه های مختلف
GO
--فایل گروه و دیتا فایل مربوط به سیستم حسابداری
ALTER DATABASE SampleDB ADD FILEGROUP AccFG 
GO
ALTER DATABASE SampleDB ADD FILE 
	(
		NAME=Acc_DATA,FILENAME='D:\Acc_DATA.ndf',
		SIZE=4MB,MAXSIZE=1GB,FILEGROWTH=20%
	)TO FILEGROUP AccFG
GO
--فایل گروه و دیتا فایل مربوط به سیستم حقوق و دستمزد
ALTER DATABASE SampleDB ADD FILEGROUP WageFG
GO
ALTER DATABASE SampleDB ADD FILE 
	(
		NAME=Wage_DATA,FILENAME='D:\Wage_DATA.ndf',
		SIZE=4MB,MAXSIZE=1GB,FILEGROWTH=20%
	)TO FILEGROUP WageFG
GO

--Blob فایل گروه و دیتا فایل مربوط به 
ALTER DATABASE SampleDB ADD FILEGROUP BlobFG
GO
ALTER DATABASE SampleDB ADD FILE 
	(
		NAME=Blob_DATA,FILENAME='D:\Blob_DATA.ndf',
		SIZE=4MB,MAXSIZE=1GB,FILEGROWTH=20%
	)TO FILEGROUP BlobFG
GO
--استخراج اطلاعاتی درباره فایل گروه های مربوط به بانک اطلاعاتی جاری
SP_HELPFILEGROUP
SELECT * FROM sys.filegroups
GO
-------------------------
--ایجاد یک جدول در سیستم حسابداری
CREATE TABLE Hesab 
(
	Code INT PRIMARY KEY,
	NAME NVARCHAR(150),
	HesabType TINYINT,
) ON AccFG
GO
--استخراج اطلاعاتی درباره جدول
SP_HELP Hesab
GO
--ایجاد یک جدول در سیستم حقوق و دستمزد
CREATE TABLE Employees 
(
	Code INT PRIMARY KEY,
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	Picture VARBINARY(MAX)
) ON WageFG TEXTIMAGE_ON BlobFG
GO
--استخراج اطلاعاتی درباره جدول
SP_HELP Employees