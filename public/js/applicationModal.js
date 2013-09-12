function Modal(){
}

Modal.prototype = {
  showModal: function(form, link, prevent){
    console.log('in showModal function');

    $(form).easyModal({
      top: 200,
      overlay: 0.7
    });

    $(link).on('click', function(e){
      console.log(link)
      $(form).trigger('openModal');
      if (prevent) {
        e.preventDefault();
      }
    });
  }
}

$(document).ready(function() {
 $('.container').hide().fadeIn(800);

  var modal = new Modal();
  modal.showModal($('#signin'), $('#signin_link'), true);
  modal.showModal($('#signup'), $('#signup_link'), true);
  modal.showModal($('#form_success'), $('#submit'), false);
})
