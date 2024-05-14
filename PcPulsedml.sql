
INSERT INTO Users (Username, Password, Email, UserType, UserImage)
VALUES ('Shree', 'password123', 'spacharya2537@gmail.com', 'Admin', 'shree.png');


INSERT INTO Categories (ShortName, LongName)
VALUES 
    ('Phones', 'Mobile Phones'),
    ('Laptops', 'Laptop Computers'),
    ('Tablets', 'Tablet Devices'),
    ('TVs', 'Television Sets'),
    ('Cameras', 'Digital Cameras'),
    ('Headphones', 'Audio Headphones'),
    ('Accessories', 'Electronic Accessories'),
    ('Smart Home', 'Smart Home Devices'),
    ('Gaming', 'Gaming Consoles'),
    ('Wearables', 'Wearable Devices');

INSERT INTO Products (Name, ShortDescription, LongDescription, Price, StockQuantity, ProductImage, CategoryID)
VALUES 
    ('iPhone 13', 'Latest iPhone model', 'The latest iPhone with advanced features.', 999.99, 50, 'iphone13.png', 1),
    ('Samsung Galaxy S21', 'Flagship Android phone', 'Powerful Android smartphone with great features.', 899.99, 40, 'SamsungGalaxyS21.png', 1),
    ('Google Pixel 6', 'High-quality camera phone', 'Focuses on photography with exceptional camera capabilities.', 799.99, 30, 'GooglePixel6.png', 1),
    ('OnePlus 9', 'Premium Android phone', 'Fast and reliable smartphone with a sleek design.', 899.99, 35, 'OnePlus9.png', 1),
    ('Xiaomi Mi 11', 'Affordable flagship phone', 'Powerful features at an affordable price.', 699.99, 45, 'XiaomiMi11.png', 1);


-- Inserting Laptops 
INSERT INTO Products (Name, ShortDescription, LongDescription, Price, StockQuantity, ProductImage, CategoryID)
VALUES 
    ('MacBook Pro', 'Powerful laptop for professionals', 'High-performance laptop for professionals and creators.', 1999.99, 30, 'MacBookPro.png', 2),
    ('Dell XPS 15', 'Premium Windows laptop', 'Thin and powerful laptop with a beautiful display.', 1599.99, 25, 'DellXPS15.png', 2),
    ('HP Spectre x360', 'Versatile 2-in-1 laptop', 'Flexible laptop with convertible design and excellent performance.', 1499.99, 20, 'HPSpectrex360.png', 2),
    ('Lenovo ThinkPad X1 Carbon', 'Business-class ultrabook', 'Durable and high-performance laptop for business users.', 1799.99, 15, 'LenovoThinkPadX1.png', 2),
    ('Asus ROG Zephyrus G14', 'Gaming powerhouse', 'Powerful gaming laptop with excellent performance.', 1799.99, 18, 'AsusROGZephyrusG14.png', 2);

-- Inserting Accessories
INSERT INTO Products (Name, ShortDescription, LongDescription, Price, StockQuantity, ProductImage, CategoryID)
VALUES 
    ('Wireless Earbuds', 'Bluetooth earphones', 'Wireless earbuds for music and calls.', 99.99, 50, 'WirelessEarbuds.png', 7),
    ('Laptop Backpack', 'Travel-friendly laptop bag', 'Stylish and protective backpack for laptops.', 49.99, 40, 'LaptopBackpack.png', 7),
    ('Phone Case', 'Protective smartphone cover', 'Durable case for safeguarding smartphones.', 19.99, 60, 'PhoneCase.png', 7),
    ('Portable Power Bank', 'External battery charger', 'Compact power bank for charging devices on-the-go.', 29.99, 35, 'PowerBank.png', 7),
    ('Gaming Mouse', 'High-precision gaming mouse', 'Advanced mouse designed for gaming performance.', 49.99, 25, 'GamingMouse.png', 7);


INSERT INTO Orders (UserID, OrderDate, TotalAmount)
VALUES 
    (1, '2023-12-05', 799.99),
    (1, '2023-12-06', 499.99),
    (1, '2023-12-07', 899.99);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Subtotal)
VALUES 
    (1, 1, 1, 999.99),
    (2, 2, 1, 1599.99),
    (3, 3, 1, 799.99); 

    UPDATE Products
SET ProductImage = REPLACE(ProductImage, '.png', '.jpg')
WHERE CategoryID = 1;