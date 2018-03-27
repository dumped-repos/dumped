class UserRepository < Hanami::Repository
  def by_login(login)
    users.where(login: login).one
  end

  def find(id)
    users.by_pk(id).one
  end
end
