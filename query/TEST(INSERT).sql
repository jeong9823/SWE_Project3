USE market_db;

INSERT users(name, phone, email, age, id, pw, info)
VALUES
('임경택', '01011111111', 'tester1@market.com', 45, 'test1', 'test1111', '나는 임경택' ),
('조정우', '01022222222', 'tester2@market.com', 34, 'test2', 'test2222', ''),
('이민석', '01033333333', 'tester3@market.com', 23, 'test3', 'test3333', ''),
('이세연', '01044444444', 'tester4@market.com', 12, 'test4', 'test4444', '');

INSERT posts(title, postDate, views)
VALUES
('아이폰12미니', '2022-06-09 16:00:00', 10),
('아이폰12', '2022-06-09 16:00:01', 11),
('아이폰12 Pro', '2022-06-09 16:00:02', 12),
('아이폰12 ProMax', '2022-06-09 16:00:03', 13),
('아이폰13 미니', '2022-06-09 16:00:04', 1),
('아이폰13', '2022-06-09 16:00:05', 2),
('아이폰13 Pro', '2022-06-09 16:00:06', 3),
('아이폰13 ProMax', '2022-06-09 16:00:07', 4),
('갤럭시 S21', '2022-06-09 16:00:08', 5),
('갤럭시 S21+', '2022-06-09 16:00:09', 6),
('갤럭시 S21 Ultra', '2022-06-09 16:00:10', 7),
('갤럭시 S22', '2022-06-07 16:00:11', 8),
('갤럭시 S22+', '2022-06-07 16:00:12', 9),
('갤럭시 S22 Ultra', '2022-06-07 16:00:13', 14),
('갤럭시 Z플립3', '2022-06-07 16:00:14', 1),
('갤럭시 Z폴드3', '2022-06-07 16:00:15', 19);



INSERT product(postnum, price, category, descript, seller_id)
VALUES
(1, 600000, '디지털/가전', '아이폰12 미니입니다.', 'test1'),
(2, 650000, '디지털/가전', '아이폰12 입니다.', 'test1'),
(3, 700000, '디지털/가전', '아이폰12 Pro입니다.', 'test1'),
(4, 750000, '디지털/가전', '아이폰12 ProMax입니다.', 'test1'),
(5, 800000, '디지털/가전', '아이폰13 미니입니다.', 'test1'),
(6, 850000, '디지털/가전', '아이폰 13입니다.', 'test1'),
(7, 900000, '디지털/가전', '아이폰13 Pro입니다.', 'test1'),
(8, 950000, '디지털/가전', '아이폰13 ProMax입니다.', 'test1'),
(9, 600000, '디지털/가전', '갤럭시 S21입니다.', 'test2'),
(10, 650000, '디지털/가전', '갤럭시 S21+입니다.', 'test2'),
(11, 700000, '디지털/가전', '갤럭시 S21 Ultra입니다.', 'test2'),
(12, 750000, '디지털/가전', '갤럭시 S22입니다.', 'test2'),
(13, 800000, '디지털/가전', '갤럭시 S22+입니다.', 'test2'),
(14, 850000, '디지털/가전', '갤럭시 S22 Ultra입니다.', 'test2'),
(15, 900000, '디지털/가전', '갤럭시 Z플립3입니다.', 'test2'),
(16, 1000000, '디지털/가전', '갤럭시 Z폴드3입니다.', 'test2');

INSERT photos(postnum, imgnum, photo)
VALUES
(1, 1, '/imgs/1654769484561/iphone12mini.JPG'),
(2, 1, '/imgs/1654769514903/iphone12.JPG'),
(3, 1, '/imgs/1654769544683/iphone12pro.JPG'),
(4, 1, '/imgs/1654769587963/iphone12promax.JPG'),
(5, 1, '/imgs/1654769672485/iphone13mini.JPG'),
(6, 1, '/imgs/1654769640354/iphone13.JPG.JPG'),
(7, 1, '/imgs/1654769701341/iphone13pro.JPG'),
(8, 1, '/imgs/1654769723581/iphone13promax.JPG'),
(9, 1, '/imgs/1654769796176/galaxys21.JPG'),
(10, 1, '/imgs/1654769822440/galaxys21+.JPG'),
(11, 1, '/imgs/1654769860485/galaxys21ultra.JPG'),
(12, 1, '/imgs/1654769883046/galaxys22.JPG'),
(13, 1, '/imgs/1654769898767/galaxys22+.JPG'),
(14, 1, '/imgs/1654769916672/galaxys22ultra.JPG'),
(15, 1, '/imgs/1654769947715/galaxyszflip3.JPG'),
(16, 1, '/imgs/1654769967458/galaxyszfold3.JPG');

INSERT favorite(id, postnum)
VALUES
('test2', 13),
('test2', 10),
('test2', 5),
('test2', 4),
('test2', 1);
