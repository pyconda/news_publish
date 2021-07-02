<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<title>新闻发布管理系统</title>
<style>
      .input-val {
        width: 200px;
        height: 32px;
        border: 1px solid #ddd;
        box-sizing: border-box;
      }
      #canvas {
        vertical-align: middle;
        box-sizing: border-box;
        border: 1px solid #ddd;
        cursor: pointer;
      }
      .btn {
        display: block;
        margin-top: 20px;
        height: 32px;
        width: 100px;
        font-size: 16px;
        color: #fff;
        background-color: #457adb;
        border: none;
        border-radius: 50px;
      }
    </style>

</head>
<body>
	<div class="login">

	<!-- login -->
	<div class="qlogin" id="qlogin">
		<div class="web_login" align="center">
			<form action ="${pageContext.request.contextPath}/login.action"
			method="post" onsubmit="return checkValue()">
			<font style="color:#ff0000;font-size:16px;">${msg }</font>
				<div class="uname" class="input-group">
					<span class="input-group-addon">
					<img src="${pageContext.request.contextPath }/images/un.jpg"/>
					</span>
					<input type="text" name="loginName" id="loginName"
						class="form-control" placeholder="请输入登录账号"/>
				</div>
				<div class="upwd" class="input-group">
					<span class="input-group-addon">
					<img src="${pageContext.request.contextPath }/images/pw.jpg"/>
					</span>
					<input type="password" name="password" id="password"
						class="form-control" placeholder="请输入密码"/>
				</div>
				<br>
				<div class="code"class="input-group">
					<span class="input-group-addon">
					
					</span>
       				 <input type="text" value="" placeholder="请输入验证码（不区分大小写）" 
       				 name="validcode" id="validcode"
						class="form-control"  style="width:50px;">
       					 <canvas id="canvas" width="100" height="30"></canvas>
    
   				 </div>  
   				
				<div style="padding-left:0px;margin-top:20px">
					<button class="btn btn-primary btn-lg" style="width:180px">
					登录
					</button>
				</div>
		            <div style="display:inline;">
               		 <a href="${pageContext.request.contextPath}/toAddUser.action">还未注册？</a>
           			 </div>
           			 <div style="display:inline;margin-left:26px;">
               			 <a href="javascript:void(0)">忘记密码？</a>
           			 </div>

			</form>
		</div>
		</div>
	</div>

 
	<script>
		function checkValue(){
			 
			
			var loginName=document.getElementById("loginName").value;
			if(loginName.length<1){
				alert("请输入账号");
				document.getElementById("loginName").focus();
				return false;
			}
			 var password = document.getElementById("password").value;
			if(password.length<1){
				alert("请输入密码");
				document.getElementById("password").focus();
				return false;
			}
			var validcode = document.getElementById("validcode").value.toLowerCase();
			

	          if(validcode.length<1){
	                alert('请输入验证码！');
	                document.getElementById("validcode").focus();
	                return false;
	            }
	         
	          if(validcode!=num){
	                alert('验证码错误！请重新输入！');
	                document.getElementById("validcode").focus();
	                return false;
	            }
			
		}
	</script>


<script>

$(function(){
    var show_num = [];
    draw(show_num);
    
    $("#canvas").on('click',function(){
        draw(show_num);
        num = show_num.join("");
    })
    num = show_num.join("");
  
})


    //生成并渲染出验证码图形
    function draw(show_num) {
        var canvas_width=$('#canvas').width();
        var canvas_height=$('#canvas').height();
        var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
        var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
        canvas.width = canvas_width;
        canvas.height = canvas_height;
        var sCode = "a,b,c,d,e,f,g,h,i,j,k,m,n,p,q,r,s,t,u,v,w,x,y,z,A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
        var aCode = sCode.split(",");
        var aLength = aCode.length;//获取到数组的长度
        
        for (var i = 0; i < 4; i++) {  //这里的for循环可以控制验证码位数（如果想显示6位数，4改成6即可）
            var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
            // var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
            var deg = Math.random() - 0.5; //产生一个随机弧度
            var txt = aCode[j];//得到随机的一个内容
            show_num[i] = txt.toLowerCase();
            var x = 10 + i * 20;//文字在canvas上的x坐标
            var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
            context.font = "bold 23px 微软雅黑";

            context.translate(x, y);
            context.rotate(deg);

            context.fillStyle = randomColor();
            context.fillText(txt, 0, 0);

            context.rotate(-deg);
            context.translate(-x, -y);
        }
        for (var i = 0; i <= 5; i++) { //验证码上显示线条
            context.strokeStyle = randomColor();
            context.beginPath();
            context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.stroke();
        }
        for (var i = 0; i <= 30; i++) { //验证码上显示小点
            context.strokeStyle = randomColor();
            context.beginPath();
            var x = Math.random() * canvas_width;
            var y = Math.random() * canvas_height;
            context.moveTo(x, y);
            context.lineTo(x + 1, y + 1);
            context.stroke();
        }
    }

    //得到随机的颜色值
    function randomColor() {
        var r = Math.floor(Math.random() * 256);
        var g = Math.floor(Math.random() * 256);
        var b = Math.floor(Math.random() * 256);
        return "rgb(" + r + "," + g + "," + b + ")";
    }

</script>
</body>
</html>