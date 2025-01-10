-- jsp_bbs 테이블 생성
-- BBS(Builtin Board System : 전자 게시판)

create table jsp_bbs(
	board_no number primary key,          -- 게시판 글 번호
	board_writer varchar2(50) not null,   -- 게시판 글 작성자
	board_title varchar2(200) not null,   -- 게시판 글 제목
	board_cont varchar2(2000) not null,   -- 게시판 글 내용
	board_pwd varchar2(50) not null,      -- 게시판 글 비밀번호
	board_hit number default 0,           -- 게시판 글 조회수
	board_date date not null,             -- 게시판 글 작성일자
	board_update date,                    -- 게시판 글 수정일자
	board_group number,                   -- 게시판 글 그룹
	board_step number,                    -- 게시판 글 답변 단계
	board_indent number                   -- 게시판 답변글 들여쓰기
);


-- jsp_bbs 테이블에 데이터를 추가해 보자.
insert into jsp_bbs
	values(1, '홍길동', '제목1', '내용1', '1111', default,
	           sysdate, '', 1, 0, 0);
	           
insert into jsp_bbs
	values(2, '세종대왕', '한글', '한글 창제 왕입니다요~~~', '2222', default,       
			   sysdate, '', 2, 0, 0);
	           
insert into jsp_bbs
	values(3, '유관순', '대한독립만세', '대한독립만세 글입니다.', '3333', default,
	           sysdate, '', 3, 0, 0);
	           
insert into jsp_bbs
	values(4, '이순신', '장군글', '장군 글입니다.', '4444', default,
	           sysdate, '', 4, 0, 0);
	           
insert into jsp_bbs
	values(5, '신사임당', '제목5', '내용5', '5555', default,
	           sysdate, '', 5, 0, 0);
	           
	           
	           
	           