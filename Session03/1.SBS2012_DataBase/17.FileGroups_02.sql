USE master
GO
--ایجاد بانک اطلاعاتی تستی
CREATE DATABASE TestFileGroup
GO
USE TestFileGroup
GO
SP_HELPFILE
GO
-------------------------
--استخراج اطلاعاتی درباره فایل گروه های مربوط به بانک اطلاعاتی جاری
SP_HELPFILEGROUP
GO
SELECT * FROM sys.filegroups
GO
-------------------------
--اضافه کردن یک فایل گروه به بانک اطلاعاتی مورد نظر
ALTER DATABASE TestFileGroup ADD FILEGROUP ACCFG
GO
-------------------------
--استخراج اطلاعاتی درباره فایل گروه های مربوط به بانک اطلاعاتی جاری
SP_HELPFILEGROUP
GO
SELECT * FROM sys.filegroups
GO
-------------------------
--تخصیص یک دیتا فایل به فایل گروه مورد نظر
ALTER DATABASE TestFileGroup  ADD FILE 
	(
		NAME=Acc,FILENAME='D:\ACC.ndf',
		SIZE=3MB,MAXSIZE=UNLIMITED,FILEGROWTH=10%
	)TO FILEGROUP ACCFG

GO
-------------------------
--استخراج اطلاعاتی درباره فایل گروه های مربوط به بانک اطلاعاتی جاری
SP_HELPFILEGROUP
GO
SELECT * FROM sys.filegroups
GO
-------------------------
