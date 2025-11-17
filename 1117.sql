-- 테이블 삭제
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE 한빛마트게시글 CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE 한빛마트주문 CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE 한빛마트상품 CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE 한빛마트회원 CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE 한빛마트제조 CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE 한빛마트제조 (
    제조업체명 VARCHAR(30) PRIMARY KEY,         
    전화번호 VARCHAR(20) NOT NULL,            
    위치 VARCHAR(50),                          
    담당자 VARCHAR(20)                         
);

CREATE TABLE 한빛마트회원 (
    회원아이디 VARCHAR(20) PRIMARY KEY,         
    비밀번호 VARCHAR(20) NOT NULL,             
    이름 VARCHAR(20) NOT NULL,                 
    나이 INT,                                  
    직업 VARCHAR(20),                          
    등급 VARCHAR(20) NOT NULL,                  
    적립금 INT NOT NULL                     
);

CREATE TABLE 한빛마트상품 (
    상품번호 VARCHAR(20) PRIMARY KEY,            
    상품명 VARCHAR(50) NOT NULL,                
    재고량 INT DEFAULT 0 NOT NULL CHECK (재고량 >= 0),      
    단가 INT DEFAULT 0 NOT NULL CHECK (단가 >= 0),          
    제조업체명 VARCHAR(30) NOT NULL,            
    공급일자 DATE NOT NULL,                      
    공급량 INT DEFAULT 0 NOT NULL CHECK (공급량 >= 0),   
    FOREIGN KEY (제조업체명) REFERENCES 한빛마트제조(제조업체명)
);

CREATE TABLE 한빛마트게시글 (
    글번호 VARCHAR(20) PRIMARY KEY,             
    글제목 VARCHAR(20) NOT NULL,                 
    글내용 VARCHAR(20),                         
    작성일자 DATE,                             
    회원아이디 VARCHAR(20) NOT NULL,            
    FOREIGN KEY (회원아이디) REFERENCES 한빛마트회원(회원아이디)
);

CREATE TABLE 한빛마트주문 (
    주문번호 VARCHAR(20) PRIMARY KEY,              
    주문수량 INT DEFAULT 1 NOT NULL,              
    배송지 VARCHAR(50),                            
    주문일자 DATE NOT NULL,                       
    회원아이디 VARCHAR(20) NOT NULL,               
    상품번호 VARCHAR(20) DEFAULT 0 NOT NULL,              
    FOREIGN KEY (회원아이디) REFERENCES 한빛마트회원(회원아이디),
    FOREIGN KEY (상품번호) REFERENCES 한빛마트상품(상품번호)
);
