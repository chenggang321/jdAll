/**功能点1：页面加载完后，异步请求公用的页头也页尾**/
$(function(){
  $('div#header').load('header.php');
  $('div#footer').load('footer.php');
});

/**当前登录的用户名**/
var loginName = null;  

/**功能点2：点击登录按钮，异步验证登录信息**/
$('#bt-login').click(function(){
  //读取用户的输入——表单序列化
  var inputData = $('#login-form').serialize();
  //异步提交请求，进行验证
  $.ajax({
    type: 'POST',
    url: 'data/1_login.php',
    data: inputData,
    success: function(txt, msg, xhr){
      if(txt=='ok'){  //登录成功
        $('.modal').fadeOut(300);
        loginName = $('[name="uname"]').val();
        $('#welcome').html('欢迎回来：'+loginName); //修改页头上的欢迎消息
      }else { //登录失败
        $('.modal .alert').html('登录失败！错误消息为：'+txt);
      }
    }
  });
});

/**功能点4：页面加载完成后，异步请求产品列表**/
$(function(){
  loadProductByPage(1);
});

/**功能点5：用户点击分页条中的页号时，实现数据的异步加载**/
$('.pager').on('click','a',function(event){
  event.preventDefault(); //阻止跳转行为
  //获取要跳转的页号
  var pageNum = $(this).attr('href');
  loadProductByPage(pageNum);
});

//分页加载商品数据，并动态创建分页条
function loadProductByPage(pageNum){
  $.ajax({
    url: 'data/2_product_select.php?pageNum='+pageNum,
    success: function(pager){
      //遍历读取到分页器对象，拼接HTML，追加到DOM树
      var html = ''; 
      $.each(pager.data,function(i,p){
        html += `
          <li>
              <a href=""><img src="${p.pic}"></a>
              <p>￥${p.price}</p>
              <h1><a href="">${p.pname}</a></h1>
              <div>
                  <a href="" class="contrast"><i></i>对比</a>
                  <a href="" class="p-operate"><i></i>关注</a>
                  <a href="${p.pid}" class="addcart"><i></i>加入购物车</a>
              </div>
          </li>
        `;
      });
      $('#plist ul').html(html);
      //根据返回的分页数据，动态创建分页条内容
      pageNum=parseInt(pageNum);
      console.log(typeof (pageNum));
      var html = '';
      if(pageNum-2>0){
        html += `<li><a href="${pageNum-2}">${pageNum-2}</a></li> `;
      }
      if(pageNum-1>0){
        html += `<li><a href="${pageNum-1}">${pageNum-1}</a></li> `;
      }
      html += `<li class="active"><a href="#">${pageNum}</a></li> `;
      if(pageNum+1<=pager.pageCount){
        html += `<li><a href="${pageNum+1}">${pageNum+1}</a></li> `;
      }
      if(pageNum+2<=pager.pageCount){
        html += `<li><a href="${pageNum+2}">${pageNum+2}</a></li> `;
      }
      $('.pager').html(html);
    }
  });
}


/**功能点6：用户点击“添加到购物车”则实现商品的购物车添加**/
//“添加到购物车”按钮是后来动态添加的，必需使用事件代理
$('#plist').on('click','.addcart',function(event){
  event.preventDefault();
  var pid = $(this).attr('href');
  //发起异步请求
  $.ajax({
    type: 'POST',
    url: 'data/3_cart_add.php',
    data: {uname:loginName,pid:pid},
    success: function(obj){
      alert('添加成功！该商品已购买的数量：'+obj.count);
    }
  });
});


/**功能点7：点击“查看购物车”跳转到购物车详情页，传递当前登录的用户名**/
$('div#header').on('click','#settle_up',function(){
  //JS跳转到购物车详情页
  location.href='shoppingcart.html?loginName='+loginName;
});

