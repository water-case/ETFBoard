<div class="container">
  <div class="py-3 text-center">
    <h2>글쓰기</h2>
  </div>

  <div class="text-center">	
    <form class="needs-validation" method="post" action="${contextPath}/board/write.do">
      <div class="row">
        <div class="col-md-3 mb-3"></div>
        <div class="col-md-6 mb-3">
          <input type="text" class="form-control" name="title" placeholder="제목을 입력해 주세요" value="" required minlength='3' maxlength='25'>
        </div>
      </div>
      <div class="row">
        <div class="col-md-3 mb-3"></div>
        <div class="col-md-6 mb-3">
          <textarea class="form-control" name="text" placeholder="내용을 입력해 주세요" style="margin-top: 10px; margin-bottom: 10px; height: 400px;" required minlength='3' maxlength='400'></textarea>
        </div>
      </div>
      <input type="hidden" name="name" value="${memberName}"/>
      <hr class="mb-4">
      <button class="btn btn-dark btn-lg " type="submit">글쓰기</button>
    </form>
  </div>
</div>