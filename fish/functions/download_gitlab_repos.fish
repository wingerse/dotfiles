function download_gitlab_repos -a host -a group -a token
	set -l header "PRIVATE-TOKEN: $token"
	set -l url "https://$host/api/v4/groups/$group?include_subgroups=true"
	set -l res (curl -s --header $header $url)
	set -l ssh_urls (echo $res | jq -r ".projects[].ssh_url_to_repo")
	echo $ssh_urls
	for repo in $ssh_urls
		git clone $repo
		pushd (basename $repo ".git")
		git submodule update --init --recursive
		popd
	end
end
