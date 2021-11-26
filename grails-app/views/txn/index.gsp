<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'txn.label', default: 'Txn')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
%{--        <a href="#list-txn" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
        <div class="nav" role="navigation">
            <ul>
%{--                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
                <li><g:link class="btn btn-primary btn-sm" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-txn" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Signer</th>
                    <th scope="col">UserDocs</th>
                    <th scope="col">Txn Type</th>
                    <th scope="col">Txn Id</th>
                    <th>Check</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${txnList}" var="txn" status="i">
                <tr>
                    <th scope="row">${i+1}</th>
                    <td>${txn.signer?.email}</td>
                    <td>${txn.docs}</td>
                    <td>${txn.txnType}</td>
                    <td>${txn.txnId}</td>
                    <td> <g:link class="btn btn-primary btn-sm" onclick="checkStatus(${txn.id})">Check</g:link></td>

                </tr>
                </g:each>
                </tbody>
            </table>
%{--            <f:table collection="${txnList}" />--}%

            <div class="pagination">
                <g:paginate total="${txnCount ?: 0}" />
            </div>
        </div>
    <script>
function checkStatus(id){
    $.ajax({
        url: "/txn/checkStatus?id="+id,
        type: "GET",
        contentType: false,
        cache: false,
        async: false,
        success: function (result) {

        }
    });

}
    </script>
    </body>
</html>
