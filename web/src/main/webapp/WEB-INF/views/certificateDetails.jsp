<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!DOCTYPE html>
<!-- saved from url=(0048)https://vertex-academy.com/lecturer-bakumov.html -->
<html>
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
    <%--suppress CommaExpressionJS --%>
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

    .en-markup-crop-options div div:first-of-type {
        margin-left: 0 !important;
    }

    .errorText125 {
        font-size: 125%;
        color: red;
    }

    .errorText100 {
        font-size: 100%;
        color: red;
    }

    .hrefText {
        font-size: 120%;
    }

    .formHeaderText1 {
        font-size: 125%;
        font-weight: bold;
    }

    .formHeaderText2 {
        font-size: 180%
    }

    .buttonText {
        color: black;
    }

    .errorField {
        background-color: #ffcccc;
        border: 2px solid red;
    }

    .table {
        width: auto;
        font-size: 115%;
        border-spacing: 10px;
    }

    .up-padding {
        padding-top: 100px;
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

        //noinspection JSValidateTypes
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
    <div class="up-padding" align="center">

        <span class="formHeaderText2">Certificate Details</span><br><br><br>

        <span class="formHeaderText1">Enter certificate ID:</span><br><br>

        <sf:form cssClass="buttonText" method="post" action="processCertificateDetails" commandName="newCertificate">
            <c:if test="${empty error}"><input type="number" name="certificationId"/></c:if>
            <c:if test="${!empty error}"><input type="number" name="certificationId" class="errorField"></c:if>
            <input type="submit" value="Send">
        </sf:form>
        <br><br>

        <c:if test="${!empty error}">
            <h3><span class="errorText125">${error}</span></h3>
        </c:if>

        <c:if test="${empty error && !empty certificate}">
            <table class="table">
                <tr>
                    <td>Certification ID:</td>
                    <td>${String.format("%05d", certificate.certificationId)}</td>
                </tr>
                <tr>
                    <td>Certificate Holder First Name:</td>
                    <td><span class="errorText100">
                            <c:if test="${empty user.firstName}">No holder assigned</c:if></span>
                        <c:if test="${!empty user.firstName}">${user.firstName}</c:if></td>
                </tr>
                <tr>
                    <td>Certificate Holder Last Name:</td>
                    <td><span class="errorText100">
                            <c:if test="${empty user.lastName}">No holder assigned</c:if></span>
                        <c:if test="${!empty user.lastName}">${user.lastName}</c:if></td>
                </tr>
                <tr>
                    <td>Certification Date:</td>
                    <td>${certificate.certificationDate}</td>
                </tr>
                <tr>
                    <td>Course Name:</td>
                    <td>${certificate.courseName}</td>
                </tr>
                <tr>
                    <td>Programming Language:</td>
                    <td>${certificate.language}</td>
                </tr>
            </table>
            <br>
        </c:if>


        <c:if test="${!empty user.photo}">
            <sf:form method="get" action="/certificateHolderPhoto">
                <input class="buttonText" type="submit" value="Show Certificate Holder Photo">
            </sf:form>
        </c:if>
        <br>

        <div class="hrefText">
            <a href="javascript:history.back();">Back</a> |
            <a href="<c:url value="/" />">Home</a>
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