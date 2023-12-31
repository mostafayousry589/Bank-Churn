USE [master]
GO
/****** Object:  Database [Bank_Churn_DWH]    Script Date: 10/23/2023 7:02:07 PM ******/
CREATE DATABASE [Bank_Churn_DWH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bank_Churn_DWH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MU3\MSSQL\DATA\Bank_Churn_DWH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bank_Churn_DWH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MU3\MSSQL\DATA\Bank_Churn_DWH_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Bank_Churn_DWH] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bank_Churn_DWH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bank_Churn_DWH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bank_Churn_DWH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bank_Churn_DWH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bank_Churn_DWH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bank_Churn_DWH] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bank_Churn_DWH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bank_Churn_DWH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bank_Churn_DWH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bank_Churn_DWH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bank_Churn_DWH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bank_Churn_DWH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bank_Churn_DWH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bank_Churn_DWH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bank_Churn_DWH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bank_Churn_DWH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bank_Churn_DWH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bank_Churn_DWH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bank_Churn_DWH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bank_Churn_DWH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bank_Churn_DWH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bank_Churn_DWH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bank_Churn_DWH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bank_Churn_DWH] SET RECOVERY FULL 
GO
ALTER DATABASE [Bank_Churn_DWH] SET  MULTI_USER 
GO
ALTER DATABASE [Bank_Churn_DWH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bank_Churn_DWH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bank_Churn_DWH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bank_Churn_DWH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bank_Churn_DWH] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bank_Churn_DWH', N'ON'
GO
ALTER DATABASE [Bank_Churn_DWH] SET QUERY_STORE = OFF
GO
USE [Bank_Churn_DWH]
GO
/****** Object:  Table [dbo].[Dim_Active_Customer]    Script Date: 10/23/2023 7:02:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Active_Customer](
	[active_id] [varchar](50) NOT NULL,
	[active_category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Active_Customer] PRIMARY KEY CLUSTERED 
(
	[active_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Credit_Card]    Script Date: 10/23/2023 7:02:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Credit_Card](
	[credit_id] [varchar](50) NOT NULL,
	[category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Credit_Card] PRIMARY KEY CLUSTERED 
(
	[credit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_customer_info]    Script Date: 10/23/2023 7:02:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_customer_info](
	[customer_id] [varchar](50) NOT NULL,
	[sur_name] [varchar](50) NULL,
 CONSTRAINT [PK_customer_info] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Exit_customers]    Script Date: 10/23/2023 7:02:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Exit_customers](
	[exit_id] [varchar](50) NOT NULL,
	[exit_category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Exit_customers] PRIMARY KEY CLUSTERED 
(
	[exit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Gender]    Script Date: 10/23/2023 7:02:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Gender](
	[gender] [varchar](50) NOT NULL,
	[gender_category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[gender] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Geography]    Script Date: 10/23/2023 7:02:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Geography](
	[geography_id] [varchar](50) NOT NULL,
	[geography_location] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Geography] PRIMARY KEY CLUSTERED 
(
	[geography_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Bank_Churn]    Script Date: 10/23/2023 7:02:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Bank_Churn](
	[credit_score] [varchar](50) NULL,
	[age] [varchar](50) NULL,
	[tenure] [varchar](50) NULL,
	[balance] [varchar](50) NULL,
	[numOFproducts] [varchar](50) NULL,
	[Estimate_Salary] [varchar](50) NULL,
	[bank_DOJ] [varchar](50) NOT NULL,
	[ActiveID] [varchar](50) NOT NULL,
	[CreditID] [varchar](50) NOT NULL,
	[CustomerID] [varchar](50) NOT NULL,
	[exited] [varchar](50) NULL,
	[GenderID] [varchar](50) NOT NULL,
	[GeographyID] [varchar](50) NOT NULL,
	[rowID] [varchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Fact_Bank_Churn]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Bank_Churn_Dim_Active_Customer] FOREIGN KEY([ActiveID])
REFERENCES [dbo].[Dim_Active_Customer] ([active_id])
GO
ALTER TABLE [dbo].[Fact_Bank_Churn] CHECK CONSTRAINT [FK_Fact_Bank_Churn_Dim_Active_Customer]
GO
ALTER TABLE [dbo].[Fact_Bank_Churn]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Bank_Churn_Dim_Credit_Card] FOREIGN KEY([CreditID])
REFERENCES [dbo].[Dim_Credit_Card] ([credit_id])
GO
ALTER TABLE [dbo].[Fact_Bank_Churn] CHECK CONSTRAINT [FK_Fact_Bank_Churn_Dim_Credit_Card]
GO
ALTER TABLE [dbo].[Fact_Bank_Churn]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Bank_Churn_Dim_customer_info] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Dim_customer_info] ([customer_id])
GO
ALTER TABLE [dbo].[Fact_Bank_Churn] CHECK CONSTRAINT [FK_Fact_Bank_Churn_Dim_customer_info]
GO
ALTER TABLE [dbo].[Fact_Bank_Churn]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Bank_Churn_Dim_Exit_customers] FOREIGN KEY([exited])
REFERENCES [dbo].[Dim_Exit_customers] ([exit_id])
GO
ALTER TABLE [dbo].[Fact_Bank_Churn] CHECK CONSTRAINT [FK_Fact_Bank_Churn_Dim_Exit_customers]
GO
ALTER TABLE [dbo].[Fact_Bank_Churn]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Bank_Churn_Dim_Gender] FOREIGN KEY([GenderID])
REFERENCES [dbo].[Dim_Gender] ([gender])
GO
ALTER TABLE [dbo].[Fact_Bank_Churn] CHECK CONSTRAINT [FK_Fact_Bank_Churn_Dim_Gender]
GO
ALTER TABLE [dbo].[Fact_Bank_Churn]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Bank_Churn_Dim_Geography] FOREIGN KEY([GeographyID])
REFERENCES [dbo].[Dim_Geography] ([geography_id])
GO
ALTER TABLE [dbo].[Fact_Bank_Churn] CHECK CONSTRAINT [FK_Fact_Bank_Churn_Dim_Geography]
GO
USE [master]
GO
ALTER DATABASE [Bank_Churn_DWH] SET  READ_WRITE 
GO
