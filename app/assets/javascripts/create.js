$(document).on('ajax:success', '.favorite a', function(e) {
  if (e.detail[0][0].done == "save"){
      var post_fav = document.getElementById('post_fav')
      post_fav.innerHTML = '<a id="post_favorites__deatroy" data-remote="true" rel="nofollow" data-method="delete" href="posts/'+e.detail[0][0].post_id+'/favorites"><span style="color:red;">❤︎</span></a>'
  }
  if (e.detail[0][0].done == "destroy"){
      var post_fav = document.getElementById('post_fav')
      post_fav.innerHTML = '<a id="post_favorites_create" data-remote="true" rel="nofollow" data-method="post" href="posts/'+e.detail[0][0].post_id+'/favorites"><span>❤︎</span></a>'
  }
});
