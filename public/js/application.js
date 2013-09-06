function Modal(){
}

Modal.prototype = {
  showModal: function(selector, show){
    $(selector).easyModal({
      top: 200,
      overlay: 0.2
    });

    $(show).click(function(e){
      $(selector).trigger('openModal');
      e.preventDefault();
    });

    $('#signin_form').on('submit', function(e){
      e.preventDefault();

    console.log("I've been submitted");
      $.ajax({
        type: this.method,
        url: this.action
      }) //in progress
    })
  }
}


$(document).ready(function() {

  var modal = new Modal();
  modal.showModal($('#signin'), $('#signin_link'));

})