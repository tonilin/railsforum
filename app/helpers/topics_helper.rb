module TopicsHelper

  def render_topic_author(user)
    user.email
  end

  def render_topic_attach(topic)
    if(topic.attach && !topic.attach.blank?)
      image_tag topic.attach.url(:medium)
    end
  end

end
