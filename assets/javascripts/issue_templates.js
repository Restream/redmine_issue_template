jQuery(document).ready(function($){
  function insertAtCursor(areaId, text) {
    var txtarea = document.getElementById(areaId);
    var scrollPos = txtarea.scrollTop;
    var strPos = 0;
    var br = ((txtarea.selectionStart || txtarea.selectionStart == '0') ?
        "ff" : (document.selection ? "ie" : false ) );
    if (br == "ie") {
      txtarea.focus();
      var range = document.selection.createRange();
      range.moveStart ('character', -txtarea.value.length);
      strPos = range.text.length;
    }
    else if (br == "ff") strPos = txtarea.selectionStart;

    var front = (txtarea.value).substring(0,strPos);
    var back = (txtarea.value).substring(strPos,txtarea.value.length);
    txtarea.value=front+text+back;
    strPos = strPos + text.length;
    if (br == "ie") {
      txtarea.focus();
      var range = document.selection.createRange();
      range.moveStart ('character', -txtarea.value.length);
      range.moveStart ('character', strPos);
      range.moveEnd ('character', 0);
      range.select();
    }
    else if (br == "ff") {
      txtarea.selectionStart = strPos;
      txtarea.selectionEnd = strPos;
      txtarea.focus();
    }
    txtarea.scrollTop = scrollPos;
  }

  $('form#issue-form').on('click', '.insert_template_button', function(event) {
    var value = $('#template_selector').val();
    insertAtCursor('issue_description', value);
    return false;
  });

  // Show/Collapse long issue content
  $('td.issue-templates-content > div').each(function () {
    var maxHeight = 100;
    var showText = "[+]";
    var hideText = "[-]";
    var text = $(this);
    if (text.height() > maxHeight || text.height() == 0){
      text.css({ 'overflow': 'hidden','max-height': maxHeight + 'px' });

      var link = $('<a href="#">' + showText + '</a>');
      var linkDiv = $('<div></div>');
      linkDiv.append(link);
      $(this).after(linkDiv);

      link.click(function (event) {
        event.preventDefault();
        if (text.css('max-height') == 'none') {
          $(this).html(showText);
          text.css('max-height', maxHeight + 'px');
        } else {
          $(this).html(hideText);
          text.css('max-height', 'none');
        }
      });
    }
  });

});
