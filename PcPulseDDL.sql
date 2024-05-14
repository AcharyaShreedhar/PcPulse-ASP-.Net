
/* Creating Users Table */

CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL,
    Password NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    UserType NVARCHAR(50) CHECK (UserType IN ('Customer', 'Admin')) NOT NULL,
    UserImage NVARCHAR(255)
);

/* Category Table */

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    ShortName NVARCHAR(50) NOT NULL,
    LongName NVARCHAR(100) NOT NULL
);


/* Products Table */

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    ShortDescription NVARCHAR(255),
    LongDescription NVARCHAR(MAX),
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    ProductImage NVARCHAR(255),
    CategoryID INT,
    CONSTRAINT FK_CategoryID FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

/* Order Table */

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    CONSTRAINT FK_UserID FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

select * from Orders;


/* Order Details */

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Subtotal DECIMAL(10, 2),
    CONSTRAINT FK_OrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_ProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);







