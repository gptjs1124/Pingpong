<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/header.jsp" />


<script>
	$(function() {
		$('#form').submit(function() {
			console.log(form);
			var formData = new FormData($('#form')[0]);
			console.log(formData);
			$.ajax({
				url : "/correct/commentProc",
				type : "post",
				datatype : "json",
				data : formData,
				cache : false,
				contentType : false,
				processData : false
			}).done(function(resp) {
				if (resp) {
					alert("댓글 작성이 완료 되었습니다.")
					location.href = "/correct/correct_view?seq=${dto.seq}"
				}
			})
			return false;
		})
		
		$("#modify").click(function() {
			location.href="/correct/correct_modify?seq=${dto.seq}"
		})
		
		var checkLikeVal = ${checkLike};
		console.log(checkLikeVal);
		$(".correct_like").click(function() {
			
			var seq = $(this).data("seq");
			if(checkLikeVal) {
				$.ajax ({
					url : "/correct/likecancle",
					dataType : "json",
					type : "post",
					data : {seq:seq}
				}).done(function(resp) {
					if(resp) {
						location.href = "/correct/correct_view?seq=${dto.seq}"
					}
				})
			}else {
			
			$.ajax({
				url : "/correct/like",
				dataType : "json",
				type : "post",
				data : {seq:seq}
			}).done(function(resp) {
				if(resp) {
					location.href = "/correct/correct_view?seq=${dto.seq}"
				}
			})
			}
			
		})
		
		
		$("#delete").click(function() {
			var seq = $(this).data("seq");
			$.ajax({
				url : "/correct/delete",
				dataType : "json",
				type : "post",
				data : {seq:seq}
			}).done(function(resp) {
				if(resp) {
					location.href = "/correct/correct_list"
				}
			})
			
		})
	
	$(".comment_delete").click(function(){
				var result = confirm("댓글을 삭제 하시겠습니까?");
				var seq = $(this).data("seq");
				if(result){
					$.ajax({
						url:"/correct/commentDelete",
						dataType:"json",
						data:"post",
						data:{
							seq:seq
						}
					}).done(function(resp){
						if(resp){
							alert("댓글이 삭제되었습니다.");
							location.href="/correct/correct_view?seq=${dto.seq}"
						}
					})
				}
			})		
	})
		
		
</script>

