USE [GymDB];
GO

-- GymTable Datas
INSERT INTO GymTable (GymId, GymName, GymType, GymDescription)
VALUES
(36482, 'Soofit', 'Yoga', 'A gym for women'),
(35268, 'LionGym', 'Fitness', 'Heavy lifting sport center');

GO

-- LoginTable Datas
INSERT INTO LoginTable (LoginId, LoginUsername, LoginPassword)
VALUES
(2204012, 'Ceensby', 'Cansu12'),
(2204013, 'Mashiro', 'RuyaKk');

GO

-- PaymentTable Datas
INSERT INTO PaymentTable (PaymentId, CostumerId, PaymentDate, PaymentDescription, PaymentAmount)
VALUES
(222321, 32364273, '2024-07-12', 'Last payment on 12 month gym sub', 2300),
(222416, 32563284, '2021-11-11', 'Second payment on gym', 1980);

GO

-- PermissionTable Datas
INSERT INTO PermissionTable (PermissionId, PermissionModule, PermissionName, PermissionDescription)
VALUES
(4545, 'Reports', 'ReportControl', 'To make reports'),
(5653, 'Payments', 'PaymentTake', 'Take payment from customers');

GO

-- TrainerTable Datas
INSERT INTO TrainerTable (TrainerId, TrainerName, TrainerSurname, TrainerPassword, TrainerPhone, TrainerAddress)
VALUES
(2348, 'Yelda', 'Akdoðan', 'Yelcam11', 38530293, 'Ýstanbul/Kadýköy');

GO

-- UserTable Datas
INSERT INTO UserTable (UserId, UserName, UserSurname, UserPhone, UserEmail, UserAddress)
VALUES
(220401, 'Cansu', 'Bektaþ', 53236387, 'Cbektas12@outlook.com', 'Ýstanbul/Maltepe'),
(220301, 'Rüya', 'Karadað', 53162584, 'Ruyakaradag@gmail.com', 'Ýstanbul/Baþakþehir');

GO