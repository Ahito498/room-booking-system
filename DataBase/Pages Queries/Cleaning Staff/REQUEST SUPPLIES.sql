DECLARE @NewRID            INT            =  ,
        @ExpectedDelivery Date            =  , 
        @SuppliesText          NVARCHAR(100)  =  ,
		@UserID INT =                            ;

	






INSERT INTO RequestOrReport
      (UserID,      Condition,  DayofR,         HourofR,        RType)
VALUES(@UserID,     'Pending',  CAST(GETDATE() AS date), CAST(GETDATE() AS time), 'SuppliesRequest');

SET @NewRID = SCOPE_IDENTITY();   


INSERT INTO SuppliesRequest (ID, ExpectedDeliveryDate, Supplies)
VALUES (@NewRID, @ExpectedDelivery, @SuppliesText);



