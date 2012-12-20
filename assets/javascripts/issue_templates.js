jQuery(document).ready(function($){
  function insertAtCursor(myField, myValue) {
    //IE support
    if (document.selection) {
      myField.focus();
      sel = document.selection.createRange();
      sel.text = myValue;
    }
    //MOZILLA/NETSCAPE support
    else if (myField.selectionStart || myField.selectionStart == '0') {
      var startPos = myField.selectionStart;
      var endPos = myField.selectionEnd;
      myField.val(function(i, val) {
        return val.substring(0, startPos) + myValue + val.substring(endPos, val.length);
      });
    } else {
      myField.val(myField.val() + myValue);
    }
  }

  $('form#issue-form').on('click', '.insert_template_button', function(event) {
    var value = $('#template_selector').val();
    var textarea = $('#issue_description');
    insertAtCursor(textarea, value);
    return false;
  });
});
