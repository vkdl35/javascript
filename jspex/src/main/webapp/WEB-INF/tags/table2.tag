<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ attribute name="no" required="true" type="java.lang.Interger"%>
<!-- attribute는 JSP에서 값을 가져올 때 사용하는 문법입니다. name으로 태그에 있는 값을 가져옴
type 값을 가져올 때 사용하는 자료형을 말합니다.
required : true (자료형 무조건 사용), false (자료형과 관계없이 사용) -->

<!-- 
variable : 출력 여부 및 변수이름을 추가할 때 사용합니다. (return에 사용할 이름)
variable-calss 자료형을 구분하게 됨. 단, required false일 경우 사용 안해도 됨
scope는 출력형태:
AT_END는 태그 종료 후 출력
AT_BEGIN은 태그 시작에서 종료 사이에 출력
NESTED는 forEach문 사용시 적용함
 -->
<%@ variable name-given="returncall" variable-class="java.lang.Integer" scope="AT_END"%>
<%@ variable name-given="returncall2" scope="AT_END"%>
<%@ taglib prefix="lk" uri="http://java.sun.com/jsp/jstl/core"%>
<lk:set var="returncall" value="${no}"></lk:set>
<lk:set var="returncal2l" value="${no2}"></lk:set>

