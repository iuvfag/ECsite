<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="./css/style.css">
		<title>商品購入履歴画面</title>
	</head>
	<body>

	<!-- 商品の購入履歴を表示、
		そして、削除のactionを呼び出すページ
		購入履歴がない場合もあるためif文で分岐させ
		メッセージを表示させよう -->

		<jsp:include page="header.jsp" />
		<div id="contents">
			<h1>商品購入履歴画面</h1>

			<s:if test="#session.purchaseHistoryInfoDTOList.size()>0">
				<table class="horizontal-list-table">
					<thead>
						<tr>
							<th><s:label value="商品名" /></th>
							<th><s:label value="ふりがな" /></th>
							<th><s:label value="商品画像" /></th>
							<th><s:label value="値段" /></th>
							<th><s:label value="発売会社名" /></th>
							<th><s:label value="発売年月日" /></th>
						</tr>

						<tbody>
							<s:iterator value="#session.purchaseHistoryInfoDTOList">
							<tr>
								<td><s:property value="productName" /></td>
								<td><s:property value="productNameKana" /></td>
								<td><img src='<s:property value="imageFilePath" />/<s:property value="imageFileName" />' width="50px" height="50px" /></td>
								<td><s:property value="price"/>円</td>
								<td><s:property value="releaseCompany" /></td>
								<td><s:property value="releaseDate" /></td>
							</tr>
							</s:iterator>
						</tbody>
				</table>

				<div class="submit_btn_box">
					<div id=".contents_btn_set">
						<s:form action="DeletePurchaseHistoryAction">
							<s:submit value="削除" class="submit_btn" />
						</s:form>
					</div>
				</div>

			</s:if>

			<s:else>
				<div class="info">
					商品購入履歴情報はありません。
				</div>
			</s:else>

		</div>

		<s:include value="footer.jsp" />

	</body>
</html>