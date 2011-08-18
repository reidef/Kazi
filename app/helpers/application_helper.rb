module ApplicationHelper
  def tag_class_if(tag, text, tag_class, condition=true)
    condition ? content_tag(tag, text, :class => tag_class) : content_tag(tag, text)
  end
end
