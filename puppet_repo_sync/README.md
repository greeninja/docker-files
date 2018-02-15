### Puppet environments webhook

Checks out branches from the specified repo as different environments.

Run with:
```bash
docker run -d -e REPO=https://your-puppet-repo-here.git -p 80:80 -v /etc/puppetlabs/code/environments:/environments greeninja/puppet_repo_sync
```

If you use SSH for accessing your repo, you will need to mount the authorised ssh key into the container:

```bash
docker run -d -e REPO=git@your-git-repo-here.git -p 80:80 -v /etc/puppetlabs/code/environments:/environments -v /home/puppet/.ssh:/root/.ssh greeninja/puppet_repo_sync
```
