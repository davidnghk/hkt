module ApplicationHelper
  include LetterAvatar::AvatarHelper

  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def custom_bootstrap_flash
      flash_messages = []

      flash.each do |type, message|
        type = 'success' if type == 'notice'
        type = 'error'   if type == 'alert'

        text = "toastr.#{type}('#{message}');"
        flash_messages << text.html_safe if message
      end
      flash_messages = flash_messages.join('\n')

      "<script>$(document).ready(function() { #{ flash_messages } });</script>".html_safe
    end

  def user_avatar(user, size=40)
    if current_user.avatar.attached?
      current_user.avatar.variant(resize: "#{size}x#{size}!")
    else
      letter_avatar_url(current_user.name, 30)
      # lavatar_tag(user[0,1], size, key: userassignment.work.id*1234)
    end
  end

  def name_avatar(name, size=40)
      lavatar_tag(name[0,1], size, key: name[0,2]*23124)
  end

	def flash_class (type)
	  case type
	     when 'error'
	         "alert-error"
	     when 'notice'
	         "alert-info"
	     when 'alert'
	         "alert-block"
	     when 'success'
	         "alert-success"
	      else
	         type.to_s
	   end
	 end

  def status_icon(status)
    case status   
      when 'Open'
        'folder_open'
      when 'Pending'
        'move_to_inbox'
      when 'Working'
        'assignment_ind'
      when 'Rating'
        'assessment'
      when 'Closed'
        'folder'
      else
        "Error : contact_support"
      end
  end

  def link_to_add_fields(name, f, association)
      new_object = f.object.send(association).klass.new
      id = new_object.object_id
      fields = f.fields_for(association, new_object, child_index: id) do |builder|
        render(association.to_s.singularize + "_fields", f: builder)
      end
      link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
    end

end

