var target = document.querySelectorAll('.notice2');
var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
var targetID;

// 팝업 열기
for(var i = 0; i < target.length; i++){
  target[i].addEventListener('click', function(){
    targetID = this.getAttribute('href');
    document.querySelector(targetID).style.display = 'block';
  });
}

// 팝업 닫기
for(var j = 0; j < target.length; j++){
  btnPopClose[j].addEventListener('click', function(){
    this.parentNode.parentNode.style.display = 'none';
  });
}

//마일리지 사용
function printName() {
  mileage_table = document.getElementById('mileage_table').value;
  document.getElementById('mileageoutput').innerText = mileage_table;
  
  product_price2 = document.getElementById('product_price2').innerHTML;
  document.getElementById('p_totalprice').value = product_price2 - mileage_table;  
  
}

$("#mileage_table").keyup(function() { // 특정 아이디를 가진 개체를 클릭하면 실행
var p_totalprice = $('#p_totalprice').text(); // texta에 담긴 텍스트를 변수로 선언
$('#bbb').val(p_totalprice); // aaa의 값을 bbb 인풋에 담기
});



var target = document.querySelectorAll('.notice2');
var btnPopClose = document.querySelectorAll('.pop_wrap .btn_submit');
var targetID;

// 팝업 열기
for(var i = 0; i < target.length; i++){
  target[i].addEventListener('click', function(){
    targetID = this.getAttribute('button');
    document.querySelector(targetID).style.display = 'block';
  });
}

// 팝업 닫기
for(var j = 0; j < target.length; j++){
  btnPopClose[j].addEventListener('click', function(){
    this.parentNode.parentNode.style.display = 'none';
  });
}