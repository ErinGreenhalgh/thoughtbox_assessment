module ApplicationHelper
  def sort_alphabetical
    current_user.links.order('title DESC')
  end
end
