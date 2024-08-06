jQuery ->
  $('#assignment_site_id').parent().hide()
  sites = $('#assignment_site_id').html()
  $('#assignment_client_id').change ->
    client = $('#assignment_client_id :selected').text()
    escaped_client = client.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(sites).filter("optgroup[label='#{escaped_client}']").html()
    if options
      $('#assignment_site_id').html(options)
      $('#assignment_site_id').parent().show()
    else
      $('#assignment_site_id').empty()
      $('#assignment_site_id').parent().hide()