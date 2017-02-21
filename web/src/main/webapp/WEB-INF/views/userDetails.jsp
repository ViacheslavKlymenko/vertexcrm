<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<!-- saved from url=(0048)https://vertex-academy.com/lecturer-bakumov.html -->
<html lang="en" charset="UTF-8">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Vertex Crm</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="./css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="css/slick.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="icon" href="https://vertex-academy.com/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="https://vertex-academy.com/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="https://vertex-academy.com/apple-touch-icon.png">
    <script type="text/javascript" async="" src="javascript/watch.js"></script>
    <script async="" src="javascript/analytics.js"></script>
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-62731553-2', 'auto');
        ga('send', 'pageview');

    </script>
    <style id="style-1-cropbar-clipper">/* Copyright 2014 Evernote Corporation. All rights reserved. */
    .en-markup-crop-options {
        top: 18px !important;
        left: 50% !important;
        margin-left: -100px !important;
        width: 200px !important;
        border: 2px rgba(255, 255, 255, .38) solid !important;
        border-radius: 4px !important;
    }

    .en-markup-crop-options div div:first-of-type {
        margin-left: 0px !important;
    }

    .colortext {
        background-color: #ffe; /* Цвет фона */
        color: black; /* Цвет текста */
    }

    .buttonText {
        color: black;
    }
    </style>
</head>
<body class="inside footer-under">
<!-- Yandex.Metrika counter -->
<script type="text/javascript">
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function () {
            try {
                w.yaCounter37563830 = new Ya.Metrika({
                    id: 37563830,
                    clickmap: true,
                    trackLinks: true,
                    accurateTrackBounce: true,
                    webvisor: true
                });
            } catch (e) {
            }
        });

        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () {
                n.parentNode.insertBefore(s, n);
            };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else {
            f();
        }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript>&lt;div&gt;&lt;img src="https://mc.yandex.ru/watch/37563830" style="position:absolute; left:-9999px;" alt="" /&gt;&lt;/div&gt;</noscript>
<!-- /Yandex.Metrika counter -->
<div class="nav navbar navbar-fixed-top navbar-hide">
    <div class="container"><a href="https://vertex-academy.com/index.html" class="logo pull-left"></a>
        <button data-toggle="collapse" data-target=".navbar-collapse" class="navbar-toggle"><span
                class="glyphicon glyphicon-align-justify"></span></button>
        <div class="collapse navbar-collapse navbar-responsive-collapse">
            <ul class="navbar-nav">
                <li><a href="https://vertex-academy.com/index.html#courses">Курсы</a></li>
                <li><a href="https://vertex-academy.com/index.html#about">о нас</a></li>
                <li><a href="https://vertex-academy.com/index.html#faq">FAQ</a></li>
                <li><a href="https://vertex-academy.com/index.html#feedback">Отзывы</a></li>
                <li><a href="https://vertex-academy.com/index.html#lecturers">Преподаватели</a></li>
                <li><a href="https://vertex-academy.com/tutorials/index.php" class="link">Блог</a></li>
                <li><a href="https://vertex-academy.com/index.html#contacts">Контакты</a></li>
                <li><a href="https://vertex-academy.com/tutorials/en/login/">Войти </a></li>
            </ul>
        </div>
    </div>
