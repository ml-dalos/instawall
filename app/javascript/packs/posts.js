$(function () {
   $(document).on("click", '.post-like', function () {
       let post_id = $(this).data("id");
       $.ajax({
           url: "/post/like/" + post_id,
           method: "GET",
       }).done(function (responce) {
           if(responce["success"] === "true" && responce["action"] === "create") {
               $(`.post-like[data-id=${post_id}]`).attr("data-prefix", "fas").addClass("liked");
            }
           else if (responce["success"] === "true" && responce["action"] === "delete" ) {
               $(`.post-like[data-id=${post_id}]`).attr("data-prefix", "far").removeClass("liked");
           }
           console.log(responce)
           console.log( $(`.likes-count[data-id=${post_id}]`));
           $(`.likes-count[data-id=${post_id}]`).text(`${responce["likes_count"]} likes`)
       });
   });
});