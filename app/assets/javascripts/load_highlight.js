$(document).ready(function() {
  $('div.code').each(function(i, block) {
    hljs.highlightBlock(block);
  });
});