</div>
<div class="page gray-page mh100">
    <div class="container pt1_5">
        <div align="center">
            <%--<button id="allowedit" class="buttonText">Allow editing</button>--%>
            <%--user - то что отсылается в контроллер--%>
            <%--<form:form action="saveUserData" method="post" commandName="user" enctype="multipart/form-data">--%>
            <form:form action="saveUserData" method="post" commandName="user" enctype="multipart/form-data">
            <input type="hidden" name="user" value="user"/>
            <table bordercolor="red" border="2">
                <c:if test="${!empty msg}">
                    <tr>
                            <%--<td>--%>
                        <div name="msg">${msg}</div>
                            <%--<input type="number" name="msg" class="buttonText"></td>--%>
                            <%--</td>--%>
                    </tr>
                    <%--<input type="number" name="errorPhoto" class="buttonText">--%>
                </c:if>

                <tr>
                    <td>user Id</td>
                    <td><form:label path="userId">${user.userId}</form:label>
                        <form:hidden path="userId"></form:hidden></td>
                </tr>
                <tr>
                    <td>E-mail</td>
                    <td><form:input id="email" class="buttonText" type="text" size="40" value="${user.email}"
                                    path="email"/>
                    <td><form:errors path="email"/></td>
                </tr>
                <tr>
                    <td>Last name</td>
                    <td><form:input id="lastName" class="buttonText" type="text" size="40" value="${user.lastName}"
                                    path="lastName"/></td>
                    <td><form:errors path="lastName"/></td>
                </tr>
                <tr>
                    <td>First name</td>
                    <td><form:input id="firstName" class="buttonText" type="text" size="40"
                                    value="${user.firstName}" path="firstName"/></td>
                    <td><form:errors path="firstName"/></td>

                </tr>
                <tr>
                    <td>Passport scan</td>
                    <td><img src="data:image/jpeg;base64,${user.passportScanAsString}" alt="No scan passport"></td>
                    <td><input type="file" name="imagePassportScan" accept="image/*"/></td>
                        <%--<input type="hidden" name="passportScan"/>--%>
                    <form:hidden path="passportScan"/>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><img src="data:image/jpeg;base64,${user.photoAsString}" alt="No photo"></td>
                    <td><input type="file" name="imagePhoto" accept="image/*"/></td>
                    <form:hidden path="photo"/>
                        <%--<form:hidden path="photo"></form:hidden>--%>
                </tr>
                <tr>
                    <td>Discount</td>
                    <td><form:input id="discount" class="buttonText" type="number" size="40"
                                    value="${user.discount}" path="discount"/></td>
                    <td><form:errors path="discount"/></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td>
                        <form:input id="phone" class="buttonText" type="text" size="40" value="${user.phone}"
                                    path="phone"/></td>
                    <td><form:errors path="phone"/></td>

                </tr>
            </table>

            <br/>
            <br/>
            <br/>
            <p>User roles</p>
            <table bordercolor="red" border="2">
                <c:if test="${empty user.role}">
                    <tr>
                        <td>Error! The current user does not have roles in the system!</td>
                    </tr>
                </c:if>

                <c:if test="${!empty user.role}">
                    <tr>
                        <td>
                            <form:select path="role" items="${allRoles}"/>
                        </td>
                    </tr>
                </c:if>
            </table>
            <br/>
            <br/>
            <br/>
            <p>User certificates</p>
            <table>
                <table bordercolor="red" border="2">
                    <tr>
                        <th width="50px">№</th>
                        <th width="100px">Certification date</th>
                        <th width="150px">Course name</th>
                        <th width="150px">Language</th>
                    </tr>
                    <c:forEach items="${certificates}" var="certificates" varStatus="status">
                        <tr>
                            <td align="center">${status.count}</td>

                                <%--<td><form:input name="certificates[${status.index}].certificationDate"--%>
                                <%--value="${certificates.certificationDate}" class="buttonText"--%>
                                <%--path="certificationDate"/>--%>
                                <%--</td>--%>

                            <td><input name="certificates[${status.index}].certificationDate"
                                       value="${certificates.certificationDate}" class="buttonText" disabled="true"/>
                            </td>

                            <td><input name="certificates[${status.index}].courseName"
                                       value="${certificates.courseName}" class="buttonText" disabled="true"/>
                            </td>
                            <td><input name="certificates[${status.index}].language"
                                       value="${certificates.language}" class="buttonText" disabled="true"/>
                            </td>
                        </tr>
                    </c:forEach>
                </table>


                <td colspan="2" align="center">
                    <input id="save" class="buttonText" type="submit" value="Save"/>
                </td>
                </form:form>
        </div>
    </div>
</div>
<div class="footer">
    <div class="container">
        <div class="right">
            <div class="social-block"><a href="https://www.facebook.com/vertex.academy" class="fb"></a><a
                    href="https://vk.com/vertex_academy" class="vk"></a><a href="https://twitter.com/vertex_academy"
                                                                           class="tw"></a><a
                    href="https://vertex-academy.com/lecturer-bakumov.html#" class="gp"></a><a
                    href="https://vertex-academy.com/lecturer-bakumov.html#" class="in"></a></div>
        </div>
        <div class="left">
            <div class="row">
                <div class="col-md-5">
                    <div class="copyright"><a href="https://vertex-academy.com/lecturer-bakumov.html#" class="logo"></a>©
                        2015, Все права защищены
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="cont"><span>г. Киев, ул. Мечникова, 16, оф. 4-1</span>|<span>(050) 205 77 99, (098) 205 77 99</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="myModal" class="modal modal-gray">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" data-dismiss="modal" aria-hidden="true" class="close"></button>
            </div>
            <div class="modal-body">
                <div class="send-mail">
                    <form id="sendmessage">
                        <div class="title">Записаться на курс</div>
                        <div class="desc">Оставьте Ваши контакты<br>и мы свяжемся с Вами в течение 24 часов</div>
                        <div class="row">
                            <div class="col-sm-6">
                                <input type="text" placeholder="Имя" name="fmail[name]" class="form-control"
                                       required="">
                            </div>
                            <div class="col-sm-6">
                                <input type="text" placeholder="Телефон" name="fmail[phone]" class="form-control"
                                       required="" pattern="[0-9]{6,}">
                            </div>
                        </div>
                        <textarea placeholder="Комментарий" name="fmail[text]" class="form-control"
                                  required=""></textarea>
                        <input type="submit" value="Записаться на курс" class="btn btn--v1 btn-block">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="javascript/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="javascript/bootstrap.min.js"></script>
<script src="./javascript/typed.js"></script>
<script src="javascript/slick.min.js"></script>
<script type="text/javascript" src="javascript/main.js"></script>

</body>
</html>