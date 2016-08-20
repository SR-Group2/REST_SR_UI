    // File to Send to Server
    var validatedFiles = [];
    // Old File Name
    var deletedImageName = [];
    // Input File Element
    var inputFile;

    //Example 2
    function initJqueryFiler(fileElement, uploadImagesArr){
        inputFile = $(fileElement)[0];
        $(fileElement).filer({
            extensions: ['jpeg', 'jpg', 'png', 'gif', 'bmp'],
            changeInput: '<a class="jFiler-input-choose-btn blue btn-block" id="browse_gallery"><i class="glyphicon glyphicon-circle-arrow-up"></i> Browse Gallery</a>',
            showThumbs: true,
            theme: "dragdropbox",
            templates: {
                box: '<ul class="jFiler-items-list jFiler-items-grid"></ul>',
                item: '<li class="jFiler-item">\
                            <div class="jFiler-item-container">\
                                <div class="jFiler-item-inner">\
                                    <div class="jFiler-item-thumb">\
                                        <div class="jFiler-item-status"></div>\
                                        <div class="jFiler-item-info">\
                                            <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name | limitTo: 25}}</b></span>\
                                            <span class="jFiler-item-others">{{fi-size2}}</span>\
                                        </div>\
                                        {{fi-image}}\
                                    </div>\
                                    <div class="jFiler-item-assets jFiler-row">\
                                        <ul class="list-inline pull-left">\
                                            <li>{{fi-progressBar}}</li>\
                                        </ul>\
                                        <ul class="list-inline pull-right">\
                                            <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
                                        </ul>\
                                    </div>\
                                </div>\
                            </div>\
                        </li>',
                itemAppend: '<li class="jFiler-item">\
                                <div class="jFiler-item-container">\
                                    <div class="jFiler-item-inner">\
                                        <div class="jFiler-item-thumb">\
                                            <div class="jFiler-item-status"></div>\
                                            <div class="jFiler-item-info">\
                                                <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name | limitTo: 25}}</b></span>\
                                                <span class="jFiler-item-others">{{fi-size2}}</span>\
                                            </div>\
                                            {{fi-image}}\
                                        </div>\
                                        <div class="jFiler-item-assets jFiler-row">\
                                            <ul class="list-inline pull-left">\
                                                <li><span class="jFiler-item-others">{{fi-icon}}</span></li>\
                                            </ul>\
                                            <ul class="list-inline pull-right">\
                                                <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
                                            </ul>\
                                        </div>\
                                    </div>\
                                </div>\
                            </li>',
                itemAppendToEnd: false,
                removeConfirmation: false,
                progressBar: '<div class="bar"></div>',
                _selectors: {
                    list: '.jFiler-items-list',
                    item: '.jFiler-item',
                    progressBar: '.bar',
                    remove: '.jFiler-item-trash-action'
                }
            },
            addMore: false,
            uploadFile: {
                error: function(el){
                    el.find(".jFiler-jProgressBar").hide();
                }
            },
            files: uploadImagesArr,
            afterShow: function(){
                $.each(inputFile.files, function(index, file) {
                    validatedFiles.push(file);
                });
            },
            onRemove: function(itemEl, currentFile, id, listEl, boxEl, newInputEl, inputEl){

                var isImageFromServer = itemEl.find('ul:first i').hasClass('icon-jfi-file-image');

                if (isImageFromServer){
                    // Get Deleted Image name
                    deletedImageName.push(currentFile.name);
                } else {
                    var temp;
                    $.each(validatedFiles, function(index, item) {
                        if (item.name === currentFile.name) {
                            temp = item;
                            return;
                        }
                    });
                    validatedFiles.splice(validatedFiles.indexOf(temp), 1);                
                }
            },
            onEmpty: function () {
                alert('onEmpty');
            },
            captions: {
                button: "Choose Files",
                feedback: "Choose files To Upload",
                feedback2: "files were chosen",
                drop: "Drop file here to Upload",
                removeConfirmation: "Are you sure you want to remove this file?",
                errors: {
                    filesLimit: "Only {{fi-limit}} files are allowed to be uploaded.",
                    filesType: "Only Images are allowed to be uploaded.",
                    filesSize: "{{fi-name}} is too large! Please upload file up to {{fi-maxSize}} MB.",
                    filesSizeAll: "Files you've choosed are too large! Please upload files up to {{fi-maxSize}} MB."
                }
            }
        });
    }
