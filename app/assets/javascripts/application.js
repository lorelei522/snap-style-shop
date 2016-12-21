// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require_tree .

$(document).ready(function() {
  $(".product").on("submit", ".favorite-button", function(event){
    event.preventDefault();
    debugger;
    var thisForm = this
    var url = $(this).children().attr("action")
    var data = $(this).children().children().serialize()
    console.log("WOWO I was just clicked here's my action", url)
    console.log('yo heres the data dawg', data)
    $.ajax({
      url: url,
      method: "post",
      data: data
    }).done(function(response){
        console.log('heyooo im in favorite button response')
        console.log('this is "thisForm" on first ajax request', thisForm)
        $(thisForm).html(response)
        $(thisForm).removeClass("favorite-button")
        var id = $(thisForm).children().children().first().siblings().first().attr("id")
      $(thisForm).children().addClass("favorited")
      $(thisForm).children().attr("id", id)
    })
  });
  //
  $(".product").on("submit", ".favorited", function(event){
    console.log("in .product submit");
    event.preventDefault();
    debugger;
    var thisForm = this
    var id = $(thisForm).children().first().siblings().first().attr("id")
    var url = $(thisForm).attr("action")
    var data = $(thisForm).children().serialize()
    var fullUrl = url + "?" + data;
    // debugger;
    $.ajax({
      url: fullUrl,
      method: "delete"
    }).done(function(response){
      console.log("in .product done")
      console.log("this is the second ajax request")
      console.log("current 'thisForm'", thisForm)
      debugger
      $(thisForm).html(response.like_partial)
      $(thisForm.parent().addClass("favorite-button")
      $(thisForm).removeClass("favorited")
    })
  });


  $(".favorite").on("submit", ".unlike-button", function(event){
    event.preventDefault();
    var thisForm = this
    var url = $(this).children().attr("action")
    $.ajax({
      url: url,
      method: "delete",
      data: $(thisForm).children().serialize()
    }).done(function(response){
      $(thisForm).parent().remove()
    })
  });
})
