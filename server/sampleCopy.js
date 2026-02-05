const obj = require('./test')
const oracledb = require('oracledb'); // 오라클 연결하기 위한 node.js 공식 드라이버

//비동기는 차례대로 실행이 아닌 처리를 기다렸다가 응답 받아오면 실행

//결과물 -> 객체
oracledb.outFormat = oracledb.OUT_FORMAT_OBJECT;

//async 비동기 함수 await할땐 async 꼭 필요함 db작업은 비동기라서 필수작업
async function connectFunc(){
  //비동기 디비연결해서 값 기다렸다가 밑실행
  let conn = await oracledb.getConnection({
    user: 'scott',
    password : 'tiger',
    connectString:'192.168.0.29:1521/xe' //본인주소:오라클기본포트/Express Edition 기본 서비스명
  }); // 세션 받아오는 함수
  // const result = await conn.execute(`update board
  //                     set title = :title , writer = :writer , content = :content where board_no = :bno`,
  //                     {
  //                       bno:20,
  //                       title:'글등록연습20',
  //                       writer:'user99',
  //                       content:'글등록연습중20'},
  //                     {autoCommit:true}); //자동 커밋 , update ,insert도 지웠지만 가능

    const result = await conn.execute(`delete from board where board_no = :bno`,
                      {bno:20},
                      {autoCommit:true}); //자동 커밋 delete
  console.log(result);
  const {metaData,rows} = await conn.execute(`SELECT * FROM board`,); // execute는 sql을 실행하라는 메소드 이것도 비동기
  console.log(rows);

}

connectFunc();