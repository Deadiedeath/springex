<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Hello, world!</title>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <!-- 기존의 <h1>Header</h1> -->
        <div class="row content">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Search </h5>
                        <form action="/todo/list" method="get">
                            <input type="hidden" name="size" value="${pageRequestDTO.size}">
                            <div class="mb-3">
                                <input type="checkbox" name="finished" >완료여부
                            </div>
                            <div class="mb-3">
                                <input type="checkbox" name="types" value="t">제목
                                <input type="checkbox" name="types" value="w">작성자
                                <input type="text" name="keyword" class="form-control" >
                            </div>
                            <div class="input-group mb-3 dueDateDiv">
                                <input type="date" name="from" class="form-control">
                                <input type="date" name="to" class="form-control">
                            </div>
                            <div class="input-group mb-3">
                                <div class="float-end">
                                    <button class="btn btn-primary" type="submit">Search</button>
                                    <button class="btn btn-info" type="reset">Clear</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- header end -->
        <!-- 기존의 <h1>Header</h1>끝 -->

        <div class="row content">
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        Featured
                    </div>
                    <div class="card-body">
                       <table class = "table">
                           <thead>
                           <tr>
                               <th>tno</th>
                               <th>title</th>
                               <th>writer</th>
                               <th>duedate</th>
                               <th>finished</th>
                           </tr>
                           </thead>
                           <tbody>
                           <c:forEach items ="${responseDTO.dtoList}" var = "dto">
                               <tr>
                                   <th scope="row"><c:out value="${dto.tno}"/></th>
                                   <td><a href ="/todo/read?tno=${dto.tno}" ><c:out value="${dto.title}"/></a></td>
                                   <td><c:out value="${dto.writer}"/></td>
                                   <td><c:out value="${dto.dueDate}"/></td>
                                   <td><c:out value="${dto.finished}"/></td>
                               </tr>

                           </c:forEach>
                           </tbody>
                       </table>
                        <div class = "float-end">

                            <ul class = "pagination flex-wrap">
                                <c:if test="${responseDTO.prev}">
                                    <li class="page-item">
                                        <a class="page-link" href="/todo/list?page=${responseDTO.start -1}">Previous</a>
                                    </li>
                                </c:if>

                                <c:forEach begin="${responseDTO.start}" end="${responseDTO.end}" var ="num">
                                    <li class = "page-item"><a class = "page-link" href="/todo/list?page=${num}">${num}</a></li>
                                </c:forEach>

                                <c:if test="${responseDTO.next}">
                                    <li class="page-item">
                                        <a class="page-link" href="/todo/list?page=${responseDTO.end + 1}">Next</a>
                                    </li>
                                </c:if>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="row content">

        <h1>Content</h1>
    </div>
    <div class="row footer">
        <!--<h1>Footer</h1>-->

        <div class="row   fixed-bottom" style="z-index: -100">
            <footer class="py-1 my-1 ">
                <p class="text-center text-muted">Footer</p>
            </footer>
        </div>

    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>