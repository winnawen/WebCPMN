USE [master]
GO
/****** Object:  Database [websystem]    Script Date: 2016/11/7 15:16:41 ******/
CREATE DATABASE [websystem]
GO
USE [websystem]
GO
/****** Object:  Table [dbo].[web_cp]    Script Date: 2016/11/7 15:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[web_cp](
	[cp_Id] [int] IDENTITY(1,1) NOT NULL,
	[cp_own] [nvarchar](32) NOT NULL,
	[cp_time] [date] NOT NULL,
	[cp_type] [nvarchar](10) NOT NULL,
	[cp_content] [text] NOT NULL,
 CONSTRAINT [PK__web_cp__1AEF00948C10E5A8] PRIMARY KEY CLUSTERED 
(
	[cp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[web_Duty]    Script Date: 2016/11/7 15:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[web_Duty](
	[duty_Id] [int] IDENTITY(1,1) NOT NULL,
	[duty_name] [nvarchar](16) NOT NULL,
	[duty_age] [int] NOT NULL,
	[duty_sex] [nchar](10) NOT NULL,
	[duty_phone] [char](14) NOT NULL,
	[duty_YGID] [nchar](32) NOT NULL,
	[duty_Dzero] [nvarchar](50) NOT NULL,
	[duty_time] [nvarchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[duty_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[web_fix]    Script Date: 2016/11/7 15:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[web_fix](
	[fix_Id] [int] IDENTITY(1,1) NOT NULL,
	[fix_type] [nvarchar](32) NOT NULL,
	[fix_name] [nvarchar](32) NOT NULL,
	[fix_time] [date] NOT NULL,
	[fix_own] [nvarchar](32) NOT NULL,
	[fix_address] [nvarchar](256) NOT NULL,
	[fix_price] [int] NULL,
 CONSTRAINT [PK__web_fix__C128EB7E7DAF3E1F] PRIMARY KEY CLUSTERED 
(
	[fix_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[web_news]    Script Date: 2016/11/7 15:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[web_news](
	[n_id] [int] IDENTITY(1,1) NOT NULL,
	[n_title] [nvarchar](200) NULL,
	[n_content] [text] NULL,
	[n_time] [datetime] NOT NULL,
	[u_id] [nvarchar](32) NULL,
	[n_type] [nvarchar](16) NULL,
 CONSTRAINT [PK__web_news__7371E14E440EC589] PRIMARY KEY CLUSTERED 
(
	[n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[web_owe]    Script Date: 2016/11/7 15:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[web_owe](
	[owe_id] [int] IDENTITY(1,1) NOT NULL,
	[owe_owner] [nvarchar](16) NOT NULL,
	[owe_stime] [date] NOT NULL,
	[owe_etime] [date] NOT NULL,
	[owe_phone] [char](11) NOT NULL,
	[owe_address] [nvarchar](256) NOT NULL,
	[owe_wprice] [float] NOT NULL,
	[owe_lprice] [float] NOT NULL,
	[owe_isowe] [char](2) NOT NULL,
	[u_id] [int] NOT NULL,
 CONSTRAINT [PK__web_owe__44CEAD341E16E7C1] PRIMARY KEY CLUSTERED 
(
	[owe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[web_owner]    Script Date: 2016/11/7 15:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[web_owner](
	[owner_Id] [int] IDENTITY(1,1) NOT NULL,
	[owner_name] [nvarchar](16) NOT NULL,
	[owner_sex] [nvarchar](2) NOT NULL,
	[owner_phone] [char](11) NOT NULL,
	[owner_address] [nvarchar](256) NOT NULL,
	[owner_idcard] [char](32) NOT NULL,
	[owner_mail] [nchar](32) NOT NULL,
 CONSTRAINT [PK__web_owne__3C48BADCE07B25FB] PRIMARY KEY CLUSTERED 
(
	[owner_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[web_park]    Script Date: 2016/11/7 15:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[web_park](
	[park_Id] [int] IDENTITY(1,1) NOT NULL,
	[park_owner] [nvarchar](16) NOT NULL,
	[park_phone] [char](11) NOT NULL,
	[park_CPH] [char](16) NOT NULL,
	[park_CWID] [char](11) NOT NULL,
	[park_time] [date] NOT NULL,
 CONSTRAINT [PK__web_park__E9C674D4F46362A1] PRIMARY KEY CLUSTERED 
(
	[park_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[web_staff]    Script Date: 2016/11/7 15:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[web_staff](
	[staff_id] [int] IDENTITY(1,1) NOT NULL,
	[staff_owner] [nvarchar](32) NOT NULL,
	[staff_age] [int] NOT NULL,
	[staff_sex] [nchar](3) NOT NULL,
	[staff_phone] [char](14) NOT NULL,
	[staff_YGID] [char](32) NOT NULL,
	[staff_salary] [float] NOT NULL,
	[staff_idcard] [char](20) NOT NULL,
	[staff_dutty] [nvarchar](2000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[web_tc]    Script Date: 2016/11/7 15:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[web_tc](
	[tc_Id] [int] IDENTITY(1,1) NOT NULL,
	[tc_own] [nvarchar](16) NOT NULL,
	[tc_phone] [nchar](11) NOT NULL,
	[tc_cp] [nvarchar](10) NOT NULL,
	[tc_idcard] [nchar](18) NOT NULL,
	[tc_time] [date] NOT NULL,
 CONSTRAINT [PK__web_tc__E61CFBB8EB802638] PRIMARY KEY CLUSTERED 
(
	[tc_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[web_usr]    Script Date: 2016/11/7 15:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[web_usr](
	[u_id] [int] IDENTITY(1,1) NOT NULL,
	[u_name] [nvarchar](16) NOT NULL,
	[u_idcard] [char](30) NULL,
	[u_sex] [char](2) NULL,
	[u_truename] [nvarchar](50) NULL,
	[u_pwd] [nvarchar](500) NOT NULL,
	[u_mail] [nvarchar](32) NOT NULL,
	[u_phone] [char](11) NOT NULL,
	[u_address] [nvarchar](200) NULL,
	[u_type] [char](1) NOT NULL,
	[lastIP] [varchar](15) NULL,
	[lastTime] [datetime] NULL,
	[thisIP] [varchar](15) NULL,
	[thisTime] [datetime] NULL,
 CONSTRAINT [PK__web_usr__B51D3DEAB5BBB1A5] PRIMARY KEY CLUSTERED 
(
	[u_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [websystem] SET  READ_WRITE 
GO
