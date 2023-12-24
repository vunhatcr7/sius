

use [master]
go

create database FPTBook
go

use FPTBook
go

create table tblCategory
(
   catID int identity(1, 1)not null primary key,
   catName nvarchar(50) not null unique,
   catDetails nvarchar(300) null
)
go

--create table tblStoreOwner
--(
--	ownerID varchar(5) not null primary key,
--	ownerName nvarchar(30) not null,
--	ownerAddress nvarchar(50) not null,
--	ownerPhone varchar(12) null,
--	ownerTaxCode varchar(12) null,
--	ownerDetails nvarchar(300) null
--)
--go

--create table tblPublisher
--(
--	publisherID int identity(1, 1) not null primary key,
--	publisherName nvarchar(30) not null unique,
--	publisherAddress nvarchar(50) null,
--	publisherDetails nvarchar(300) null
--)
--go

create table tblAuthor
(
	authorID varchar(5) not null primary key,
	authorName nvarchar(30) not null,
	authorAdress nvarchar(50) null,
	authorEmail varchar(30) null
)
go

create table tblBook
(
	bookID nvarchar(50) not null primary key,
	bookTitle nvarchar(30) not null,
	bookPrice int not null default(10),
	bookDetailes nvarchar(500) null,
	authorID varchar(5),
	catID int not null,
	constraint fk_authorID foreign key (authorID) references tblAuthor(authorID),
	constraint fk_catID foreign key(catID) references tblCategory(catID),
	
)
go
create table tblAdmin
(
adminID int identity (1,1) not null primary key,
adminName nvarchar(50),
userName nvarchar(50),
passwords nvarchar(500)
)
go
create table tblBill
(
billID int identity (1,1)not null primary key,
userID int, 
constraint fk_userID foreign key(userID) references tblUser(userID)
)
go
create table tblOrder
(
orderID int identity (1,1) not null primary key,
userID int, 
bookID nvarchar(50) not null, 
quantity float(30)null, 
--constraint fk_userID foreign key(userID) references tblUser(userID),
constraint fk_bookID foreign key(bookID) references tblBook(bookID)

)
go
--create table tblCategory
--(
--catID int not null primary key,
--catName nvarchar(50)not null
--)
--go
create table tblUser
(
userID int identity (1,1) not null primary key,
userName nvarchar(50) not null,
mail nvarchar(100),
phonenumber int
)
go
drop table tblCategory



--create table tblBookAuthor
--(
--	bookID varchar(10) not null,
--	authorID varchar(5) not null,
--	details nvarchar(300) null,
--	constraint pk_bookauthor primary key (bookID, authorID),
--	constraint fk_bookID foreign key (bookID) references tblBook(bookID),
--	constraint fk_authorID foreign key (authorID) references tblAuthor(authorID)
--)
--go

