module ApplicationHelper
  def domain_name
    name = request.domain
    name == 'herokuapp.com' ? 'campfirehacks.heroku.com' : name
  end
end
