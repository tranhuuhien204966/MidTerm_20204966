--Lab 8
create database DBHousing
use DBHousing


 create table KhachHang (
  MaKH nvarchar(50) primary key,
	HoTen nvarchar(50),
 	Sdt nvarchar(20),
 	CoQuan nvarchar(50)
 );

 create table NhaChoThue (
 	MaN nvarchar(50) primary key,
 	DiaChi nvarchar(50),
 	GiaThue int,
 	TenChuNha nvarchar(50)
 );

create table HopDong (
MaN nvarchar(50),
MaKH nvarchar(50),
	foreign key (MaN) references NhaChoThue(MaN) on delete cascade on update cascade,
 	foreign key (MaKH) references KhachHang(MaKH) on delete cascade on update cascade
 );

 insert into KhachHang values
 ('KH1', N'Trần Văn A', '022355678', 'Vina'),
 ('KH2', N'Trần Văn B', '022335688', 'Vina'),
 ('KH3', N'Trần Văn C', '025345698', 'Vina'),
 ('KH4', N'Trần Văn D', '023345618', 'Vina'),
 ('KH5', N'Trần Văn E', '021345628', 'Vina'),
('KH6', N'Trần Văn F', '025345668', 'Vina'),
 ('KH7', N'Trần Văn G', '029345178', 'Vina'),
 ('KH8', N'Trần Văn H', '029345278', 'Vina'),
 ('KH9', N'NTrần Văn I', '022345378', 'Vina'),
 ('KH10', N'Trần Văn K', '023344678', 'Vina'),
 ('KH11', N'Trần Văn L', '028345678', 'Vina'),
 ('KH12', N'Trần Văn M', '026346678', 'Vina'),
 ('KH13', N'Trần Văn N', '026347674', 'Vina'),
 ('KH14', N'Trần Văn O', '024348646', 'Vina'),
 ('KH15', N'Trần Văn P', '020349636', 'Vina')

 insert into NhaChoThue values
 ('Nha1', N'Đại La, Hà Nội', 2000000, N'Trần Văn A'),
 ('Nha2', N'Đại La, Hà Nội', 2500000, N'Trần Văn A'),
 ('Nha3', N'Đại La, Hà Nội', 20000000, N'Trần Văn A'),
 ('Nha4', N'Đại La, Hà Nội', 10000000, N'Trần Văn A'),
 ('Nha5', N'Đại La, Hà Nội', 5000000, N'Trần Văn A'),
 ('Nha6', N'Đại La, Hà Nội', 6500000, N'Trần Văn A'),
 ('Nha7', N'Đại La, Hà Nội', 7800000, N'Trần Văn A'),
 ('Nha8', N'Đại La, Hà Nội', 12000000, N'Trần Văn A'),
 ('Nha9', N'Đại La, Hà Nội', 32000000, N'Trần Văn A'),
 ('Nha10', N'Đại La, Hà Nội', 2500000, N'Trần Văn A'),
 ('Nha11', N'Đại La, Hà Nội', 2006000, N'Trần Văn A'),
 ('Nha12', N'Đại La, Hà Nội', 22000000, N'Trần Văn A'),
 ('Nha13', N'Đại La, Hà Nội', 62000000, N'Trần Văn A'),
 ('Nha14', N'Đại La, Hà Nội', 2700000, N'Trần Văn A'),
 ('Nha15', N'Đại La, Hà Nội', 2900000, N'Trần Văn A')

 alter table HopDong add NgayBatDau datetime;
 alter table HopDong add NgayKetThuc datetime;

 insert into HopDong values
 ('Nha1', 'KH2', '2019-01-29', '2021-05-02'),
 ('Nha2', 'KH10', '2017-1-2', '2022-10-10'),
 ('Nha5', 'KH5', '2018-1-20', '2020-10-20'),
 ('Nha3', 'KH2', '2019-10-30', '2020-10-20'),
 ('Nha4', 'KH2', '2019-10-20', '2021-1-20'),
 ('Nha4', 'KH9', '2019-10-2', '2020-10-20'),
 ('Nha1', 'KH7', '2016-10-20', '2020-10-20'),
 ('Nha7', 'KH8', '2017-1-2', '2020-11-22'),
 ('Nha10', 'KH10', '2022-10-23', '2099-11-1')

-- b
 select DiaChi, TenChuNha from NhaChoThue where GiaThue < 10000000;
 go

update NhaChoThue set TenChuNha = N'Ngô Bá Khá' where MaN = 'Nha1';

select MaKH, HoTen, CoQuan from KhachHang where MaKH in
(
	select MaKH from HopDong where MaN in (
	select MaN from NhaChoThue where TenChuNha = N'Ngô Bá Khá'
	)
);
go


 select * from NhaChoThue where MaN not in (
 	select MaN from HopDong
 )

 select max(GiaThue) as GiaThueCaoNhat from NhaChoThue where MaN in (
 	select MaN from HopDong
 );

-- c

create index Idx_KhachHang_CoQuan on KhachHang(CoQuan);
select * from KhachHang where CoQuan = 'Vina';
go


create index Idx_NhaChoThue_MaN on NhaChoThue(MaN);
select a.MaN, a.TenChuNha, b.SoNhaChoThue from NhaChoThue as a inner join (
select MaN, count(MaN) as SoNhaChoThue from HopDong group by MaN ) as b on a.MaN = b.MaN;
go

-- d
 create procedure HopDongProcedure @Nguong int
 as
 select * from HopDong where MaN in (
 	select MaN from NhaChoThue where GiaThue > @Nguong
 )
 go

