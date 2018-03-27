class UserRepository < Hanami::Repository
  def by_login(login)
    users.where(login: login).one
  end
end
