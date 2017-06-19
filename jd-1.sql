set names utf8;
drop database if exists jd;
create database jd charset=utf8;
use jd;


#�û�
create table jd_user(
  uid int primary key auto_increment,
  uname varchar(32),
  upwd varchar(32)
);
insert into jd_user values
(null,'qiangdong','123456'),
(null,'naicha','000000'),
(null,'chenggang','456789');


#��Ʒ
create table jd_product(
 pid int primary key auto_increment,
 pname varchar(64),
 price varchar(32),
 pic varchar(32)
);
insert into jd_product values
(1,'С�� Note ȫ��ͨ ��ɫ �ƶ���ͨ����4G�ֻ� ˫��˫��',1199.00,'images/phone/phone_01.jpg'),
(2,'Apple iPhone 6s (A1700) 16G õ���ɫ �ƶ���ͨ����4G�ֻ�',3999.00,'images/phone/phone_02.jpg'),
(3,'PPO R9 4GB+64GB�ڴ�� õ��� ȫ��ͨ4G�ֻ� ˫��',2499.00,'images/phone/phone_03.jpg'),
(4,'С�� ���� 3S ����ȫ��ͨ 3GB�ڴ� 32GB ROM �����ɫ',899.00,'images/phone/phone_04.jpg'),
(5,'����M6 Plus ���Ľ� 4GB+64GB�� �ƶ���ͨ����4G�ֻ� ˫��˫��',2999.00,'images/phone/phone_05.jpg'),
(6,'Apple iPhone 6s Plus (A1699) 64G õ���ɫ �ƶ���ͨ����4G�ֻ�',5799.00,'images/phone/phone_06.jpg'),
(7,'vivo X7 ȫ��ͨ 4GB+64GB �ƶ���ͨ����4G�ֻ� ˫��˫��',2499.00,'images/phone/phone_07.png'),
(8,'С�� ����Note3 ����ȫ��ͨ�� 3GB+32GB ��ɫ �ƶ���ͨ����4G�ֻ�',1099.00,'images/phone/phone_08.jpg'),
(9,'���������������¡���ҫ8 4GB+32GB ȫ��ͨ�� �Ⱥ��� ˫��ͷ��˫2.5D����',2499.00,'images/phone/phone_09.jpg'),
(10,'��ҫ7 (PLK-AL10) 3GB+64GB�ڴ�� ��ҫ�� �ƶ���ͨ����4G�ֻ�',1799.00,'images/phone/phone_10.jpg'),
(11,'��ҫ V8 ȫ��ͨ ����� 4GB+64GB ���Ľ� �ƶ���ͨ����4G�ֻ� ˫��˫��˫ͨ',2799.00,'images/phone/phone_11.jpg'),
(12,'��ҫ ����5X 3GB�ڴ�� ���ս� �ƶ���ͨ����4G�ֻ� ˫��˫�� �ſ�ָ��',1099.00,'images/phone/phone_12.jpg'),
(13,'Apple iPhone 6 (A1586) 64GB ��ɫ �ƶ���ͨ����4G�ֻ�',4199.00,'images/phone/phone_13.jpg'),
(14,'TCL ���� 750 �Ž� �ƶ���ͨ����4G�ֻ� ˫��˫�� ����1600�������������գ�',4199.00,'images/phone/phone_14.jpg'),
(15,'��Ϊ P9 plus 64GB ����� �ƶ���ͨ����4G�ֻ� ˫��˫��',3988.00,'images/phone/phone_15.jpg'),
(16,'Apple iPhone 5s (A1530) 16GB ��ɫ �ƶ���ͨ4G�ֻ�',2198.00,'images/phone/phone_16.jpg'),
(17,'vivo X7Plus ȫ��ͨ 4GB+64GB �ƶ���ͨ����4G�ֻ� ˫��˫�� ��ɫ',2798.00,'images/phone/phone_17.jpg'),
(18,'��Ϊ ����5S ��ɫ �ƶ���ͨ����4G�ֻ� ˫��˫�� 10������ֻ���',1099.00,'images/phone/phone_18.jpg'),
(19,'Apple iPhone 6 Plus (A1524) 16GB ��ɫ �ƶ���ͨ����4G�ֻ�',3899.00,'images/phone/phone_19.jpg'),
(20,'��Ϊ ��â5 ȫ��ͨ 4GB+64GB�� ���Ľ� �ƶ���ͨ����4G�ֻ� ˫��˫��',2599.00,'images/phone/phone_20.jpg'),
(21,'С��5 ȫ��ͨ ��׼�� 3GB�ڴ� 32GB ROM ��ɫ �ƶ���ͨ����4G�ֻ�',1799.00,'images/phone/phone_21.jpg'),
(22,'��Ϊ P9 ȫ��ͨ 3GB+32GB�� ����� �ƶ���ͨ����4G�ֻ� ˫��˫�� ����955',3188.00,'images/phone/phone_22.jpg'),
(23,'���� ��� ��׼�� ��ʿ�� �ƶ���ͨ����4G�ֻ� ˫��˫�� 4Gȫ��ͨ',999.00,'images/phone/phone_23.jpg'),
(24,'360�ֻ� N4 ȫ��ͨ 4GB+32GB ����� �ƶ���ͨ����4G�ֻ� ˫��˫��',999.00,'images/phone/phone_24.jpg'),
(25,'С�� Max ȫ��ͨ ��׼�� 3GB�ڴ� 32GB ROM ��ɫ �ƶ���ͨ����4G�ֻ�',1299.00,'images/phone/phone_25.jpg'),
(26,'��Ϊ P9 ȫ��ͨ 4GB+64GB�� ��ɫ �ƶ���ͨ����4G�ֻ� ˫��˫�� ����1200��',3688.00,'images/phone/phone_26.jpg'),
(27,'���ӣ�Le����2��X620��32GB ԭ���� �ƶ���ͨ����4G�ֻ� ˫��˫�� 5.5Ӣ��',988.00,'images/phone/phone_27.jpg'),
(28,'Ŭ����(nubia)��3+64GB��Сţ5 Z11mini ��ɫ �ƶ���ͨ����4G�ֻ�',1299.00,'images/phone/phone_28.jpg'),
(29,'���ӣ�Le����2Pro 32GB ��ɫ �ƶ���ͨ����4G�ֻ� ˫��˫�� 5.5Ӣ��In-Cell��',1399.00,'images/phone/phone_29.jpg'),
(30,'��Ϊ Mate 8 3GB+32GB�� õ��� �ƶ���ͨ����4G�ֻ� ˫��˫�� ����950оƬ',2799.00,'images/phone/phone_30.jpg'),
(31,'С�� 4c ��׼�� ȫ��ͨ ��ɫ �ƶ���ͨ����4G�ֻ� ˫��˫�� ��ͨ����808������',799.00,'images/phone/phone_31.jpg'),
(32,'vivo X7 ȫ��ͨ 4GB+64GB �ƶ���ͨ����4G�ֻ� ˫��˫�� �ǿջ� vivox7',2498.00,'images/phone/phone_32.jpg'),
(33,'���� ����3 ��K32C36��16GB ��ɫ �ƶ�4G�ֻ� ˫��˫�� �����¾�����',599.00,'images/phone/phone_33.jpg'),
(34,'��Ϊ ��ҫ ����4X ���ؽ� �ƶ���ͨ����4G�ֻ� ˫��˫�� 5.5Ӣ�������Ƭ����',749.00,'images/phone/phone_34.jpg'),
(35,'���� Galaxy On5��G5500����ɫ �ƶ���ͨ4G�ֻ� ��Ƥ�ʸк�ǣ�2600����������',699.00,'images/phone/phone_35.jpg'),
(36,'OPPO A37 2GB+16GB�ڴ�� õ��� ȫ��ͨ4G�ֻ� ˫��˫�� ����Ʒ����ѡ��',1299.00,'images/phone/phone_36.jpg');

#��ӹ��ﳵ
create table jd_cart(
  cid int primary key auto_increment,
  userID varchar(32)
);
insert into jd_cart values
(100,1);


#���������
create table jd_detail (
  did int primary key auto_increment,
  cartID int,
  productID int,
  count int
);
insert into jd_detail values
(null,100,1,1),
(null,100,2,2),
(null,100,3,3),
(null,100,4,4);

