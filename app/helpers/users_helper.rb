
module UsersHelper

  def first_last_name_heading(user, h: 2)
    "<h#{h}>#{first_last_name(user)}</h#{h}>".html_safe
  end

  def first_last_name(user)
    "#{ user.first_name } #{user.last_name}".strip
  end
end
