<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>FileUpload Form</title>
    <style>
      #uploadFormArea {
        margin: auto;
        width: 350px;
        border: 1px solid black;
      }
      .td_title {
        font-size: xx-large;
        text-align: center;
      }
    </style>
  </head>
  <body>
    <section id="uploadFormArea">
      <form action="/yp/gallery?cmd=uploadProc" method="POST" enctype="multipart/form-data">
        <table>
          <tr>
            <td colspan="2" class="td_title">파일 업로드 폼</td>
          </tr>
          <tr>
            <td><label for="name">작성자 : </label></td>
            <td><input type="text" name="userId" id="name" value="${sessionScope.principal.id}" readonly="readonly"/></td>
          </tr>
          <tr>
            <td><label for="subject">제목 : </label></td>
            <td><input type="text" name="psubject" id="subject" /></td>
          </tr>
          <tr>
            <td><label for="filename1">파일명 : </label></td>
            <td><input type="file" name="filename1" id="filename1" /></td>
          </tr>
          <tr>
            <td colspan="2" align="center">
              <input type="submit" value="전송" />
            </td>
          </tr>
        </table>
      </form>
    </section>
  </body>
</html>