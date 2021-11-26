<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'txn.label', default: 'Txn')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
${xmlvalue}
    </body>
</html>