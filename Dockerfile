#FROM 키워드로 베이스 이미지를 명시
FROM node:16

# WORKDIR 도커 컨테이너가 생성될때 
WORKDIR /practice_backend/

# COPY는 베이스 이미지에 포함되지 않는 파일들을 가져올때 사용된다.(이거 안해주면 package.json이나 다른 파일들 못가져옴)
# COPY package.json(로컬위치) ./(도커 컨테이너내 위치) 
COPY ./package.json /practice_backend/

# 추가적으로 필요한 파일들을 다운로드 받는다.
RUN npm install

# ./(로컬 디렉토리 파일의 전부) ./(도커 컨테이너내 위치) => 최상위 디렉토리에 있는 모든 파일들을 전부 도커에 옮기겠다는 뜻
COPY ./ /practice_backend/

# 내부 포트를 외부포트와 매핑시키기 위해 연결시키기 위함
EXPOSE 3000

# 컨테이너 시작시 실행될 명령어
CMD yarn dev