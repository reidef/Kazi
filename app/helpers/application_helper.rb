module ApplicationHelper
  def tag_class_if(tag, text, tag_class, condition=true)
    condition ? content_tag(tag, text, :class => tag_class) : content_tag(tag, text)
  end
  
  def navlink(cntrlr_name, link_target, text = nil)
    text ||= cntrlr_name.humanize
    a_class = controller.controller_name == cntrlr_name ? "current" : nil
    link_to text, link_target, :class => a_class
  end
end
