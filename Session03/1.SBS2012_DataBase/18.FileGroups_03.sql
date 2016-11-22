USE TestFileGroup
GO
-------------------------
--استخراج اطلاعاتی درباره فایل گروه های مربوط به بانک اطلاعاتی جاری
SP_HELPFILEGROUP
GO
SELECT * FROM sys.filegroups
GO
--به فایل گروه پیش فرض توجه شود
GO
/*
--تغییر فایل گروه پیش فرض
ALTER DATABASE TestFileGroup MODIFY FILEGROUP ACCFG DEFAULT
*/
-------------------------
--اگر یک جدول به صورت عادی ایجاد کنیم در فایل گروه پیش فرض ایجاد خواهد شد
CREATE TABLE Hesab 
(
	Code INT PRIMARY KEY,
	NAME NVARCHAR(150),
	HesabType TINYINT,
) 
GO
--استخراج اطلاعاتی درباره جدول
SP_HELP Hesab
GO
--حذف جدول
DROP TABLE Hesab 
GO
--ایجاد جدول در یک فایل گروه دلخواه
CREATE TABLE Hesab 
(
	Code INT PRIMARY KEY,
	NAME NVARCHAR(150),
	Type TINYINT,
) ON ACCFG
GO
--استخراج اطلاعاتی درباره جدول
SP_HELP Hesab
GO
-------------------------
