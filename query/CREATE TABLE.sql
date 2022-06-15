use market_db;

#유저 정보 table
DROP TABLE if exists users;
CREATE TABLE users(
	username varchar(16) not null,
    phone varchar(11) not null,
    email varchar(32),
    age int not null,
    id varchar(32) not null primary key,
    pw varchar(16) not null,
    info varchar(512) default '',
    score DECIMAL(2,1) default 3.0, -- default 3 range 1 ~ 5
    ban bool default false,
    mileage BIGINT default 0
);

DROP TABLE if exists admins;
CREATE TABLE admins(
	adminname varchar(16) not null,
    phone varchar(11) not null,
    email varchar(32),
    id varchar(32) not null primary key,
    pw varchar(16) not null,
    isApproved boolean default false
);
    
#찜 table
DROP TABLE if exists favorite;
CREATE TABLE favorite(
    id varchar(32) not null,
    postnum int not null
);

#posts Table
DROP TABLE if exists posts;
CREATE TABLE posts(
	postnum int not null primary key auto_increment,
    title varchar(32) not null,
    postDate datetime not null,		-- 게시글 작성시간
    views int default 0,			-- 조회수
    fav int default 0,				-- 찜횟수
    teens int default 0,			-- 10대
    twenties int default 0,			-- 20대
    thirties int default 0,			-- 30대
    fourties int default 0,			-- 40대
    fifties int default 0,			-- 50대
    overSixties int default 0		-- 60대 이상
    );

#product Table
DROP TABLE if exists product;
CREATE TABLE product(
	postnum int not null primary key,	# 글번호
	price int default 0,				# 가격
    category varchar(16) not null,		# 제품 종류
    descript varchar(512) default "",	# 제품 설명
    seller_id varchar(32) not null,		# 판매자 ID
    buyer_id varchar(32) default "",	# 구매자 ID
    isSelling boolean default true,		# 판매여부
    score int default 0,				# 평점
    review varchar(128) default ""		#후기
    );

#photos Table
DROP TABLE if exists photos;
CREATE TABLE photos(
    postnum int not null primary key,	# 계시글 번호
    imgnum int not null,				# 이미지 번호
	height int not null default 500,	# 이미지 높이
    width int not null default 500,		# 이미지 너비
    photo varchar(512)					# 이미지 URL
    );

# reports Table
DROP TABLE if exists reports;
CREATE TABLE reports(
	writer varchar(32) not null,			# 작성자 아이디
	postnum int not null,					# 게시글 번호
    reason varchar(128) not null,			# 신고 내용
    reportDate datetime not null);			# 작성 시간

#최근 본 게시물 table 
DROP TABLE if exists recentPosts;
CREATE TABLE recentPosts(
	id varchar(32) not null,				# 사용자 ID
    postnum int not null,					# 게시글 번호
    viewDate datetime not null				# 게시글 열람 시간
);

#고객센터 FAQ table
DROP TABLE IF EXISTS FAQ;
CREATE TABLE FAQ(
	postnum int not null primary key auto_increment,	#FAQ 번호
    title varchar(32) not null,							#FAQ 제목
    postDate date not null,								#FAQ 작성시간
    postBody varchar(512)								#FAQ 내용
);

#고객센터 공지사항 table
DROP TABLE IF EXISTS NOTICE;
CREATE TABLE NOTICE(
	postnum int not null primary key auto_increment,	#공지사항 번호
    title varchar(32) not null,							#공지사항 제목
    postDate date not null,								#공지사항 작성시간
    postBody varchar(512)								#공지사항 내용
);

DROP TABLE IF EXISTS QnA;
CREATE TABLE QnA(
	postnum int not null primary key auto_increment,	#Q&A 번호
    writerID varchar(32) not null,						#Q&A 작성자ID
    title varchar(32) not null,							#Q&A 제목
    postDate date not null,								#Q&A 작성시간
    postBody varchar(512),								#Q&A 내용
    postComment varchar(256) default "",				#Q&A 답변
    isAnswered boolean default false,					#Q&A 답변여부
    pw varchar(4)										#Q&A 비밀번호
);

-- Triger -- 

#유저 정보 생성시 Trigger
#이전 실행으로 이미 트리거 존재 할수 있으므로 REPLACE또한 추가

DELIMITER $$
CREATE trigger CHECK_USER_DATA
	BEFORE INSERT on users
    FOR EACH ROW
    BEGIN
		if (NEW.id REGEXP '[A-za-z0-9]{5,15}') = 0 then
			SIGNAL SQLSTATE '10001' SET MESSAGE_TEXT = "아이디는 영문이나 숫자고 길이는 5~15자 입니다.";
		elseif (NEW.pw REGEXP '(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{8,20}') = 0 then 
			SIGNAL SQLSTATE '10002' SET MESSAGE_TEXT = "비밀번호는 8~20자 최소 하나의 문자 및 하나의 숫자를 포함해야 합니다.";
		elseif (NEW.phone REGEXP '[0-9]{9,12}' ) = 0 then
			SIGNAL SQLSTATE '10003' SET MESSAGE_TEXT = "전화번호는 9~11자 입니다.";
		elseif (NEW.age REGEXP '[0-9]') = 0 then
			SIGNAL SQLSTATE '10004' SET MESSAGE_TEXT = "나이는 숫자만 입력해주세요.";
		elseif (NEW.age > 0 AND NEW.age < 150) = 0 then
			SIGNAL SQLSTATE '10005' SET MESSAGE_TEXT = "나이는 1 ~ 150 사이의 값만 입력 가능합니다.";
		end if;
	END $$
DELIMITER ;

DELIMITER $$
CREATE trigger CHECK_ADMIN_DATA
	BEFORE INSERT on admins
    FOR EACH ROW
    BEGIN
		if (NEW.id REGEXP '[A-za-z0-9]{5,15}') = 0 then
			SIGNAL SQLSTATE '10001' SET MESSAGE_TEXT = "아이디는 영문이나 숫자고 길이는 5~15자 입니다.";
		elseif (NEW.pw REGEXP '(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{8,20}') = 0 then 
			SIGNAL SQLSTATE '10002' SET MESSAGE_TEXT = "비밀번호는 8~20자 최소 하나의 문자 및 하나의 숫자를 포함해야 합니다.";
		elseif (NEW.phone REGEXP '[0-9]{9,12}' ) = 0 then
			SIGNAL SQLSTATE '10003' SET MESSAGE_TEXT = "전화번호는 9~11자 입니다.";
		end if;
	END $$
DELIMITER ;