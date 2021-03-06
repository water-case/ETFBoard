<div class="container">
  <div class="py-3 text-center">
    <h2>글수정</h2>
  </div>

  <div class="text-center">	
    <form class="needs-validation" method="post" action="${contextPath}/board/update.do">
      <input type="hidden" name="boardIndex" value="${boardContents.boardIndex}">
      <div class="row">
        <div class="col-md-3 mb-3"></div>
        <div class="col-md-6 mb-3">
          <input type="text" class="form-control" name="title" value="${boardContents.title}" required maxlength='25'>
        </div>
      </div>
      <div class="row">
        <div class="col-md-3 mb-3"></div>
        <div class="col-md-6 mb-3">
          <textarea class="form-control" name="text" style="margin-top: 10px; margin-bottom: 10px; height: 400px;" required maxlength='400'>${boardContents.text}</textarea>
        </div>
      </div>
      <input type="hidden" name="name" value="${member.name}"/>
      <hr class="mb-4">
      <button class="btn btn-dark btn-lg " type="submit">글수정</button>
    </form>
  </div>
</div>