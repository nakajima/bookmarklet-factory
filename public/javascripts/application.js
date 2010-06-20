// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function showTheCodes() {
  var source = $('source');
  var wrapper = $('source').wrap('div');
  wrapper.hide();
  source.show();
  source.addClassName('visible');
  wrapper.slideDown({
    duration: 0.2,
    afterFinish: function() {
      wrapper.replace(source)
    }
  });
}

function hideTheCodes() {
  var source = $('source');
  var wrapper = $('source').wrap('div');
  wrapper.slideUp({
    duration: 0.2,
    afterFinish: function() {
      wrapper.replace(source)
      source.removeClassName('visible');
      source.hide();
    }
  });
}

function toggleTheCodes() {
  var source = $('source');
  if (source.hasClassName('visible')) {
    hideTheCodes();
  } else {
    showTheCodes();
  }
}
