<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="order_container">
        <form method="post" action="https://www.sandbox.paypal.com/cgi-bin/webscr">
            구매요청 : <input type="index" name="cmd" value="_xclick" size="50" /><br />
            상점계정 : <input type="index" name="business" value="info-facilitator@myemail.co.kr" size="50" /><br />
            금액 : <input type="index" name="amount" value="10" size="50" /><br />
            상품이름 : <input type="index" name="item_name" value="toy" size="50" /><br />
            결제후 이동되는 페이지 : <input type="index" name="return" value="http://localhost/member/complete.asp" size="50" /><br />
            IPN메세지 받을 페이지 : <input type="index" name="notify_url" value="http://localhost/paypal/complete.asp" size="50" /><br />
            결제 취소 페이지 : <input type="index" name="cancel_return" value="http://localhost/paypal/complete.asp" size="50" /><br />
            인코딩 : <input type="index" name="charset" value="UTF-8" size="50" /><br />
            <input type="index" name="currency_type" value="USD" size="50" /><br />
            <input type="submit" value="pay" size="50" />
        </form>
    </div>

</body>
</html>