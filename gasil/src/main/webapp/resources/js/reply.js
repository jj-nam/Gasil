console.log('Reply Module...');
// 리턴 데이터에 대한 시간 처리 함수(24시간 이내 작성 댓글은 시간으로 표기 / 24시간이 지난 댓글은 날짜만 표기)
function displayTime(timeValue){
   var today = new Date();
   var gap = today.getTime() - timeValue;
   var dateObj = new Date(timeValue);
   var str = "";
   
   if(gap < (1000 * 60 * 60 * 24)){
      var hh = dateObj.getHours();
      var mi = dateObj.getMinutes();
      var ss = dateObj.getSeconds();
      return [(hh>9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('');
   }else{
      var yy = dateObj.getFullYear();
      var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
      var dd = dateObj.getDate();
      return [yy, '/', (mm > 9 ? '' : '0')+mm, '/', (dd > 9 ? '' : '0') + dd].join('');
   }
}

var replyService = (function(){

	function add(content, callback, error){
	
		console.log('add content...');
		
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(content),
			contentType : 'application/json; charset=utf-8',
			success : function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	function addre(content, callback, error){
	
		console.log('add reply content...');
		
		$.ajax({
			type : 'post',
			url : '/replies/renew',
			data : JSON.stringify(content),
			contentType : 'application/json; charset=utf-8',
			success : function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function getList(param, callback, error){
	
		console.log('getList...');
		
		// param : {bno:bnoValue, page : 1}
		
		var bno = param.bno;
		var page = param.page || 1;
		
		$.ajax({
			type : 'get',
			url : '/replies/pages/' + bno + '/' + page + '.json',
			success : function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function get(rno, callback, error){
		
		$.ajax({
			type : 'get',
			url : '/replies/' + rno + '.json',
			data : JSON.stringify(rno),
			success : function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function remove(rno, callback, error){
		
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			data : JSON.stringify(rno),
			success : function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function removeAll(bno, callback, error){
		
		$.ajax({
			type : 'delete',
			url : '/replies/remove/' + bno,
			data : JSON.stringify(bno),
			success : function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	
	return{
		add:add,
		getList : getList,
		get : get,
		remove : remove,
		removeAll : removeAll,
		addre : addre
	};
	
})();