insert into tblBook (bookID, bookTitle, bookPrice, bookDetailes, catID)
values ('B1', N'C# 10 Pocket Reference', 119, N'Bạn đang tìm câu trả lời nhanh cho việc sử dụng C# 10? Hướng dẫn thực tế và tập trung chặt chẽ này sẽ cho bạn biết chính xác những gì bạn cần biết mà không cần phần giới thiệu dài dòng hoặc các mẫu rườm rà. Ngắn gọn và dễ duyệt, tài liệu tham khảo bỏ túi này là nguồn thông tin nhanh chóng lý tưởng. Nếu bạn biết Java, C++ hoặc phiên bản C# cũ hơn, hướng dẫn này sẽ giúp bạn tăng tốc nhanh chóng.',1),
       ('B2', N'Python for Excel', 130, N'Mặc dù Excel vẫn phổ biến trong thế giới kinh doanh, nhưng các diễn đàn phản hồi gần đây của Microsoft có rất nhiều yêu cầu đưa Python làm ngôn ngữ lập trình Excel. Trên thực tế, đó là tính năng hàng đầu được yêu cầu. Điều gì làm cho sự kết hợp này trở nên hấp dẫn? Trong hướng dẫn thực hành này, Felix Zumstein--người tạo ra xlwings, một gói nguồn mở phổ biến để tự động hóa Excel bằng Python--chỉ cho những người dùng Excel có kinh nghiệm cách tích hợp hai thế giới này một cách hiệu quả.',1),
	   ('B3', N'Pro C# 8 with .NET Core ', 450, N'Bao gồm các chương mới về .NET Core, bao gồm các dịch vụ web ASP.NET Core, ứng dụng web ASP.NET Core với MVC, Entity Framework Core và hiểu biết sâu sắc về triết lý đằng sau khung nhẹ mới',1),
	   ('B4', N'C++ Programming',  469, N'C++  là một ngôn ngữ lập trình cấp cao (cấp cao).   ngôn ngữ đa mẫu hình tự động có kiểu tĩnh, tượng vật liệu dữ liệu và lập trình đa hình, ngoài ra còn có các tính năng bổ sung tính năng, công cụ để thao tác .',1),
	   ('B5', N'Learning Python',  510, N'Tìm hiểu những kiến thức cơ bản về ngôn ngữ lập trình phổ biến nhất và phát triển nhanh nhất thế giới được sử dụng bởi các kỹ sư phần mềm, nhà phân tích, nhà khoa học dữ liệu và ...',1),
	   ('B6', N'Head First Android Development', 310, N'Nếu bạn có ý tưởng về một ứng dụng Android hấp dẫn, phiên bản cập nhật và sửa đổi đầy đủ này sẽ giúp bạn xây dựng ứng dụng hoạt động đầu tiên của mình trong nháy mắt.',1),
	   ('B7', N'Marchine Learning in PyThon',  480, N'Cuốn sách giáo khoa này tập trung vào các yếu tố cần thiết nhất và các kỹ thuật hữu ích thực tế trong Machine Learning Tạo ra sự cân bằng giữa lý thuyết về Machine Learning và cách triển khai trong Python Được bổ sung bằng các bài tập, đóng vai trò như một cuốn sách tự cung cấp kiến thức cho độc giả chưa có kinh nghiệm lập trình Python',1),
	   ('B8', N'Sharp Objects', 47, N'Vừa mới trải qua thời gian ngắn ở bệnh viện tâm thần, phóng viên Camille Preaker phải đối mặt với một nhiệm vụ rắc rối: cô phải trở về quê hương nhỏ bé của mình để điều tra vụ sát hại hai cô gái chưa đến tuổi vị thành niên. Trong nhiều năm, Camille hầu như không nói chuyện với người mẹ mắc chứng thần kinh, bệnh đạo đức giả của mình hoặc với người chị cùng cha khác mẹ mà cô hầu như không biết: một cô bé mười ba tuổi xinh đẹp đang nắm giữ thị trấn một cách kỳ lạ.',1),
	   ('B9', N'Tet o lang dia nguc',110, N'Tết Ở Làng Địa Ngục là một trong những tác phẩm kinh dị siêu linh đậm chất Việt Nam vô cùng ăn khách của tác giả Thảo Trang. Tác phẩm đưa người đọc về một thời xa xưa, với bối cảnh là một ngôi làng xa xôi trên ngọn núi hoang vu. Ở đó, người ta đón tết trong sự kinh hãi tột độ, hoài nghi đau đáu và giận dữ khôn cùng trước sự ập tới của những bi kịch tàn khốc !',1),
	   ('B10', N'Gió nam thầm thì', 190, N'Tôi muốn đến một nơi, ngoài âm thanh của gió và lá cây thì không còn tiếng ồn ào nào khác. Tôi muốn yêu một người, muốn yêu cô ấy, chỉ yêu cô ấy. Trái tim tôi giống như biển cả. Còn em, em là gió, là sóng, là thủy triều, là mặt trăng tròn trên biển. Khang Thành Là tình cảm chân thành duy nhất của tôi trong cuộc đời này.',1),
	   ('B11', N'Đừng nhìn lén nữa',  102, N'Đừng nhìn lén nữa, anh cũng thích em “ là một câu chuyện tình nhỏ đáng yêu, giống như một bức thư tình dịu dàng ngọt ngào mà Quất Tử Thần gửi riêng đến người bạn đời của mình, người được gọi với cái tên vô cùng đặc biệt “Tiên sinh Z”. Mười ba tuổi, Quất Tử quen biết anh, chàng thiếu niên nổi tiếng khắp trường vì vóc dáng cao lớn nổi bật của mình. Chỉ một lần gặp gỡ thoáng qua ở cửa phòng học, một đoạn “nghiệt duyên” cứ như vậy bắt đầu. ',1),
		('B12', N'Cung đường tội ác', 160, N'Bảy năm trước, điều tra viên Tracy Crosswhite trở lại thị trấn Cedar Grove để đưa kẻ giết hại em gái cô ra trước vành móng ngựa. Còn lần này, cô về lại quê nhà với hy vọng có được chút thời gian nghỉ ngơi và thu xếp cuộc sống mới cho bản thân, cho Dan chồng cô, và con gái mới sinh của họ.',1),
		('B13', N'Cho tôi xin một vé đi tuổi thơ',  81, N'Cho tôi xin một vé đi tuổi thơ là truyện ngắn của nhà văn Nguyễn Nhật Ánh. Tác phẩm là một trong những sáng tác thành công nhất của ông và nhận được Giải thưởng Văn học ASEAN của năm 2010. Nguyễn Nhật Ánh viết ở mặt sau cuốn sách: "Tôi viết cuốn sách này không dành cho trẻ em. Tôi viết cho những ai từng là trẻ em"',1),
		('B14', N'Bảy Bước Tới Mùa Hè ', 102, N'Câu chuyện về một mùa hè ngọt ngào, những trò chơi nghịch ngợm và bâng khuâng tình cảm tuổi mới lớn. Chỉ vậy thôi nhưng chứng tỏ tác giả đúng là nhà kể chuyện hóm hỉnh, khiến người đọc cuốn hút từ tựa đến trang cuối cùng, có lẽ chính vì giọng văn giản dị và trong trẻo của Nguyễn Nhật Ánh, và kết thúc thì có hậu đầy.',1),
		('B15', N'Ngồi Khóc Trên Cây',  110, N'Ngồi khóc trên cây đây là một tiểu thuyết dành cho thanh niên và thanh thiếu niên của nhà văn Nguyễn Nhật Ánh, xuất bản lần đầu tại Việt Nam vào ngày 27 tháng 6 năm 2013 bởi Nhà xuất bản Trẻ, với phần tranh minh họa do Đỗ Hoàng Tường thực hiện.',1),
		('B16', N'Làm Bạn Với Bầu Trời', 187, N'Một câu chuyện giản dị, chứa đầy bất ngờ cho tới trang cuối cùng. Và đẹp lộng lẫy, vì lòng vị tha và tình yêu thương, khiến mắt rưng rưng vì một nỗi mừng vui hân hoan. Cuốn sách như một đốm lửa thắp lên lòng khát khao sống tốt trên đời.',1),
		('B17', N'Tôi thấy hoa vàng trên cỏ xanh',  130, N'Tuổi thơ trong truyện Nguyễn Nhật Ánh không giống như bây giờ, khi người ta có nhiều thứ để chơi và nhiều nơi để lựa chọn. Tuổi thơ trong truyện Nguyễn Nhật Ánh là khi bạn còn hòa mình với thiên nhiên, khi bạn thấy góc vườn nhà mình sao rộng đến lạ. Cái thú vui của những đứa trẻ nghèo vùng quê và tuổi thơ ấy được phát họa trong tác phẩm Tôi Thấy Hoa Vàng Trên Cỏ Xanh.',1),
		('B18', N'Con Chó Nhỏ Mang Giỏ Hoa Hồng', 80, N'Cái tựa sách quả là có sức gợi tò mò. Tại sao lại là con chó mang giỏ hoa hồng? Nó mang cho bạn nó, hay cho những ai biết yêu thương nó? Câu chuyện về 5 chú chó đầy thú vị và cũng không kém cảm xúc lãng mạn- tác phẩm mới nhất của nhà văn bestseller Nguyễn Nhật Ánh sẽ khiến bạn thay đổi nhiều trong cách nhìn về loài thú cưng số 1 thế giới này.',1)

	   
go
insert into tblAdmin(adminName, userName,passwords)
values(N'DuyCook', N'Cook@gmail.com', N'123456'),
(N'Siuu', N'Siuu@gmail.com', N'123456'),
(N'Mitkon', N'Mitkon@gmail.com', N'123456'),
(N'Jadenn', N'Jadenn@gmail.com', N'123456')
select *from tblCategory
insert into tblAuthor(authorID, authorName,authorAdress,authorEmail)
values ('1','Nguyễn Nhật Ánh', ' P. Bến Nghé, Quận 1, Thành phố Hồ Chí Minh','NguyenNhatAnh@gmail.com')
insert into tblCategory( catName)
values ('Truyện Ngắn')
select * from tblBook