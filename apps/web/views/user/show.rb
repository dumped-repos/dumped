module Web::Views::User
  class Show
    include Web::View

    def repo_update_abandoned_status_link(repo)
      if repo.abandoned
        # TODO: Update mark_abandoned comtrollet to accept params
        link_to 'Maintained', routes.root_path
      else
        link_to 'Abandoned', routes.mark_as_abandoned_repo_path(repo.id)
      end
    end
  end
end
