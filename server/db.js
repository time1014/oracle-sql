const obj = require('./test')
const oracledb = require('oracledb'); // 오라클 연결하기 위한 node.js 공식 드라이버

//비동기는 차례대로 실행이 아닌 처리를 기다렸다가 응답 받아오면 실행

//결과물 -> 객체
oracledb.outFormat = oracledb.OUT_FORMAT_OBJECT;

//async 비동기 함수 await할땐 async 꼭 필요함 db작업은 비동기라서 필수작업
async function getConnection(){
  //비동기 디비연결해서 값 기다렸다가 밑실행
  return await oracledb.getConnection({
    user: 'scott',
    password : 'tiger',
    connectString:'192.168.0.29:1521/xe' //본인주소:오라클기본포트/Express Edition 기본 서비스명
  }); 
}

module.exports = {getConnection,oracledb};