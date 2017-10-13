// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .

$(function(){
  $(".list-title").on('click',function(){
    var task = $(this);
    var taskId = task.attr('id');

    $.ajax({
      type: "POST",
      url: "/taskid/",
      dataType: "json",
      data: { id: taskId },
      success: function(html) {
        task.parents("nav").remove();
      }
    });
  });
  $(".destroy").on('click',function(){
    var task = $(this);
    var taskId = task.attr('id');

    $.ajax({
      type: "DELETE",
      url: "/tasks/" + taskId,
      dataType: "json",
      data: { id: taskId },
      success: function(html) {
        task.parents("nav").remove();
      }
    });
  });

  $(".top > form").submit(function() {
    $('form h2').remove();
    var fd = new FormData($('form').get(0));
    $.ajax({
      type: 'POST',
      url: '/tasks',
      data: fd,
      processData: false,
      contentType: false,
      dataType: 'json'
    }).done(function(data) {
      $("form")[0].reset();
      id = data.id;
      title = data.title;
      completed = data.completed
      console.log(completed);
      var html =
        '<nav>' +
          '<ul>' +
            '<li>' +
              '<div class="list"> ' +
                '<div id=' + id + ' class="list-title">' +
                  title +
                '</div>' +
                '<div class="list-link">' +
                  '<a type="button" class="destroy" id=' + id + '>' +
                    'destroy' +
                  '</a>' +
                '</div>' +
                '<div class="list-link">' +
                  '<a href="/tasks/' + id + '/edit">edit</a>' +
                '</div>' +
                '<div class="list-link">' +
                  '<a href="/tasks/' + id + '">show</a>' +
                '</div>' +
              '</div>' +
            '</li>' +
          '</ul>' +
        '</nav>';

      if (!completed){
        $('nav:last').after(html);
      }

    }).fail(function(jqXHR, textStatus, errorThrown) {
      var errors = JSON.parse(jqXHR.responseText).errors;

      errors.forEach(function(val, index, ar) {
        $('form').prepend('<h2 class=new-error>' + val + '</h2>');
      });
    })
    return false;
  });
});
