--Mid-Term: Thuc tap CSDL 
--Class ID: 130989 

--Student ID: 20204966

--Student Name: tran huu hien 

--Source File: tranhuuhien_20204966_Midterm.sql 
--cau 1
create table GiangVien (
   GV# int primary key,
   HoTen nvarchar(30),
   NamSinh int,
   DiaChi nvarchar(50)
);

create table DeTai (
   DT# int primary key,
   TenDT nvarchar(50),
   TheLoai nvarchar(20)
);

create table SinhVien (
   SV# int primary key,
   TenSV nvarchar(30),
   NgaySinh datetime,
   QueQuan nvarchar(20),
   Lop nvarchar(20)
);

create table HuongDan (
  GV# int,
  DT# int,
  SV# int,
  NamThucHien int,
  KetQua float
foreign key (GV#) references GiangVien(GV#) on update cascade on delete cascade,
foreign key (DT#) references DeTai(DT#) on update cascade on delete cascade,
foreign key (SV#) references SinhVien(SV#) on update cascade on delete cascade
);
insert into GiangVien values 
(1, N'Nguyễn Văn A', 1970, N'Phạm Hùng, Hà Nội'),
(2, N'Nguyễn Văn B', 1980, N'Giải Phóng, Nam Định'),
(3, N'Nguyễn Văn C', 1975, N'Trương Định, Hà Nội'),
(4, N'Nguyễn Văn D', 1965, N'Nam Phong, Hải Phòng'),
(5, N'Nguyễn Văn E', 1981, N'Trại Cá, Hà Nam'),
(6, N'Nguyễn Văn F', 1973, N'Nguyễ Văn Cừ, Hà Nội'),
(7, N'Nguyễn Văn G', 1969, N'Trương Định, Bắc Giang'),
(8, N'Nguyễn Văn H', 1982, N'Phạm Hùng, Hải Phòng'),
(9, N'Nguyễn Văn I', 1970, N'Nam Dương, Hưng Yên'),
(10, N'Nguyễn Văn K', 1977, N'Phạm Hưng, hà Nội')
insert into DeTai values
(1, N'De tai a', N'Ứng dụng'),
(2,N'De tai b', N'Ứng dụng'),
(3,N'De tai c', N'Khoa học'),
(4,N'De tai d', N'Nghiên cứu'),
(5,N'De tai e', N'Ứng dụng'),
(6,N'De tai f', N'Khoa học'),
(7,N'De tai g', N'Ứng dụng'),
(8,N'De tai h', N'Nghiên cứu'),
(9,N'De tai i', N'Ứng dụng'),
(10,N'De tai k', N'Thử nghiệm')

insert into SinhVien values
(1,N'Trần Hữu a', 2002-05-01, N'Hà Nội', N'A1'),
(2,N'Trần Hữu b', 2003-06-12, N'Nam Định', N'A2'),
(3,N'Trần Hữu c', 1996-04-11, N'Hà Nam', N'A1'),
(4,N'Trần Hữu d', 2001-05-02, N'Hải Dương', N'A3'),
(5,N'Trần Hữu e', 2002-05-06, N'Hà Nam', N'A4'),
(6,N'Trần Hữu f', 2001-06-01, N'Thái Bình', N'A1'),
(7,N'Trần Hữu g', 1999-07-01, N'Hưng Yên', N'A2'),
(8,N'Trần Hữu h', 2002-02-01, N'Ninh Bình', N'A5'),
(9,N'Nguyễn Xuân Dũng', 20021-03-01, N'Hà Nam', N'A5'),
(10,N'Trần Hữu a', 2000-09-02, N'Hà Nội', N'A2'),
(11,N'Nguyễn Văn Nam', 2002-10-01, N'Bắc Giang', N'A1'),
(12,N'Trần Hữu a', 2000-09-02, N'Nam Định', N'A3'),
(13,N'Trần Hữu a', 1998-012-30, N'Hà Nội', N'A2'),
(14,N'Trần Hữu a', 1999-06-02, N'Hà Nam', N'A2'),
(15,N'Trần Hữu a', 2003-04-03, N'Hải Dương', N'A4')
insert into HuongDan values
(1,2,1,2022,7.5),
(1,4,2,2019,8),
(2,6,3,2018,9),
(2,5,4,2020,7.5),
(3,5,5,2019,8.5),
(4,10,6,2020,9.5),
(5,9,7,2022,6.5),
(6,10,8,2021,7.5),
(6,7,9,2020,8.5),
(7,8,10,2019,7),
(8,3,11,2018,9.5),
(8,2,12,2021,9),
(9,4,13,2020,7.5),
(9,9,14,2022,8),
(10,10,15,2019,7)
--cau 2
-- 1
select * from GiangVien where GV# = 1

-- 2
select count(DT#) from DeTai where TheLoai = N'Ứng dụng';

-- 3
select count(distinct SV#) from HuongDan where GV# = 1 and SV# in
( select SV# from SinhVien where QueQuan = N'Hải Phòng' )

-- 4
select TenDT from DeTai where DT# not in
(select distinct DT# from HuongDan);

-- 5
update SinhVien set QueQuan = N'Hà Nam', NgaySinh = '1991-12-11'
where TenSV = N'Nguyễn Xuân Dũng'

-- 6
delete from SinhVien where TenSV = N'Nguyễn Văn Nam'
--cau 3
-- Sao luu
 USE [master];
 GO
 BACKUP DATABASE [gkDB]
 TO DISK = N'gk_backup.bak' 
 WITH NOFORMAT, NOINIT,
 NAME = N'backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10;