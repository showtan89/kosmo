<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="comment_area clearfix">
	<h4 class="headline">2 Comments</h4>
	<ol>
		<li>
			<div class="d-flex">
				<div class="comment-content" style="width: 100% !important">
					<div class="d-flex align-items-center justify-content-between">
						<h5>'+this.memberId+'</h5>
						<span class="comment-date">'+this.rcommentRegdate+'&nbsp&nbsp&nbsp&nbsp <div class="btn-group">
						<button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    Delete <span class="caret"></span>
						</button>
							<ul class="dropdown-menu">
								<li onclick=deleteAccept('+this.rCommentNumber+')>Accept</li>
								<li>Cancel</li>
							</ul>
					</div></span>
					</div>
					'+this.rCommentContent+'
				</div>
			</div>
		</li>
	</ol>
</div>



<!-- Single button -->






str = '<div class="comment_area clearfix"><h4 class="headline">'+cnt+' Comments</h4>';
		
$(data).each(
		function(){
			/*str += '<hr><ol><li><div class="d-flex"><div class="comment-content" style="width: 100% !important"><div class="d-flex align-items-center justify-content-between"><h5>'+this.memberId+'</h5><span class="comment-date commentSpan">'+this.rcommentRegdate+'&nbsp&nbsp&nbsp&nbsp<a class="active"><button class="deleteButton" value="'+this.rCommentNumber+'">Delete</button></a></span> </div><span>'+this.rCommentContent+'</span></div></div></li></ol>'
		*/
		str +=	'<button id="deleteButton">Delete</button>';
		});
		
str+= '</div>';