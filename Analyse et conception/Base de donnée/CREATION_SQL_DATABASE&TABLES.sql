-- CREATION BASE DE DONNEES DU PROJET C#

-- Creer une base de données (Ici = "MASTERCHEF")

-- Création table "Product"
CREATE DATABASE MASTERCHEF;
USE [MASTERCHEF]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](100) NOT NULL,
	[Stock] [int] NULL,
	[LastAdd] [int] NULL, --quantité ajoutée lors de la dernière livraison
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


-- Création table "Ingredients" (Zone référencant chaque aliment et sa zone)

USE [MASTERCHEF]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Ingredients](
	[IgId] [int] IDENTITY(1,1) NOT NULL,
	[IgName] [varchar](100) NOT NULL,
	[IgZone] [varchar](100) NOT NULL, --zone de stockage de l'ingrédient
PRIMARY KEY CLUSTERED 
(
	[IgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



-- Création table "DryArea" (Zone aliments secs)

USE [MASTERCHEF]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DryArea](
	[DryID] [int] IDENTITY(1,1) NOT NULL,
	[IncDate] [date] NULL, --la date d'incorporation du produit
	[RottenDate] [date] NULL, --date de péremption du produit
	[DryPID] [int] NULL,
	[StockD] [int] NULL, -- quantité en stock des produits secs
PRIMARY KEY CLUSTERED 
(
	[DryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[DryArea]  WITH CHECK ADD FOREIGN KEY([DryPID])
REFERENCES [dbo].[Product] ([ProductID])
GO


-- Création table "ColdArea" (Zone aliments froids)

USE [MASTERCHEF]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ColdArea](
	[ColdID] [int] IDENTITY(1,1) NOT NULL,
	[IncDate] [date] NULL,
	[RottenDate] [date] NULL,
	[ColdPID] [int] NULL,
	[StockC] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ColdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ColdArea]  WITH CHECK ADD FOREIGN KEY([ColdPID])
REFERENCES [dbo].[Product] ([ProductID])
GO


-- Création table "FrozenArea" (Zone aliments gelés)

USE [MASTERCHEF]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FrozenArea](
	[FrozenID] [int] IDENTITY(1,1) NOT NULL,
	[IncDate] [date] NULL,
	[RottenDate] [date] NULL,
	[FrozenPID] [int] NULL,
	[StockF] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FrozenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[FrozenArea]  WITH CHECK ADD FOREIGN KEY([FrozenPID])
REFERENCES [dbo].[Product] ([ProductID])
GO
USE [MASTERCHEF]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Recipy](
	[RecipyID] [int] IDENTITY(1,1) NOT NULL,
	[RecipyName] [char(100)] NULL,
	[Tomates] [int] NULL,
	[Salades] [int] NULL,
	[Pâtes] [int] NULL,
	[Seiche] [int] NULL,
	[Fromages] [int] NULL,
	[Courgettes] [int] NULL,
	[Aubergines] [int] NULL,
	[Mascarpone] [int] NULL,
	[PâtePizza] [int] NULL,
	[HuileOlive] [int] NULL,
	[Ail] [int] NULL,
	[Oignon] [int] NULL,
	[Jambon] [int] NULL,
	[Poulet] [int] NULL,
	[Farine] [int] NULL,
	[Beurre] [int] NULL,
	[Asperges] [int] NULL,
	[PommeDeTerre] [int] NULL,
	[Oeufs] [int] NULL,
	[Champignons] [int] NULL,
	[Riz] [int] NULL,
	[PetitsPois] [int] NULL,
	[Boeuf] [int] NULL,
	[Melon] [int] NULL,
	[Artichauds] [int] NULL,
	[ChouFleur] [int] NULL,
	[Pommes] [int] NULL,
	[Chocolat] [int] NULL,
	[Biscuit] [int] NULL,
	[Lait] [int] NULL,
	[Framboises] [int] NULL,
	[Citron] [int] NULL,
	[Amandes] [int] NULL,
	[Sucre] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
-- VIder les caches auto_increment et reini à 0. A UTILISER 1 FOIS PAR TEST

DBCC CHECKIDENT('Product', RESEED, 0)
DBCC CHECKIDENT('DryArea', RESEED, 0)
DBCC CHECKIDENT('ColdArea', RESEED, 0)
DBCC CHECKIDENT('FrozenArea', RESEED, 0)
DBCC CHECKIDENT('Recipy', RESEED, 0)
-- Remplir la table [Product]

INSERT INTO Product (ProductName,Stock,LastAdd)
VALUES
('Tomates',100,100),
('Salades',100,100),
('Pâtes',100,100),
('Seiche',100,100),
('Fromages',100,100),
('Courgettes',100,100),
('Aubergines',100,100),
('Mascarpone',100,100),
('PâtePizza',100,100),
('HuileOlive',100,100),
('Ail',100,100),
('Oignon',100,100),
('Jambon',100,100),
('Poulet',100,100),
('Farine',100,100),
('Beurre',100,100),
('Asperges',100,100),
('PommeDeTerre',100,100),
('Oeufs',100,100),
('Champignons',100,100),
('Riz',100,100),
('PetitsPois',100,100),
('Boeuf',100,100),
('Melon',100,100),
('Artichauds',100,100),
('ChouFleur',100,100),
('Pommes',100,100),
('Chocolat',100,100),
('Biscuit',100,100),
('Lait',100,100),
('Framboises',100,100),
('Citron',100,100),
('Amandes',100,100),
('Sucre',100,100)

-- Remplur la table [Ingredients]

insert into Ingredients values ('Tomates','C')  
insert into Ingredients values ('Salades','C')  
insert into Ingredients values ('Pâtes','D')  
insert into Ingredients values ('Seiche','F')  
insert into Ingredients values ('Fromages','C')  
insert into Ingredients values ('Courgettes','C')  
insert into Ingredients values ('Aubergines','C')  
insert into Ingredients values ('Mascarpone','C')  

-- Remplur la table [recipy]
INSERT INTO Recipy
VALUES
('Pizza Napolitaine',3,0,0,0,3,0,0,0,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
('Spaghettis Pesto',2,0,2,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
('Carbonara',0,0,2,0,1,0,0,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
('Involtini Poulet',0,0,0,0,2,0,0,0,0,0,0,0,0,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
('Gnocchis',0,0,0,0,1,0,0,0,0,0,1,0,0,0,2,1,0,0,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
('Risotto Champignon',0,0,0,0,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,2,3,0,0,0,0,0,0,0,0,0,0,0,0),
('Escalope Poulet',0,0,0,0,1,1,0,0,0,0,0,0,0,2,2,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0),
('Spaghettis Bolognaise',2,0,2,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0),
('Risotto Poulet',0,0,0,0,1,0,0,0,0,1,0,1,0,2,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0),
('Asperges Milanaise',0,2,0,0,1,0,0,0,0,0,0,0,0,0,0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
('Frittata',0,2,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
('Salade Melon Jambon',0,2,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0),
('Salade Artichauds Jambon',0,2,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0),
('Bouchees Mozarella',0,1,0,0,2,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0),
('Calzone',2,0,0,0,2,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
('Salade Tomates',2,2,0,0,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
('Salade ChouFleur',0,2,0,0,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0),
('Salade PommeDeTerre',0,2,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
('Aubergine Parmigiana',2,2,0,0,2,0,3,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
('Tarte aux Pommes',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,2,0,2,0,0,0,0,1),
('Torpa Caprese',0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,2,0,0,0,0,0,0,0,0,2,0,0,0,0,2,1),
('Fondant Chocolat',0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,2,0,0,0,0,0,0,0,0,3,0,0,0,0,0,1),
('Mousse Chocolat',0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,2,0,0,0,0,0,0,0,0,3,0,0,0,0,0,1),
('Tiramisu',0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,2,0,0,0,0,2),
('Tiramisu Framboises',0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,2,0,2,0,0,2),
('Panna Cotta Framboises',0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,2,2,0,0,1),
('Panna Cotta Citron',0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,2,0,2,0,1),
('Zaletti',0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,0,0,2,0,0,0,0,0,0,0,0,0,3,0,0,0,0,1),
('Amaretti',0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,0,0,2,0,0,0,0,0,0,0,0,0,3,0,0,0,2,1),
-- Trigger pour la table [Product]

/* Ce trigger lors de l'ajout d'un nouveau produit, nouvelle livraison, va mettre à jour le stock dans [Product] 
et ajouter l'enregistrement à la table de la zone attribuée (selon la zone du produit dans [Ingredients])
Pour chaque enregistrement et selon la zone, une date de mise en stock et de fin de validité est crée. 
L'ID (PID) dans chacune des tables correspondant aux zones se refère au produit (3 = Pâtes par exemple) */

USE [MASTERCHEF]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trgAfterUpdate] ON [dbo].[Product]
FOR UPDATE
AS
DECLARE
--declare les vars de la table dans laquelle on va inserter/deleter/updater
@ProductID int, 
@ProductName varchar(100),
@StockINI int,
@StockP int,
@PdZone varchar(100),
@dateTODAY date = getDate(),
@dateDRY date = DATEADD(year, +1, GETDATE()),
@dateCOLD date = DATEADD(day, +3, GETDATE()),
@dateFROZ date = DATEADD(month, +1, GETDATE())

-- Active only if the 'Stock' column is altered
IF UPDATE(Stock)
BEGIN
	SELECT @StockINI = LastAdd from INSERTED 
	SELECT @StockP = Stock from INSERTED
	SELECT @ProductID = ProductID from INSERTED 
	SELECT @ProductName = ProductName from INSERTED 
	SELECT @PdZone = IgZone from Geppetto.dbo.Ingredients where @ProductName = IgName;
	IF @PdZone = 'D'
		INSERT INTO DryArea Values (@dateTODAY,@dateDRY, @ProductID, @StockINI)

	ELSE IF @PdZone = 'C'
		INSERT INTO ColdArea Values (@dateTODAY,@dateCOLD, @ProductID, @StockINI)

	ELSE IF @PdZone = 'F'
		INSERT INTO FrozenArea Values (@dateTODAY,@dateFROZ, @ProductID, @StockINI)

	ELSE
		Print('Error in INSERT method')
END

GO

ALTER TABLE [dbo].[Product] ENABLE TRIGGER [trgAfterUpdate]
GO

-- Requête utilisé pour ajouter des éléments (Le reste se met à jour avec le trigger)

UPDATE Product SET Stock = Stock + 5 /* Paramètre 1 */, LastAdd = 5 /* Paramètre 1 */ where ProductName = 'SEICHE' /* Paramètre 2 */

--SUITE A VENIR LORS DE LA CREATION D'UN TRIGGER QUI SUPPRIME LORSQUE UN ELEMENT EST PERIMEE
--La requête qui recupère l'élément pour une recette ayant la date de peremption la plus proche

UPDATE DryArea SET StockD = StockD - 1 /* paramètre 1 */ WHERE DryPID = 3 /* paramètre 2 */ AND RottenDate = (SELECT MAX (RottenDate) FROM DryArea)
