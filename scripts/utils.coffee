$ ->
  pathname = window.location.pathname.substr 1
  components = pathname.split '/'
  path = components.join('--') or 'home'
  section = components[0] or 'home'

  $(document.body).addClass "section-#{section} page-#{path}"
