/**功能点1：获取上一个页面传递的登录用户名**/
var s = location.search;
var loginName = s.substring( s.indexOf('=')+1 );

/**功能点2：异步加载公用的页头和页尾**/
$('div#header').load('header.php',function(){
    if(loginName) {
        $('#welcome').html('欢迎回来：'+loginName )//修改页头上的欢迎消息
    }
});
$('div#footer').load('footer.php');

/**功能点3：异步请求当前登录用户的购物车内容**/
$.ajax({
    url:'data/4_cart_detail.php?uname='+loginName,
    success:function(data){
        if(data=='[]'){
            html='';
            html+=`
                    <tr>
                        <td colspan="6">购物车为空</td>
                    </tr>
                `
        }else{
            data=JSON.parse(data);
            html='';
            $.each(data,function(i,p){
                html+=`
                <tr>
                    <td>
                        <input type="checkbox"/>
                        <input type="hidden" value="${p.did}" />
                        <div><img src="${p.pic}" alt=""/></div>
                    </td>
                    <td><a href="#">${p.pname}</a></td>
                    <td>${p.price}</td>
                    <td>
                        <button>-</button><input type="text" value="${p.count}" class="inputNum"/><button>+</button>
                    </td>
                    <td><span class="sumNum">${(p.price*p.count).toFixed(2)}</span></td>
                    <td><a href="${p.did}" class="delete">删除</a></td>
                </tr>
                `;
            });
        }
        $('table tbody').html(html);
    }
});
//加减按钮绑定事件
$('tbody').on('click','button',function(){
    var count= $(this).siblings('input').val();
    if($(this).html()==='-'){
        if(count>0){
            count--;
            $(this).siblings('input').val(count);
            var price=$(this).parent().siblings(':nth-child(3)').html();
            console.log(price);
            var psum=(price*count).toFixed(2);
            $(this).parent().siblings('td').children('span').html(psum);
        }
    }else if($(this).html()==='+'){
        count++;
        $(this).siblings('input').val(count);
        var price=$(this).parent().siblings(':nth-child(3)').html();
        console.log(price);
        var psum=(price*count).toFixed(2);
        $(this).parent().siblings('td').children('span').html(psum);
    }
    var did=$(this).parent().siblings(':nth-child(1)').children(':hidden').val();
    $.ajax({
        url:'data/5_cart_detail_update.php',
        data:{"did":did,"count":count},
        success:function(data){
            console.log(data);
            if(data=='ok'){
                //alert('ok');
            }

        }
    });
});

//改变input加载到数据库
$('tbody').on('change','input.inputNum',function(){
    var count=$(this).val();
    var did=$(this).parent().siblings(':nth-child(1)').children(':hidden').val();
    var price=$(this).parent().siblings(':nth-child(3)').html();
    var psum=price*count;
    $(this).parent().siblings('td').children('span').html(psum);
    $.ajax({
        url:'data/5_cart_detail_update.php?did='+did+"&count="+count,
        success:function(data){
            if(data=='ok'){
                //alert('ok');
            }
        }
    });
})
//点击删除更新页面修改数据库
$('tbody').on('click','a.delete',function(e){
    e.preventDefault();
    console.log('ok');
    $(this).parent().parent().hide();
    var did=$(this).attr('href')
    console.log(did);
    $.ajax({
        url:'data/6_cart_detail_delete.php?did='+did,
        success:function(data){
            //alert(data);
        }
    });
});
var sumMoney=0.00;
//点击全部
$('#selAll').change(function(){
    console.log(this.checked);
    if(this.checked){
        $('input:checkbox').attr('checked',this.checked);
    }else{
        $('input:checkbox').attr('checked',this.checked);
    }
});
//点击选择按钮显示总计金额
$('tbody').on('change','input:checkbox',function(){
    console.log('ok');
    var sumNum=$(this).parent().siblings(':nth-child(5)').children('.sumNum').html();
    console.log(sumNum);
    if(this.checked){
        sumMoney+=parseFloat(sumNum);
    }else{
        sumMoney-=parseFloat(sumNum);
    }
    $('.sumMoney').html(sumMoney.toFixed(2));
});