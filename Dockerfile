# Base image 지정
FROM node:12

# 이미지 관리자 명시
MAINTAINER jericoh@naver.com

# app 포폴더 만들기 - NodeJS 어플리케이션 폴더
# package를 인스톨 한다든지 등등의 shell command를 해당 docker image에 실행시킬때 사용한다.
RUN mkdir -p /app

# 어플리케이션 폴더를 workdir로 지정
WORKDIR /app

# 서버 파일 복사 ADD [어플리케이션 파일 위치] [컨테이너내부의 어플리케이션 파일 위치]
# ADD 파일과 디렉토리를 호스테에서 docker image로 카파한다
ADD ./ /app

# 패키지파일들 받기
RUN npm install

# 배포버전으로 설정 (이 설정으로 환경을 나눌 수 있다. 배포환경인지 개발 환경인지로)
ENV NODE_ENV=production

# 서버 실행
CMD pm2 start app.js -i 0