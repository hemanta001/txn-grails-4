<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'txn.label', default: 'Txn')}" />
        <asset:javascript src="fileupload.js"/>
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <style>
        .card {
            margin-top: 100px;
        }
        .btn-upload {
            padding: 10px 20px;
            margin-left: 10px;
        }
        .upload-input-group {
            margin-bottom: 10px;
        }

        .input-group>.custom-select:not(:last-child), .input-group>.form-control:not(:last-child) {
            height: 45px;
        }
        input, label {
            display:block;
        }
        </style>
    </head>
    <body>
    <div class="nav" role="navigation">
        <ul>
            <li><g:link class="btn btn-primary btn-sm" action="index">List</g:link></li>
        </ul>
    </div>


    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                    </div>
                    <div class="card-body card-block">
                        <g:form resource="${this.txn}" method="post" enctype="multipart/form-data" class="form-horizontal">


                            <div class="row form-group">
                                <div class="col-12 col-md-12">

                                    <div class="control-group">
                                        <div class='fieldcontain required'>
                                            <label for='txnId'>Txn Id
                                                <span class='required-indicator'>*</span>
                                            </label><input type="text" class="form-control" name="txnId" value="" required="" id="txnId" />
                                        </div>
                                        <div class='fieldcontain required'>
                                            <label for='notifyUser'>Notify User
                                                <span class='required-indicator'></span>
                                            </label><input type="checkbox" name="notifyUser" id="notifyUser" />
                                        </div>
                                        <div class='fieldcontain required'>
                                            <label for='signer'>Signer
                                                <span class='required-indicator'>*</span>
                                            </label><g:select class="form-control" id="signer" name="signer"
                                                                                                      from="${User.findAll()}" optionKey="id" optionValue="email"
                                                                                                       title="choose User "/>

                                        </div>
                                        <div class='fieldcontain required'>
                                            <label for='txnType'>Txn Type
                                                <span class='required-indicator'>*</span>
                                            </label>
                                            <input type="text" class="form-control" name="txnType" value="" required="" id="txnType" />
                                        </div>
<br>
                                        <div class="controls">
                                            <div class="entry input-group upload-input-group">
                                                <div class="col-md-2">
                                                    <label for="signCoordinates">SignCoordinates</label>
                                                    <input type="text" name="docs[0].signCoordinates" id="signCoordinates" placeholder="signCoordinates" class="signCoordinates form-control" required=""/>
                                                </div>
                                                <div class="col-md-1">
                                                    <label for="page">Page</label>
                                                <input type="number" name="docs[0].page" placeholder="page" id="page" value="" class="page form-control" required=""/>
                                                </div>
                                                <div class="col-md-1">
                                                    <label for="isQRCoordinates">QR</label>
                                                <input type="checkbox" name="docs[0].isQRCoordinates" id="isQRCoordinates" placeholder="isQr"  class="isQRCoordinates form-control" />
                                                </div>
                                                <div class="col-md-2">
                                                    <label for="qrCoordinates">Coordinates</label>
                                                <input type="text" name="docs[0].qrCoordinates" id="qrCoordinates" value="" placeholder="qrCoordinates" required="" class="qrCoordinates form-control" />
                                                </div>
                                                <div class="col-md-2">
                                                    <label for="file">File</label>
                                                <input class="form-control" id="file" name="file" type="file" required>
                                                </div>
                                                <div class="col-md-2">
                                                    <label for="docInfo">DocInfo</label>
                                                <input type="text" name="docs[0].docInfo" placeholder="docInfo" id="docInfo" class="docInfo form-control" value="" required=""  />
                                                </div>
                                                <div class="col-md-1">
                                                    <label for="lockPdf">LockPdf</label>

                                                    <input type="checkbox" name="docs[0].lockPdf" id="lockPdf" placeholder="lockPdf" class="lockPdf form-control"/>
                                                </div>
                                                <button class="btn btn-upload btn-success btn-add" type="button">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>


                                        </div>
                                        <button class="btn btn-primary">Upload</button>

                                    </div>


                                </div>

                            </div>

                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>
    var count = 1
    $(function () {
        $(document).on('click', '.btn-add', function (e) {
            e.preventDefault();
            var controlForm = $('.controls:first'),
                currentEntry = $(this).parents('.entry:first'),
                htmlDiv=currentEntry.clone();
            htmlDiv.find('.signCoordinates').attr({ name: "docs["+count+"].signCoordinates"});
            htmlDiv.find('.page').attr({ name: "docs["+count+"].page"});
            htmlDiv.find('.isQRCoordinates').attr({ name: "docs["+count+"].isQRCoordinates"});
            htmlDiv.find('.qrCoordinates').attr({ name: "docs["+count+"].qrCoordinates"});
            htmlDiv.find('.docInfo').attr({ name: "docs["+count+"].docInfo"});
            htmlDiv.find('.lockPdf').attr({ name: "docs["+count+"].lockPdf"});

            newEntry = $(htmlDiv).appendTo(controlForm);

            newEntry.find('input').val('');
            controlForm.find('.entry:not(:last) .btn-add')
                .removeClass('btn-add').addClass('btn-remove')
                .removeClass('btn-success').addClass('btn-danger')
                .html('<span class="fa fa-trash"></span>');
            count++;
        }).on('click', '.btn-remove', function (e) {
            $(this).parents('.entry:first').remove();
            count--;
            e.preventDefault();
            return false;
        });
    });

</script>
    </body>
</html>
