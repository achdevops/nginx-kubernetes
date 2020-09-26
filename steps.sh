export GHUSER="achdevops"
export GHREPO="nginx-kubernetes"

fluxctl install \
--git-user=${GHUSER} \
--git-email=${GHUSER}@users.noreply.github.com \
--git-url=git@github.com:${GHUSER}/${GHREPO} \
--git-path=namespaces,workloads \
--namespace=flux | kubectl apply -f -

# generate sshkey to connect with github
fluxctl identity --k8s-fwd-ns flux

#paste this key in the setting repo

# sync your repo
fluxctl sync --k8s-fwd-ns flux

git config --global user.name "Alejandro"
git config --global user.email chaconmelgarejo@gmail.com


