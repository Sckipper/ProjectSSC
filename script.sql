USE [ShopApp]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 13-12-2017 21:38:19 ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[ShopApp]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
/****** Object:  Table [dbo].[Angajat]    Script Date: 13-12-2017 21:38:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Angajat](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MagazinID] [int] NOT NULL,
	[Nume] [nvarchar](50) NULL,
	[Prenume] [nvarchar](50) NOT NULL,
	[CNP] [numeric](13, 0) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Parola] [nvarchar](512) NOT NULL,
	[DataAngajare] [date] NOT NULL,
	[Salariu] [int] NOT NULL,
	[Functie] [nvarchar](50) NULL,
 CONSTRAINT [PK_Angajat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorie]    Script Date: 13-12-2017 21:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorie](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategorieID] [int] NULL,
	[Nume] [nvarchar](50) NOT NULL,
	[Cod] [nvarchar](50) NOT NULL,
	[Descriere] [nvarchar](1024) NULL,
	[Imagine] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categorie] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Furnizor]    Script Date: 13-12-2017 21:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Furnizor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nume] [nvarchar](50) NOT NULL,
	[Adresa] [nvarchar](50) NOT NULL,
	[Oras] [nvarchar](50) NOT NULL,
	[Telefon] [numeric](10, 0) NOT NULL,
 CONSTRAINT [PK_Furnizor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Livrare]    Script Date: 13-12-2017 21:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Livrare](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FurnizorID] [int] NOT NULL,
	[MagazinID] [int] NOT NULL,
	[DataSolicitare] [date] NOT NULL,
	[DataLivrare] [date] NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Descriere] [nvarchar](512) NULL,
	[Pret] [int] NOT NULL,
 CONSTRAINT [PK_Livrare] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Magazin]    Script Date: 13-12-2017 21:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Magazin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adresa] [nvarchar](128) NULL,
	[Denumire] [nvarchar](50) NOT NULL,
	[Imagine] [nvarchar](50) NOT NULL,
	[Oras] [nvarchar](50) NULL,
 CONSTRAINT [PK_Magazin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produs]    Script Date: 13-12-2017 21:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategorieID] [int] NOT NULL,
	[MagazinID] [int] NOT NULL,
	[Denumire] [nvarchar](50) NOT NULL,
	[Greutate] [nvarchar](50) NULL,
	[Pret] [float] NULL,
	[Cantitate] [int] NOT NULL,
	[DataExpirate] [date] NULL,
	[Descriere] [nvarchar](1024) NULL,
	[Imagine] [nvarchar](50) NULL,
 CONSTRAINT [PK_Produs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Angajat] ON 

INSERT [dbo].[Angajat] ([ID], [MagazinID], [Nume], [Prenume], [CNP], [Email], [Parola], [DataAngajare], [Salariu], [Functie]) VALUES (1, 1, N'Radut', N'Daniel', CAST(1231231231231 AS Numeric(13, 0)), N'admin@shopzapp.com', N'admin', CAST(N'2017-12-01' AS Date), 2300, N'Admin')
INSERT [dbo].[Angajat] ([ID], [MagazinID], [Nume], [Prenume], [CNP], [Email], [Parola], [DataAngajare], [Salariu], [Functie]) VALUES (2, 1, N'Angajat', N'Ang', CAST(1234567891234 AS Numeric(13, 0)), N'angajat@shopzapp.com', N'angajat', CAST(N'2017-12-06' AS Date), 1600, N'Angajat')
INSERT [dbo].[Angajat] ([ID], [MagazinID], [Nume], [Prenume], [CNP], [Email], [Parola], [DataAngajare], [Salariu], [Functie]) VALUES (3, 1, N'Manager', N'Man', CAST(1234567890123 AS Numeric(13, 0)), N'manager@shopzapp.com', N'manager', CAST(N'2017-12-06' AS Date), 1800, N'Manager magazin')
INSERT [dbo].[Angajat] ([ID], [MagazinID], [Nume], [Prenume], [CNP], [Email], [Parola], [DataAngajare], [Salariu], [Functie]) VALUES (4, 1, N'Furnizor', N'Furn', CAST(1234567890012 AS Numeric(13, 0)), N'furnizor@shopzapp.com', N'furnizor', CAST(N'2017-12-06' AS Date), 1800, N'Furnizor')
INSERT [dbo].[Angajat] ([ID], [MagazinID], [Nume], [Prenume], [CNP], [Email], [Parola], [DataAngajare], [Salariu], [Functie]) VALUES (5, 1, N'Sef', N'Sef', CAST(1234567891123 AS Numeric(13, 0)), N'sef@shopzapp.com', N'sef', CAST(N'2017-09-07' AS Date), 2600, N'Sef magazin')
INSERT [dbo].[Angajat] ([ID], [MagazinID], [Nume], [Prenume], [CNP], [Email], [Parola], [DataAngajare], [Salariu], [Functie]) VALUES (1002, 1, N'Popescu', N'Ionel', CAST(1801211230541 AS Numeric(13, 0)), N'angajat2@shopzapp.com', N'angajat', CAST(N'2017-03-22' AS Date), 1600, N'Angajat')
SET IDENTITY_INSERT [dbo].[Angajat] OFF
SET IDENTITY_INSERT [dbo].[Categorie] ON 

INSERT [dbo].[Categorie] ([ID], [CategorieID], [Nume], [Cod], [Descriere], [Imagine]) VALUES (1, NULL, N'Legume, fructe si flori', N'1', N'Legume, fructe si flori', NULL)
INSERT [dbo].[Categorie] ([ID], [CategorieID], [Nume], [Cod], [Descriere], [Imagine]) VALUES (2, NULL, N'Bauturi alcoolice si nealcoolice', N'10', N'Bauturi alcoolice si nealcoolice', N'img_bauturi_alcoolice_si_nealcoolice')
INSERT [dbo].[Categorie] ([ID], [CategorieID], [Nume], [Cod], [Descriere], [Imagine]) VALUES (3, NULL, N'Dulciuri', N'2', N'Tot felul de dulciuri', NULL)
INSERT [dbo].[Categorie] ([ID], [CategorieID], [Nume], [Cod], [Descriere], [Imagine]) VALUES (4, NULL, N'Pescarie, Branzeturi, Mezeluri', N'2', N'Descriere categorie pescarie branzeturi si mezeluri', NULL)
INSERT [dbo].[Categorie] ([ID], [CategorieID], [Nume], [Cod], [Descriere], [Imagine]) VALUES (5, 1, N'Rosii', N'1-1-3', N'Descriere Rosii', NULL)
INSERT [dbo].[Categorie] ([ID], [CategorieID], [Nume], [Cod], [Descriere], [Imagine]) VALUES (6, 2, N'Suc', N'10-2-2', N'Sucuri', N'img_suc')
INSERT [dbo].[Categorie] ([ID], [CategorieID], [Nume], [Cod], [Descriere], [Imagine]) VALUES (7, 3, N'Chipsuri', N'2-3-4', N'Descriere chipsuri', NULL)
INSERT [dbo].[Categorie] ([ID], [CategorieID], [Nume], [Cod], [Descriere], [Imagine]) VALUES (8, 1, N'Mere', N'1-2-3', N'Diverse sortimente de mere', NULL)
INSERT [dbo].[Categorie] ([ID], [CategorieID], [Nume], [Cod], [Descriere], [Imagine]) VALUES (9, 1, N'Portocale', N'1-2-3', N'Descriere portocale', NULL)
INSERT [dbo].[Categorie] ([ID], [CategorieID], [Nume], [Cod], [Descriere], [Imagine]) VALUES (10, 1, N'Margarete', N'1-3-3', N'Flori', NULL)
INSERT [dbo].[Categorie] ([ID], [CategorieID], [Nume], [Cod], [Descriere], [Imagine]) VALUES (11, 2, N'Whiskey', N'10-1-2', N'Bauturi spirtoase', NULL)
INSERT [dbo].[Categorie] ([ID], [CategorieID], [Nume], [Cod], [Descriere], [Imagine]) VALUES (12, 2, N'Bere', N'10-1-2', N'Descriere Bere', N'img_bere')
INSERT [dbo].[Categorie] ([ID], [CategorieID], [Nume], [Cod], [Descriere], [Imagine]) VALUES (13, 2, N'Apa', N'10-1-2', N'Descriere apa', N'img_apa')
INSERT [dbo].[Categorie] ([ID], [CategorieID], [Nume], [Cod], [Descriere], [Imagine]) VALUES (14, 3, N'Ciocolata', N'10-1-2', N'Cioco', NULL)
INSERT [dbo].[Categorie] ([ID], [CategorieID], [Nume], [Cod], [Descriere], [Imagine]) VALUES (15, 3, N'Biscuiti', N'2-2-4', N'Descriere biscuiti', NULL)
INSERT [dbo].[Categorie] ([ID], [CategorieID], [Nume], [Cod], [Descriere], [Imagine]) VALUES (16, 3, N'Croissant', N'2-4-4', N'Croissant-uri', NULL)
INSERT [dbo].[Categorie] ([ID], [CategorieID], [Nume], [Cod], [Descriere], [Imagine]) VALUES (17, 4, N'Pesti', N'6-1-3', N'Descriere pesti', NULL)
INSERT [dbo].[Categorie] ([ID], [CategorieID], [Nume], [Cod], [Descriere], [Imagine]) VALUES (18, 4, N'Branza', N'6-2-3', N'Branzeturi', NULL)
INSERT [dbo].[Categorie] ([ID], [CategorieID], [Nume], [Cod], [Descriere], [Imagine]) VALUES (19, 4, N'Mezeluri', N'6-3-3', N'Descriere mezeluri', NULL)
SET IDENTITY_INSERT [dbo].[Categorie] OFF
SET IDENTITY_INSERT [dbo].[Furnizor] ON 

INSERT [dbo].[Furnizor] ([ID], [Nume], [Adresa], [Oras], [Telefon]) VALUES (1, N'Coca-Cola', N'Șoseaua București Nord ', N'Bucuresti', CAST(733526118 AS Numeric(10, 0)))
INSERT [dbo].[Furnizor] ([ID], [Nume], [Adresa], [Oras], [Telefon]) VALUES (2, N'S.C. Produse Noi S.R.L', N'Bucuresti str. Cap.Gh.Ion', N'Bucuresti ', CAST(733263325 AS Numeric(10, 0)))
INSERT [dbo].[Furnizor] ([ID], [Nume], [Adresa], [Oras], [Telefon]) VALUES (3, N'S.C. Legume si Fructe', N'Ploiesti str. Mihai Bravu', N'Ploiesti', CAST(782115235 AS Numeric(10, 0)))
SET IDENTITY_INSERT [dbo].[Furnizor] OFF
SET IDENTITY_INSERT [dbo].[Livrare] ON 

INSERT [dbo].[Livrare] ([ID], [FurnizorID], [MagazinID], [DataSolicitare], [DataLivrare], [Status], [Descriere], [Pret]) VALUES (1, 1, 1, CAST(N'2017-12-07' AS Date), NULL, N'Initiata', N'Livrare dimineata', 4000)
INSERT [dbo].[Livrare] ([ID], [FurnizorID], [MagazinID], [DataSolicitare], [DataLivrare], [Status], [Descriere], [Pret]) VALUES (2, 2, 1, CAST(N'2017-12-13' AS Date), NULL, N'Procesare', N'Livrare la ora 16', 2500)
SET IDENTITY_INSERT [dbo].[Livrare] OFF
SET IDENTITY_INSERT [dbo].[Magazin] ON 

INSERT [dbo].[Magazin] ([ID], [Adresa], [Denumire], [Imagine], [Oras]) VALUES (1, N'Bucuresti', N'ShopZapp', N'img_ShopZapp', N'Bucuresti')
SET IDENTITY_INSERT [dbo].[Magazin] OFF
SET IDENTITY_INSERT [dbo].[Produs] ON 

INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (1, 10, 1, N'Margarete de gradina', NULL, 4, 40, NULL, N'Margarete decorative', NULL)
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (2, 10, 1, N'Margarete de ocazie', NULL, 5, 20, NULL, N'Margarete', NULL)
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (3, 11, 1, N'Jack Daniel''s', N'500 ml', 60, 20, NULL, N'Bautura Alcoolica', NULL)
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (4, 11, 1, N'Ballentines', N'500 ml', 50, 22, NULL, N'Bautura Alcoolica', NULL)
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (5, 13, 1, N'Bucovina', N'1 L', 2.8, 50, CAST(N'2019-08-24' AS Date), N'Apa minerala naturala carbogazificata Bucovina are un continut redus de sodiu, gust placut si echilibrat, precum si proprietati deosebite de a lega si retine dioxidul de carbon, asigurand tranzitul de electroliti in organism, esentiali functionarii normale a acestuia', N'img_bucovina')
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (6, 14, 1, N'Milka', N'100 g', 3.8, 50, CAST(N'2018-04-04' AS Date), N'Descriere ciocolata Milka', NULL)
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (7, 14, 1, N'Poiana', N'500 g', 20, 30, CAST(N'2019-08-24' AS Date), N'Descriere ciocolata Poiana', NULL)
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (8, 8, 1, N'Mere rosii', NULL, 3, 50, NULL, N'Descriere mere rosii', N'img_mere_rosii')
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (9, 8, 1, N'Mere verzi', NULL, 4, 50, NULL, N'Descriere mere verzi', NULL)
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (10, 17, 1, N'Somn', NULL, 12, 50, NULL, N'Descriere somn', NULL)
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (11, 5, 1, N'Rosii', NULL, 4, 90, CAST(N'2017-07-13' AS Date), N'Rosii romanesti', NULL)
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (12, 6, 1, N'Pepsi', N'2 L', 6.5, 60, CAST(N'2018-04-05' AS Date), N'Bautura carbogazoasa', N'img_pepsi')
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (13, 6, 1, N'Coca-Cola', N'1 L', 4.5, 60, CAST(N'2019-01-07' AS Date), N'Bautura carbogazoasa', N'img_coca_cola')
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (14, 12, 1, N'Stella Artois', N'2 L', 7, 40, CAST(N'2020-04-21' AS Date), N'Bautura alcoolica', N'img_stella_artois')
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (15, 15, 1, N'Biscuiti Petit Beurre', N'100 g', 5, 20, CAST(N'2018-04-06' AS Date), N'Biscuiti', NULL)
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (16, 16, 1, N'7 Days', N'60 g', 2.5, 40, CAST(N'2018-10-10' AS Date), N'Descriere 7 Days', NULL)
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (17, 18, 1, N'Branza de oaie', NULL, 10, 60, CAST(N'2017-08-10' AS Date), N'Descriere Branza de oaie', NULL)
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (18, 9, 1, N'Portocale', NULL, 3, 50, CAST(N'2017-09-01' AS Date), N'Descriere portocale', NULL)
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (19, 18, 1, N'Cod', NULL, 11, 50, NULL, N'descriere Cod', NULL)
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (20, 6, 1, N'Prigat', N'2 L', 4.9, 50, CAST(N'2018-10-10' AS Date), N'Suc de portocale necarbogazos', N'img_prigat')
INSERT [dbo].[Produs] ([ID], [CategorieID], [MagazinID], [Denumire], [Greutate], [Pret], [Cantitate], [DataExpirate], [Descriere], [Imagine]) VALUES (21, 7, 1, N'Lay''s', N'240 g', 5, 40, CAST(N'2018-07-12' AS Date), N'Chipsuri sarate', NULL)
SET IDENTITY_INSERT [dbo].[Produs] OFF
ALTER TABLE [dbo].[Angajat]  WITH CHECK ADD  CONSTRAINT [FK_Angajat_Magazin] FOREIGN KEY([MagazinID])
REFERENCES [dbo].[Magazin] ([ID])
GO
ALTER TABLE [dbo].[Angajat] CHECK CONSTRAINT [FK_Angajat_Magazin]
GO
ALTER TABLE [dbo].[Livrare]  WITH CHECK ADD  CONSTRAINT [FK_Livrare_Furnizor] FOREIGN KEY([FurnizorID])
REFERENCES [dbo].[Furnizor] ([ID])
GO
ALTER TABLE [dbo].[Livrare] CHECK CONSTRAINT [FK_Livrare_Furnizor]
GO
ALTER TABLE [dbo].[Livrare]  WITH CHECK ADD  CONSTRAINT [FK_Livrare_Magazin] FOREIGN KEY([MagazinID])
REFERENCES [dbo].[Magazin] ([ID])
GO
ALTER TABLE [dbo].[Livrare] CHECK CONSTRAINT [FK_Livrare_Magazin]
GO
ALTER TABLE [dbo].[Produs]  WITH CHECK ADD  CONSTRAINT [FK_Produs_Magazin] FOREIGN KEY([MagazinID])
REFERENCES [dbo].[Magazin] ([ID])
GO
ALTER TABLE [dbo].[Produs] CHECK CONSTRAINT [FK_Produs_Magazin]
GO
ALTER TABLE [dbo].[Produs]  WITH CHECK ADD  CONSTRAINT [FK_Produs_Produs] FOREIGN KEY([CategorieID])
REFERENCES [dbo].[Categorie] ([ID])
GO
ALTER TABLE [dbo].[Produs] CHECK CONSTRAINT [FK_Produs_Produs]
GO
