module TopicsHelper

  def render_topic_author(user)
    user.email
  end

  def render_topic_attach(topic)
    if(topic.attach.present?)
      content_tag("div", image_tag(topic.attach.url(:medium), :class => "img-rounded"))

    end
  end

end
