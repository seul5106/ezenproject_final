// 로그인한 아이디를 보여주기 위해 세션값 가져오기
(async () => {
    let json = null;
    try {
        const response = await axios.get('/members/session/Id')
        json = response.data;
    } catch (e) {
        console.log(e);
    };
    let item = json.item.member_id
    document.querySelector(".admin-username").innerHTML = item
})();

document.querySelector(".admin-header").innerHTML = `<!-- 헤더 영역입니다. -->
<div class="container">
    <div class="header">
        <h2 class="pull-left admin-title">dessert40 관리시스템</h2>
        <button class="btn btn-danger pull-right admin-logout" id="logout" type="button">Logout</button>
        <span class="pull-right admin-username" id="username"></span>
        <span class="pull-right admin-login">Login :&nbsp;</span>
    </div>
</div>
<!-- 메뉴바의 색상 테마 지정 -->
<div class="navbar navbar-inverse">
    <!-- 메뉴의 영역 -->
    <div class="container">

        <!-- 헤더 및 검정 바 영역입니다. -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <!-- 회원정보 및 다른 버튼입니다. -->
            <button onclick="location.href ='/html/admin/index.html'" class="btn btn-default pull-left nav-btn btn-information" type="button">회원정보</button>
            <button onclick="location.href ='/html/admin/product.html'" class="btn btn-default pull-left nav-btn btn-information" type="button">상품관리</button>
            <button onclick="location.href ='/html/admin/order.html'" class="btn btn-default pull-left nav-btn btn-information" type="button">주문관리</button>
            <button onclick="location.href ='/html/admin/event.html'" class="btn btn-default pull-left nav-btn btn-information" type="button">이벤트</button>
            <button onclick="location.href ='/html/admin/QnA.html'" class="btn btn-default pull-left nav-btn btn-information" type="button">QnA관리</button>
        </div>
    </div>
</div>`

    

document.querySelector(".admin-logout").addEventListener("click", e => {
    Swal.fire({
        title: '로그아웃',
        text: "로그아웃 하시겠습니까?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '로그아웃',
        cancelButtonText: '취소'
    }).then(async (result) => {
        if (result.isConfirmed) {
            (async()=>{
                let json = null;
                try {
                    const response = await axios.delete("/members/logout");
                    location.href = "admin_login.html"
                } catch (error) {
                    const errorMsg = "[" + error.response.status + "] " + error.response.statusText;
                    console.log(errorMsg);
                    return;
                }
                
            })();
        }
    })
});