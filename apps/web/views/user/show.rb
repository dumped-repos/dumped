module Web::Views::User
  class Show
    include Web::View

    def repo_update_abandoned_status_link(repo)
      if repo.abandoned
        link_to 'Maintained', routes.update_abandoned_status_repo_path(repo.id, abandoned: false)
      else
        link_to 'Abandoned', routes.update_abandoned_status_repo_path(repo.id, abandoned: true)
      end
    end
  end
end
