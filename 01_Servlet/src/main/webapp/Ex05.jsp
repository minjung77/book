<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>학생 정보 입력</title>
</head>
<body>
    <div align="center">
        <hr width="30%" color="gray">
        <h2>학생 정보 입력 폼 페이지</h2>
        <hr width="30%" color="gray">
        <br><br>

        <form method="post" action="student">
            <table border="1">
                <tr>
                    <th>학생 학번</th>
                    <td><input type="text" name="hakbun"></td>
                </tr>
                <tr>
                    <th>학생 이름</th>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <th>학생 학과</th>
                    <td><input type="text" name="major"></td>
                </tr>
                <tr>
                    <th>학생 나이</th>
                    <td><input type="text" name="age"></td>
                </tr>
                <tr>
                    <th>학생 연락처</th>
                    <td><input type="text" name="phone"></td>
                </tr>
                <tr>
                    <th>학생 과목</th>
                    
                    <td>
                        <input type="checkbox" name="subject" value="Java">Java &nbsp;
                        <input type="checkbox" name="subject" value="HTML">HTML &nbsp;
                        <input type="checkbox" name="subject" value="JSP">JSP &nbsp; <br>
                        <input type="checkbox" name="subject" value="Python">Python &nbsp;
                        <input type="checkbox" name="subject" value="SPRING">SPRING &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="전송">  &nbsp;
                        <input type="reset" value="취소">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
