<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Article Management API</title>
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/swagger-ui/images/favicon-32x32.png" sizes="32x32" />
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/swagger-ui/images/favicon-16x16.png" sizes="16x16" />
	<link href='${pageContext.request.contextPath}/resources/swagger-ui/css/typography.css' media='screen' rel='stylesheet' type='text/css'/>
	<link href='${pageContext.request.contextPath}/resources/swagger-ui/css/reset.css' media='screen' rel='stylesheet' type='text/css'/>
	<link href='${pageContext.request.contextPath}/resources/swagger-ui/css/screen.css' media='screen' rel='stylesheet' type='text/css'/>
	<link href='${pageContext.request.contextPath}/resources/swagger-ui/css/reset.css' media='print' rel='stylesheet' type='text/css'/>
	<link href='${pageContext.request.contextPath}/resources/swagger-ui/css/print.css' media='print' rel='stylesheet' type='text/css'/>
	<script src='${pageContext.request.contextPath}/resources/swagger-ui/lib/jquery-1.8.0.min.js' type='text/javascript'></script>
	<script src='${pageContext.request.contextPath}/resources/swagger-ui/lib/jquery.slideto.min.js' type='text/javascript'></script>
	<script src='${pageContext.request.contextPath}/resources/swagger-ui/lib/jquery.wiggle.min.js' type='text/javascript'></script>
	<script src='${pageContext.request.contextPath}/resources/swagger-ui/lib/jquery.ba-bbq.min.js' type='text/javascript'></script>
	<script src='${pageContext.request.contextPath}/resources/swagger-ui/lib/handlebars-2.0.0.js' type='text/javascript'></script>
	<script src='${pageContext.request.contextPath}/resources/swagger-ui/lib/underscore-min.js' type='text/javascript'></script>
	<script src='${pageContext.request.contextPath}/resources/swagger-ui/lib/backbone-min.js' type='text/javascript'></script>
	<script src='${pageContext.request.contextPath}/resources/swagger-ui/swagger-ui.js' type='text/javascript'></script>
	<script src='${pageContext.request.contextPath}/resources/swagger-ui/lib/highlight.7.3.pack.js' type='text/javascript'></script>
	<script src='${pageContext.request.contextPath}/resources/swagger-ui/lib/marked.js' type='text/javascript'></script>
	<script src='${pageContext.request.contextPath}/resources/swagger-ui/lib/swagger-oauth.js' type='text/javascript'></script>
	
	<!-- Some basic translations -->
	<!-- <script src='lang/translator.js' type='text/javascript'></script> -->
	<!-- <script src='lang/ru.js' type='text/javascript'></script> -->
	<!-- <script src='lang/en.js' type='text/javascript'></script> -->

	<!-- CSS Library -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/lib/bootstrap.min.css" />
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/lib/font-awesome-4.3.0/css/font-awesome.min.css">
	<!-- End CSS Library -->
	<!-- Custom StyleSheet -->
	<link rel="stylesheet" href="resources/css/default.css">
	<!-- End Custom StyleSheet -->



  <script type="text/javascript">
    $(function () {
      var url = window.location.search.match(/url=([^&]+)/);
      if (url && url.length > 1) {
        url = decodeURIComponent(url[1]);
      } else {
        url = "${pageContext.request.contextPath}/api-docs";
      }

      // Pre load translate...
      if(window.SwaggerTranslator) {
        window.SwaggerTranslator.translate();
      }
      window.swaggerUi = new SwaggerUi({
        url: url,
        dom_id: "swagger-ui-container",
        supportedSubmitMethods: ['get', 'post', 'put', 'delete', 'patch'],
        onComplete: function(swaggerApi, swaggerUi){
          if(typeof initOAuth == "function") {
            initOAuth({
              clientId: "your-client-id",
              clientSecret: "your-client-secret",
              realm: "your-realms",
              appName: "your-app-name", 
              scopeSeparator: ","
            });
          }

          if(window.SwaggerTranslator) {
            window.SwaggerTranslator.translate();
          }

          $('pre code').each(function(i, e) {
            hljs.highlightBlock(e)
          });

          addApiKeyAuthorization();
        },
        onFailure: function(data) {
          log("Unable to Load SwaggerUI");
        },
        docExpansion: "none",
        apisSorter: "alpha",
        showRequestHeaders: false
      });

      function addApiKeyAuthorization(){
        var key = encodeURIComponent($('#input_apiKey')[0].value);
        if(key && key.trim() != "") {
            var apiKeyAuth = new SwaggerClient.ApiKeyAuthorization("api_key", key, "query");
            window.swaggerUi.api.clientAuthorizations.add("api_key", apiKeyAuth);
            log("added key " + key);
        }
      }

      $('#input_apiKey').change(addApiKeyAuthorization);

      // if you have an apiKey you would like to pre-populate on the page for demonstration purposes...
      /*
        var apiKey = "myApiKeyXXXX123456789";
        $('#input_apiKey').val(apiKey);
      */

      window.swaggerUi.load();

      function log() {
        if ('console' in window) {
          console.log.apply(console, arguments);
        }
      }
  });
  </script>
</head>

<body class="swagger-section">
	<div id="main" class="container-fluid">
		<div class="row col-sm-12 center-block">
			<div class="col-sm-12 card form-horizontal">
				<div id="message-bar" class="swagger-ui-wrap" data-sw-translate>&nbsp;</div>
				<div id="swagger-ui-container" class="swagger-ui-wrap"></div>
			</div>
		</div>
	</div>
</body>
</html>
