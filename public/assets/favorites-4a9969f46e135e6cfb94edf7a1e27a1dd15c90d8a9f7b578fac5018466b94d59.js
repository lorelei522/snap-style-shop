$(document).ready(function() {
  $(".product").on("submit", ".favorite-button", function(event){
    event.preventDefault();
    var thisForm = this
    var url = "/favorites"
    var data = $(this).children().children().serialize()
    var value = $(thisForm).children().children().first().siblings().first().attr("value")
    if (value === "patch"){
      $(thisForm).children().children().first().siblings().first().remove()
    }
    data = data.split("patch").join("post")
    $.ajax({
      url: url,
      method: "post",
      data: data
    }).done(function(response){
        $(thisForm).html(response.delete_partial)
        $(thisForm).removeClass("favorite-button")
        var id = response.id
      $(thisForm).children().addClass("favorited")
      $(thisForm).children().attr("id", id)
    })
  });
  //
  $(".product").on("submit", ".favorited", function(event){
    event.preventDefault();
    var thisForm = this
    var id = $(thisForm).attr("id")
    var url = "/favorites/" + id
    var data = $(thisForm).children().serialize()
    var fullUrl = url + "?" + data;
    $.ajax({
      url: fullUrl,
      method: "delete"
    }).done(function(response){
      $(thisForm).html(response.like_partial)
      $(thisForm).parent().addClass("favorite-button")
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
;