<div id="subWrap" class="hdMargin">
	<section id="subContents">
		<article id="discussion_view" class="viewPage_style1 inner1200 clearfix">
			<div class="body_left">
				<div class="card_body">
					<div class="title">${dto.title}</div>
					<div class="userInfo_s1">
						<div class="thumb"><img src="/upload/member/${dto.id}/${dto.thumNail}"/></div>
						<div class="info">
							<p class="userId">${dto.writer}</p>
							<p class="writeDate">${dto.write_date}</p>
						</div>
					</div>
					<div class="language">${dto.language}</div>
					<div class="contents ">
						<div class="originTxt">${dto.contents}</div>
					</div>
					
					<div class="countList">
						<ul>
							<li><i class="fa fa-eye"></i> ${dto.view_count}</li>			
							<li><i class="fa fa-commenting-o" aria-hidden="true"></i> ${dto.reply_count}</li>
							<li>
								<button class="correct_like" data-seq ="${dto.seq}">
									<i class="fa fa-thumbs-up"></i> ${likecount}
								</button>
							</li>
						</ul>
					</div>
				</div>
				
				<div class="">
					<div class="comment_wrap">
						<section class="comment_write card_body">
							<div class="tit_s2">
								<h3>댓글쓰기</h3>
							</div>
							<div class="comment_box">
								<form id="form">
									<input type="hidden" name="writer" value="박선호2"> 
									<input type="hidden" name="title" value="안녕하세요"> 
									<input type="hidden" name="parent_seq" value="${dto.seq}">
									<input type="hidden" name="thumNail" value="${loginInfo.sysname}">
									<div class="text">
										<textarea name="contents" id="text"></textarea>
									</div>
									
									
									<div class="btnS1 right">
										<div><input type="submit" value="등록"></div>
										<div>
											<input type="reset" value="취소">
										</div>
									</div>
								</form>
							</div>
						</section>
						
						<section class="comment_list card_body">
							<div class="tit_s2">
								<h3>베스트 댓글</h3>
							</div>
							<c:forEach var="i" items="${cdto2}">
							<article>
								<div class="userInfo_s1">
									<div class="thumb"><img src="/upload/member/${cdto2.id}/${cdto2.thumNail}"/></div>
									<div class="info">
										<p class="userId">${u.writer}</p>
										<p class="writeDate">${u.write_date}</p>
									</div>
								</div>
								<div class="cont">
									<div class="contents">${u.contents}</div>
									<div class="countList">
										<ul>
											<li>
												<button class="comment_delete normal" data-seq="${u.seq}">댓글삭제</button>
											</li>
										</ul>
									</div>
								</div>
							</article>
							</c:forEach>
						</section>
						<section class="comment_list card_body">
							<div class="tit_s2">
								<h3>댓글(${fn:length(cdto)})</h3>
							</div>
							<c:forEach var="i" items="${cdto}">
							<article>
								<div class="userInfo_s1">
									<div class="thumb"><img src="/upload/member/${i.id}/${i.thumNail}"/></div>
									<div class="info">
										<p class="userId">${i.writer}</p>
										<p class="writeDate">${i.write_date}</p>
									</div>
								</div>
								<div class="cont">
									<div class="contents">${i.contents}</div>
									<div class="countList">
										<ul>
											<li>
												<button class="comment_delete normal" data-seq="${i.seq}">댓글삭제</button>
											</li>
										</ul>
									</div>
								</div>
							</article>
							</c:forEach>
						</section>
					</div>
				</div>
			</div>
			<div class="body_right card_body">
				<div class="btns_s2">
					<c:choose>
						<c:when test="${loginInfo.id == dto.id}">
							<button type="button" id="modify">글수정</button>
							<button type="button" id="delete" data-seq="${dto.seq}">글삭제</button>
							<button type="button" id="historyBack">뒤로가기</button>					
						</c:when>
						<c:otherwise>
							<button type="button" class="w100p" id="historyBack">뒤로가기</button>					
						</c:otherwise>
					</c:choose>
				</div>			
			</div>			
			
			<!--  
			<div class="write_view">
				<div>제목 : </div>
				<div>작성자 : </div>
				<div>등록 기간 : </div>
				<div>질문 언어 : </div>
				<div>유형 : ${dto.type}</div>
				<div>
					<button>조회수 : </button>
					

				</div>
				<div>내용 : </div>
				<div>댓글 ()</div>
				<button type="button" id="modify">글수정</button>
				<button type="button" id="delete" data-seq="${dto.seq}">글삭제</button>
				<span id="report"><i class="fa fa-exclamation" aria-hidden="true"></i>신고</span>
			</div>
			<div id="comment">
				<form id="form">
					<input type="hidden" name="writer" value="박선호2"> <input
						type="hidden" name="title" value="안녕하세요"> <input
						type="hidden" name="parent_seq" value="${dto.seq}">
					<div class="text">
						<textarea name="contents" id="text"></textarea>
					</div>
					<input type="submit" value="등록"> <input type="reset"
						value="취소">
				</form>
			</div>
			<br><div>베스트 댓글</div><br>
			<c:forEach var="u" items="${cdto2}">
				<div class="info">
					<p class="userId">${u.writer}</p>
					<p class="writeDate">${u.write_date}</p>
				</div>

				<div class="cont">
					<div class="contents">${u.contents}</div>
					<button class="comment_delete normal" data-seq="${u.seq}">댓글삭제</button>
				</div>
			</c:forEach>


    		<br><br><div>전체댓글</div><br>
			<c:forEach var="i" items="${cdto}">
				<div class="info">
					<p class="userId">${i.writer}</p>
					<p class="writeDate">${i.write_date}</p>
				</div>

				<div class="cont">
					<div class="contents">${i.contents}</div>
					<button class="comment_delete normal" data-seq="${i.seq}">댓글삭제</button>
				</div>
			</c:forEach>
			-->
			
		</article>
	</section>
</div>
<jsp:include page="/WEB-INF/views/correct/correct_report.jsp" />
<jsp:include page="/WEB-INF/views/footer.jsp" />