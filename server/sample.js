const removeBoard = (e) => {
  const tr = e.target.parentElement.parentElement;
  const bno = tr.children[0].innerText

  fetch('http://localhost:3000/board_delete/'+bno)
  .then(resp=>resp.json())
  //2번째 then에 기능
  .then(data => {
    console.log(data);
    if(data.retCode == "OK"){
      const tr = e.target.parentElement.parentElement;
      tr.remove();
    }else{
      alert('처리중 예외발생');
    }
  })
  .catch(err =>{
    console.log(err);
  })
  //화면 row 삭제

  
}

function makeRow(ele ={}){
  const tr = document.createElement('tr');
        for (let prof of ['BOARD_NO','TITLE','WRITER']){
        const td = document.createElement('td');
          td.innerHTML = ele[prof];
          tr.appendChild(td);
        }
        //td , button
        const deltd = document.createElement('td');
        const btn = document.createElement('button');
        btn.innerHTML = `삭제`;
        deltd.appendChild(btn);
        tr.appendChild(deltd);


        //btn에 이벤트 등록
        btn.addEventListener('click',removeBoard)

        return tr;
      }