USE [Curriculum]
GO
/****** Object:  StoredProcedure [dbo].[sp_gera_teoria]    Script Date: 11/04/2018 16:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_gera_teoria]
as
declare @suspeitos int,
 @cenas int,
 @evidencias int,
 @assassino int,
 @local int,
 @arma int
begin
	set @suspeitos = (select count(*) from dbo.Suspeitos)
	set @cenas = (select count(*) from dbo.Locais)
	set @evidencias = (select count(*) from dbo.Armas)
	set @assassino = (select ABS(Checksum(NewID()) % @suspeitos) + 1)
	set @local = (select ABS(Checksum(NewID()) % @cenas) + 1)
	set @arma = (select ABS(Checksum(NewID()) % @evidencias) + 1)
	update dbo.resposta
	set Suspeito = @assassino
	, Local = @local
	, Arma = @arma
end


GO
/****** Object:  StoredProcedure [dbo].[sp_listagem_armas]    Script Date: 11/04/2018 16:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[sp_listagem_armas]

as 
BEGIN
	   select ordem , descricao from dbo.Armas
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listagem_locais]    Script Date: 11/04/2018 16:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[sp_listagem_locais]

as 
BEGIN
	   select ordem , descricao from dbo.Locais
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listagem_suspeitos]    Script Date: 11/04/2018 16:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[sp_listagem_suspeitos]

as 
BEGIN
	   select ordem , descricao from dbo.Suspeitos
END
GO
/****** Object:  StoredProcedure [dbo].[sp_verifica_teoria]    Script Date: 11/04/2018 16:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_verifica_teoria]
@tentativa1 int, @tentativa2 int, @tentativa3 int
as
begin
	select dbo.fn_testarTeoria(@tentativa1,@tentativa2,@tentativa3)
end

GO
/****** Object:  Table [dbo].[Armas]    Script Date: 11/04/2018 16:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Armas](
	[armaID] [int] IDENTITY(1,1) NOT NULL,
	[ordem] [int] NULL,
	[descricao] [varchar](30) NULL,
 CONSTRAINT [pk_arma] PRIMARY KEY CLUSTERED 
(
	[armaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Locais]    Script Date: 11/04/2018 16:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Locais](
	[localID] [int] IDENTITY(1,1) NOT NULL,
	[ordem] [int] NULL,
	[descricao] [varchar](30) NULL,
 CONSTRAINT [pk_local] PRIMARY KEY CLUSTERED 
(
	[localID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Resposta]    Script Date: 11/04/2018 16:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resposta](
	[Suspeito] [int] NULL,
	[Local] [int] NULL,
	[Arma] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suspeitos]    Script Date: 11/04/2018 16:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suspeitos](
	[suspeitoID] [int] IDENTITY(1,1) NOT NULL,
	[ordem] [int] NULL,
	[descricao] [varchar](30) NULL,
 CONSTRAINT [pk_suspeito] PRIMARY KEY CLUSTERED 
(
	[suspeitoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[v_newid]    Script Date: 11/04/2018 16:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_newid]
AS
SELECT     NEWID() AS new_id
GO
SET IDENTITY_INSERT [dbo].[Armas] ON 

INSERT [dbo].[Armas] ([armaID], [ordem], [descricao]) VALUES (1, 1, N'Cajado Devastador')
INSERT [dbo].[Armas] ([armaID], [ordem], [descricao]) VALUES (2, 2, N'Phaser')
INSERT [dbo].[Armas] ([armaID], [ordem], [descricao]) VALUES (3, 3, N'Peixeira')
INSERT [dbo].[Armas] ([armaID], [ordem], [descricao]) VALUES (4, 4, N'Trezoitão')
INSERT [dbo].[Armas] ([armaID], [ordem], [descricao]) VALUES (5, 5, N'Sabre de Luz')
INSERT [dbo].[Armas] ([armaID], [ordem], [descricao]) VALUES (6, 6, N'Bomba')
SET IDENTITY_INSERT [dbo].[Armas] OFF
SET IDENTITY_INSERT [dbo].[Locais] ON 

INSERT [dbo].[Locais] ([localID], [ordem], [descricao]) VALUES (1, 1, N'Etérnia')
INSERT [dbo].[Locais] ([localID], [ordem], [descricao]) VALUES (2, 2, N'Vulcano')
INSERT [dbo].[Locais] ([localID], [ordem], [descricao]) VALUES (3, 3, N'Tatooine')
INSERT [dbo].[Locais] ([localID], [ordem], [descricao]) VALUES (4, 4, N'Springfield')
INSERT [dbo].[Locais] ([localID], [ordem], [descricao]) VALUES (5, 5, N'Gotham')
INSERT [dbo].[Locais] ([localID], [ordem], [descricao]) VALUES (6, 6, N'Nova York')
INSERT [dbo].[Locais] ([localID], [ordem], [descricao]) VALUES (7, 7, N'Sibéria')
INSERT [dbo].[Locais] ([localID], [ordem], [descricao]) VALUES (8, 8, N'Machu Pichu')
INSERT [dbo].[Locais] ([localID], [ordem], [descricao]) VALUES (9, 9, N'Show do Katinguele')
INSERT [dbo].[Locais] ([localID], [ordem], [descricao]) VALUES (10, 10, N'São Paulo')
SET IDENTITY_INSERT [dbo].[Locais] OFF
INSERT [dbo].[Resposta] ([Suspeito], [Local], [Arma]) VALUES (5, 6, 3)
SET IDENTITY_INSERT [dbo].[Suspeitos] ON 

INSERT [dbo].[Suspeitos] ([suspeitoID], [ordem], [descricao]) VALUES (1, 1, N'Esqueleto')
INSERT [dbo].[Suspeitos] ([suspeitoID], [ordem], [descricao]) VALUES (2, 2, N'Khan')
INSERT [dbo].[Suspeitos] ([suspeitoID], [ordem], [descricao]) VALUES (3, 3, N'Dart Vader')
INSERT [dbo].[Suspeitos] ([suspeitoID], [ordem], [descricao]) VALUES (4, 4, N'SideShow Bob')
INSERT [dbo].[Suspeitos] ([suspeitoID], [ordem], [descricao]) VALUES (5, 5, N'Coringa')
INSERT [dbo].[Suspeitos] ([suspeitoID], [ordem], [descricao]) VALUES (6, 6, N'Duende Verde')
SET IDENTITY_INSERT [dbo].[Suspeitos] OFF
