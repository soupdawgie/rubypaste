// Launches the clipboard.js script
new Clipboard('.copy');

// Prevents from jumping to the top of the page after clicking a link
$('a.copy').click(function(e) { e.preventDefault(); });
