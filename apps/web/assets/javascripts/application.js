window.addEventListener('load', function() {
  document.getElementById('git-repo-language-select').addEventListener("change", function(){
    document.getElementById('repos-form').submit()
  });
})
